local common = require("common")
local shell = common.shell
local check = common.check
local cwd = common.cwd
local home = os.getenv("HOME")

local function projects_root()
  local root = os.getenv("PROJECTS_DIRECTORY") or (home .. "/Documents/Projects")
  return (root:gsub("^~", home):gsub("/+$", ""))
end

local project_sessions_store = home .. "/Library/Caches/rex-project-sessions.json"

local function read_project_sessions()
  local f = io.open(project_sessions_store, "r")
  if f == nil then return {} end
  local data = rex.json.decode(f:read("*a")) or {}
  f:close()
  return data
end

local function write_project_sessions(data)
  local f = io.open(project_sessions_store, "w")
  if f == nil then return end
  f:write(rex.json.encode(data))
  f:close()
end

local function open_project_sessions()
  local live, by_label = {}, {}
  for _, session in ipairs(check(rex.call("session.list", {})).sessions or {}) do
    live[session.session_id] = true
    by_label[session.label] = session.session_id
  end
  local open = {}
  for dir, session_id in pairs(read_project_sessions()) do
    if live[session_id] then open[dir] = session_id end
  end
  return open, by_label
end

local function project_items(root, open, by_label)
  local r = check(rex.exec({
    "find", root, "-mindepth", "1", "-maxdepth", "1", "-type", "d", "-not", "-name", ".*", "-print0",
  }))
  if not r.ok then error("cannot list " .. root .. ": " .. r.stderr, 0) end
  local items = {}
  for path in r.stdout:gmatch("[^%z]+") do
    local name = path:match("([^/]+)$")
    items[#items + 1] = {
      id = path,
      title = name,
      icon = "folder",
      detail = (open[path] or by_label[name]) and "open" or nil,
    }
  end
  table.sort(items, function(a, b) return a.title:lower() < b.title:lower() end)
  return items
end

rex.action{
  name = "go_to_project",
  title = "Go to Project…",
  description = "Pick a project and switch to its session, creating the session when the project has none.",
  category = "Projects",
  keywords = "projects directory folder session",
  run = function(ctx, args)
    local root = projects_root()
    local open, by_label = open_project_sessions()
    local dir, why = rex.ui.pick{
      title = "Go to project",
      placeholder = "Filter projects",
      items = project_items(root, open, by_label),
    }
    if dir == nil then
      if why == "cancelled" then return end
      error("no project chosen: " .. tostring(why), 0)
    end

    local name = dir:match("([^/]+)$")
    local session_id = open[dir] or by_label[name]
    if session_id == nil then
      local session = check(rex.call("session.create", {
        label = name,
        initial_windows = {
          { layout = rex.layout.block{ flavor = shell, options = { cwd = dir } } },
        },
      }))
      session_id = session.session_id
    end

    open[dir] = session_id
    write_project_sessions(open)
    rex.client.queue("session.select", { session_id = session_id })
    return { project = dir, session_id = session_id }
  end,
}

local function open_claude(ctx)
  if ctx.block_id == nil then error("no focused pane", 0) end
  check(rex.session.new_split{
    anchor_id = ctx.block_id,
    direction = "horizontal",
    side = "before",
    focus = true,
    layout = rex.layout.block{
      flavor = shell,
      options = { cwd = cwd(ctx), command = { "claude" } },
    },
  })
end

rex.action{
  name = "claude_split",
  title = "Open Claude Code on the Left",
  description = "Split the focused pane and start Claude Code on its left in the same directory.",
  category = "Projects",
  keywords = "claude agent ai",
  run = function(ctx, args)
    open_claude(ctx)
  end,
}

local terminal = "com.superlogical.terminal"
local shell = "com.superlogical.terminal.shell"
local home = os.getenv("HOME")

local function url_decode(s)
  return (s:gsub("%%(%x%x)", function(hex) return string.char(tonumber(hex, 16)) end))
end

local function cwd(ctx)
  if ctx.block_id == nil then return nil end
  local r = rex.block.call(terminal, "pwd", { block_id = ctx.block_id })
  if r == nil or r.pwd == nil or r.pwd == "" then return nil end
  local path = r.pwd:match("^file://[^/]*(/.*)$") or r.pwd
  return url_decode(path)
end

local function check(result, err)
  if err ~= nil then error(err, 0) end
  return result
end

local function shell_quote(s)
  return "'" .. s:gsub("'", "\\'") .. "'"
end

rex.action{
  name = "go_to_project",
  title = "Go to Project…",
  description = "Change the focused shell to the projects directory and open Go to Directory there.",
  category = "Projects",
  keywords = "projects directory folder cd",
  run = function(ctx, args)
    if ctx.block_id == nil then error("no focused pane", 0) end
    local root = os.getenv("PROJECTS_DIRECTORY") or (home .. "/Documents/Projects")
    root = root:gsub("^~", home)

    local process = check(rex.block.call(terminal, "process", { block_id = ctx.block_id }))
    local foreground = process.foreground and process.foreground.name or ""
    if not foreground:match("^%-?fish$") then
      error("the pane is running " .. foreground .. ", not an idle fish shell", 0)
    end

    if cwd(ctx) ~= root then
      check(rex.block.call(terminal, "write", {
        block_id = ctx.block_id,
        data = "\005\021cd " .. shell_quote(root) .. "\r",
      }))
      for _ = 1, 40 do
        if cwd(ctx) == root then break end
        rex.exec({ "sleep", "0.05" })
      end
    end

    rex.client.queue("pane.go_to_directory")
  end,
}

rex.action{
  name = "claude_split",
  title = "Open Claude Code on the Left",
  description = "Split the focused pane and start Claude Code on its left in the same directory.",
  category = "Projects",
  keywords = "claude agent ai",
  run = function(ctx, args)
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
  end,
}

local function web_url(remote)
  local host, path
  local rest = remote:match("^%a[%w+.-]*://(.+)$")
  if rest ~= nil then
    local authority
    authority, path = rest:match("^([^/]+)/(.+)$")
    if authority == nil then return nil end
    host = authority:gsub("^.*@", ""):gsub(":%d+$", "")
  else
    host, path = remote:match("^[%w%.%-]+@([^:]+):(.+)$")
  end
  if host == nil or path == nil then return nil end
  return "https://" .. host .. "/" .. path:gsub("%.git$", "")
end

rex.action{
  name = "open_remote",
  title = "Open Repository in Browser",
  description = "Open the origin remote of the focused pane's repository in the browser.",
  category = "Projects",
  keywords = "git github gitlab browser remote",
  run = function(ctx, args)
    local dir = cwd(ctx)
    if dir == nil then error("the pane has not reported its directory", 0) end
    local r = check(rex.exec({ "git", "remote", "get-url", "origin" }, { cwd = dir }))
    if not r.ok then error("no origin remote in " .. dir, 0) end
    local url = web_url((r.stdout:gsub("%s+$", "")))
    if url == nil then error("unsupported remote: " .. r.stdout, 0) end
    check(rex.exec({ "open", url }))
    return { url = url }
  end,
}

local common = require("common")
local check = common.check
local cwd = common.cwd

local function git(dir, ...)
  local r = check(rex.exec({ "git", ... }, { cwd = dir }))
  if not r.ok then return nil end
  return (r.stdout:gsub("%s+$", ""))
end

local ok, settings = pcall(require, "local")
if not ok then settings = {} end

local function ticket_id(branch)
  local name = branch:match("([^/]+)$") or branch
  local project, number, rest = name:match("^(%a%w*)%-(%d+)(.*)$")
  if project == nil or rest:match("^%w") then return nil end
  return project:upper() .. "-" .. number
end

local function ticket(ctx)
  local dir = cwd(ctx)
  if dir == nil then error("the pane has not reported its directory", 0) end
  local branch = git(dir, "branch", "--show-current")
  if branch == nil or branch == "" then error("not on a git branch", 0) end
  local id = ticket_id(branch)
  if id == nil then error("no ticket ID in branch " .. branch, 0) end
  return id
end

rex.action{
  name = "youtrack_open",
  title = "Open YouTrack Ticket of Branch",
  description = "Open the YouTrack ticket named in the current git branch in the browser.",
  category = "Tickets",
  keywords = "youtrack issue ticket branch browser",
  run = function(ctx, args)
    if settings.youtrack_url == nil then error("youtrack_url is not set in .config/rex/local.lua", 0) end
    local id = ticket(ctx)
    local url = settings.youtrack_url:gsub("/+$", "") .. "/issue/" .. id
    check(rex.exec({ "open", url }))
    return { ticket = id, url = url }
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
    local remote = git(dir, "remote", "get-url", "origin")
    if remote == nil then error("no origin remote in " .. dir, 0) end
    local url = web_url(remote)
    if url == nil then error("unsupported remote: " .. remote, 0) end
    check(rex.exec({ "open", url }))
    return { url = url }
  end,
}

local M = {}

local store = os.getenv("HOME") .. "/Library/Caches/rex-auto-labels.json"

function M.url_to_path(url)
  local path = url:match("^file://[^/]*(/.*)$") or url
  return (path:gsub("%%(%x%x)", function(hex) return string.char(tonumber(hex, 16)) end))
end

function M.project_name(dir)
  local r = rex.exec({ "git", "rev-parse", "--show-toplevel" }, { cwd = dir })
  local root = dir
  if r ~= nil and r.ok then root = r.stdout:gsub("%s+$", "") end
  return root:match("([^/]+)/*$") or root
end

local ssh_value_flags = "BbcDEeFIiJLlmOoPpQRSWw"

function M.ssh_destination(args)
  local skip = false
  for i = 2, #args do
    local arg = args[i]
    if skip then
      skip = false
    elseif arg == "--" then
      return args[i + 1]
    elseif arg:sub(1, 1) == "-" and #arg > 1 then
      for j = 2, #arg do
        if ssh_value_flags:find(arg:sub(j, j), 1, true) then
          skip = j == #arg
          break
        end
      end
    else
      return arg
    end
  end
  return nil
end

function M.short_host(host)
  if host:match("^[%d%.]+$") or host:find(":", 1, true) then return host end
  return host:match("^[^%.]+") or host
end

local function ssh_user(args)
  local cmd = { "ssh", "-G" }
  for i = 2, #args do cmd[#cmd + 1] = args[i] end
  local r = rex.exec(cmd)
  if r == nil or not r.ok then return nil end
  return r.stdout:match("\nuser ([^\n]+)") or r.stdout:match("^user ([^\n]+)")
end

function M.ssh_target(pid)
  local r = rex.exec({ "ps", "-o", "args=", "-p", tostring(pid) })
  if r == nil or not r.ok then return nil end
  local args = {}
  for word in r.stdout:gmatch("%S+") do args[#args + 1] = word end
  local dest = M.ssh_destination(args)
  if dest == nil then return nil end
  dest = dest:gsub("^ssh://", ""):gsub("^.*@", "")
  local host = M.short_host(dest:match("^%[(.-)%]") or (dest:gsub(":%d+/*$", "")))
  local user = ssh_user(args)
  if user == nil then return host end
  return user .. "@" .. host
end

function M.title_target(title)
  local user, host = (title or ""):match("^%s*([%w._-]+)@([%w._-]+)")
  if user == nil then return nil end
  return user .. "@" .. M.short_host(host)
end

local function load()
  local f = io.open(store, "r")
  if f == nil then return {} end
  local data = rex.json.decode(f:read("*a")) or {}
  f:close()
  return data
end

function M.remember(window_id, label)
  local data = load()
  data[window_id] = label
  local f = io.open(store, "w")
  if f == nil then return end
  f:write(rex.json.encode(data))
  f:close()
end

function M.is_automatic(window)
  local label = window.label or ""
  if label == "" or label:match("^Window %x+$") then return true end
  return load()[window.window_id] == label
end

return M

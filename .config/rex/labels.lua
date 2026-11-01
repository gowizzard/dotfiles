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

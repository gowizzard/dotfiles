local M = {}

M.terminal = "com.superlogical.terminal"
M.shell = "com.superlogical.terminal.shell"

function M.check(result, err)
  if err ~= nil then error(err, 0) end
  return result
end

function M.url_to_path(url)
  local path = url:match("^file://[^/]*(/.*)$") or url
  return (path:gsub("%%(%x%x)", function(hex) return string.char(tonumber(hex, 16)) end))
end

function M.cwd(ctx)
  if ctx.block_id == nil then return nil end
  local r = rex.block.call(M.terminal, "pwd", { block_id = ctx.block_id })
  if r == nil or r.pwd == nil or r.pwd == "" then return nil end
  return M.url_to_path(r.pwd)
end

return M

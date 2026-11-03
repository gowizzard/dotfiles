package.path = os.getenv("HOME") .. "/.config/rex/?.lua;" .. package.path
local labels = require("labels")

local terminal = "com.superlogical.terminal"
local remote = {}

local function focused_window(block_id)
  local view = rex.session.view{}
  if view == nil then return nil end
  for _, window in ipairs(view.windows or {}) do
    if window.focused_block_id == block_id then return window end
  end
  return nil
end

local function apply(window, label)
  if label ~= window.label then
    local _, err = rex.session.set_window_label{ window_id = window.window_id, label = label }
    if err ~= nil then return end
  end
  labels.remember(window.window_id, label)
end

local function is_ssh(process)
  return process ~= nil and process.name == "ssh"
end

local function foreground(block_id)
  local r = rex.block.call(terminal, "process", { block_id = block_id })
  if r == nil then return nil end
  return r.foreground
end

local function automatic_window(block_id)
  local window = focused_window(block_id)
  if window == nil or not labels.is_automatic(window) then return nil end
  return window
end

rex.on("terminal.pwd_changed", function(ctx, ev)
  if ev.pwd == nil or ev.pwd == "" then return end
  if is_ssh(foreground(ctx.block_id)) then return end
  local window = automatic_window(ctx.block_id)
  if window == nil then return end
  apply(window, labels.project_name(labels.url_to_path(ev.pwd)))
end)

rex.on("terminal.process_changed", function(ctx, ev)
  local process = ev.foreground
  local window = automatic_window(ctx.block_id)
  if window == nil then return end

  if is_ssh(process) then
    local target = labels.ssh_target(process.pid)
    if target == nil then return end
    remote[window.window_id] = true
    apply(window, target)
    return
  end

  if not remote[window.window_id] then return end
  remote[window.window_id] = nil
  local dir = process and process.cwd
  if dir == nil or dir == "" then return end
  apply(window, labels.project_name(dir))
end)

rex.on("terminal.title_changed", function(ctx, ev)
  if ev.owner == nil or ev.owner.name ~= "ssh" then return end
  local target = labels.title_target(ev.title)
  if target == nil then return end
  local window = automatic_window(ctx.block_id)
  if window == nil or not remote[window.window_id] then return end
  apply(window, target)
end)

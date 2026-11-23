local common = require("common")
local terminal = common.terminal
local shell = common.shell
local check = common.check

local label = "updates"
local command = { "fish", "-c", "update_all" }
local bounds = { 0.1, 0.1, 0.8, 0.8 }
local store = os.getenv("HOME") .. "/Library/Caches/rex-update-session.json"

local function find_layer(view)
  for _, window in ipairs(view.windows or {}) do
    for _, layer in ipairs(window.layers or {}) do
      if layer.kind == "floating" then
        for _, block in ipairs(layer.blocks or {}) do
          if block.label == label then return layer, block, window end
        end
      end
    end
  end
  return nil
end

local function is_live(session_id)
  for _, session in ipairs(check(rex.call("session.list", {})).sessions or {}) do
    if session.session_id == session_id then return true end
  end
  return false
end

local function has_exited(block_id)
  local process = rex.block.call(terminal, "process", { block_id = block_id })
  return process ~= nil and process.child == nil and process.last_exit ~= nil
end

local function is_running()
  local r = rex.exec({ "pgrep", "-f", table.concat(command, " ") })
  return r ~= nil and r.ok
end

rex.action{
  name = "update_all",
  title = "Update Everything",
  description = "Run the update_all fish function in a floating pane, show and hide that pane while it runs, and start over once it has finished.",
  category = "System",
  keywords = "brew homebrew dotfiles pipx upgrade update",
  run = function(ctx, args)
    local view = check(rex.session.view{})
    local layer, block, window = find_layer(view)
    if layer ~= nil and has_exited(block.block_id) then
      check(rex.session.close_layer{ layer_id = layer.layer_id })
      layer = nil
    end
    if layer ~= nil then
      local shown = layer.state ~= "minimized"
        and window.window_id == view.active_window_id
        and window.focused_block_id == block.block_id
      check(rex.session.set_layer_state{
        layer_id = layer.layer_id,
        state = shown and "minimized" or "normal",
        focus = not shown,
      })
      return { layer_id = layer.layer_id, shown = not shown }
    end

    local other = common.read_json(store).session_id
    if other ~= nil and other ~= view.session_id and is_running() and is_live(other) then
      rex.client.queue("session.select", { session_id = other })
      return { session_id = other, running = true }
    end

    local created = check(rex.session.new_layer{
      bounds = bounds,
      focus = true,
      layout = rex.layout.block{
        flavor = shell,
        label = label,
        options = { command = command, exit = { on_completion = false } },
      },
    })
    common.write_json(store, { session_id = view.session_id })
    return { layer_id = created.layer_id, running = true }
  end,
}

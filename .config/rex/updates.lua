local shell = "com.superlogical.terminal.shell"
local label = "updates"

rex.action{
  name = "update_all",
  title = "Update Everything",
  description = "Run the update_all fish function in a background tab, or focus that tab when it is already open.",
  category = "System",
  keywords = "brew homebrew dotfiles pipx upgrade update",
  run = function(ctx, args)
    local view, err = rex.session.view{}
    if err ~= nil then error(err, 0) end
    for _, window in ipairs(view.windows or {}) do
      if window.label == label then
        local _, focus_err = rex.session.focus_window{ window_id = window.window_id }
        if focus_err ~= nil then error(focus_err, 0) end
        return { window_id = window.window_id, running = true }
      end
    end

    local w, new_err = rex.session.new_window{
      window_label = label,
      focus = false,
      layout = rex.layout.block{
        flavor = shell,
        options = {
          command = { "fish", "-c", "update_all" },
          exit = { on_completion = false },
        },
      },
    }
    if new_err ~= nil then error(new_err, 0) end
    return { window_id = w.window_id, running = false }
  end,
}

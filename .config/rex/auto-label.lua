package.path = os.getenv("HOME") .. "/.config/rex/?.lua;" .. package.path
local labels = require("labels")

rex.on("terminal.pwd_changed", function(ctx, ev)
  if ev.pwd == nil or ev.pwd == "" then return end
  local view = rex.session.view{}
  if view == nil then return end
  for _, window in ipairs(view.windows or {}) do
    if window.focused_block_id == ctx.block_id then
      if not labels.is_automatic(window) then return end
      local label = labels.project_name(labels.url_to_path(ev.pwd))
      if label ~= window.label then
        local _, err = rex.session.set_window_label{ window_id = window.window_id, label = label }
        if err ~= nil then return end
      end
      labels.remember(window.window_id, label)
      return
    end
  end
end)

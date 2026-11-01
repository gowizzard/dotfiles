local home = os.getenv("HOME")
local rex_bin = home .. "/Library/Application Support/com.superlogical.rex/RexServer/Versions/Current/Rex Server.app/Contents/MacOS/rex"
local script = home .. "/.config/rex/auto-label.lua"
local pidfile = home .. "/Library/Caches/rex-auto-label.pid"
local logfile = home .. "/Library/Logs/rex-auto-label.log"

local runner = [[
if [ -f "$1" ] && kill -0 "$(cat "$1")" 2>/dev/null; then exit 0; fi
echo $$ > "$1"
while true; do
  "$2" do --autostart=false --all "$3" >> "$4" 2>&1
  sleep 5
done
]]

local function start()
  rex.exec.start({ "/bin/sh", "-c", runner, "rex-auto-label", pidfile, rex_bin, script, logfile }, {
    detach = true,
    stdout = false,
    stderr = false,
  })
end

start()

rex.action{
  name = "auto_label_restart",
  title = "Restart Automatic Tab Names",
  description = "Restart the background script that names tabs after their project, for example after editing it.",
  category = "Projects",
  run = function(ctx, args)
    rex.exec({ "pkill", "-f", script })
    os.remove(pidfile)
    start()
  end,
}

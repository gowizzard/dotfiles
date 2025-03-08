-- In this file, I define little utility functions that I use in my other files like hotkeys.lua and pathwatchers.lua.
-- I can then require this file in my other files to keep my configuration files clean and easy to read.
function reloadConfig()
    local notification = hs.notify.new({
        informativeText = "Config files in ~/.hammerspoon reloaded",
        title = "Hammerspoon",
    })
    notification:send()
    
    hs.timer.doAfter(2, function()
        notification:withdraw()
        hs.reload()
    end)
end

function muteOrUnmute()
    local zoom = hs.application.find("us.zoom.xos")
    local slack = hs.application.find("com.tinyspeck.slackmacgap")

    local function activateApp(app)
        if not app then return end

        if not app:isFrontmost() then
            app:activate()
        end

    end

    if zoom then
        activateApp(zoom)
        hs.eventtap.keyStroke({"cmd", "shift"}, "a")
    elseif slack then
        activateApp(slack)
        hs.eventtap.keyStroke({"cmd", "shift"}, "space")
    end
end

function moveWindow(direction)
    local window = hs.window.focusedWindow()
    if not window then return end

    local screen = window:screen()
    local moveLeft = (direction == "left")
    local moveRight = (direction == "right")

    if window:frame().w == screen:frame().w then
        window:moveToUnit(moveLeft and hs.layout.left50 or hs.layout.right50)
        return
    end

    if (moveLeft and window:frame().x <= screen:frame().x + 5) or 
       (moveRight and window:frame().x + window:frame().w >= screen:frame().x + screen:frame().w - 5) then

        local newScreen = moveLeft and screen:toWest() or screen:toEast()
        if newScreen then
            window:moveToScreen(newScreen, false, true)
            window:moveToUnit(moveLeft and hs.layout.right50 or hs.layout.left50)
        end
    else
        window:moveToUnit(moveLeft and hs.layout.left50 or hs.layout.right50)
    end
end

function temporaryCaffeinate()
    hs.caffeinate.set("systemIdle", true)
    hs.notify.new({informativeText = "Caffeinate enabled for 1 hour", title = "Hammerspoon"}):send()
    
    hs.timer.doAfter(3600, function()
        hs.caffeinate.set("systemIdle", false)
        hs.notify.new({informativeText = "Caffeinate automatically disabled", title = "Hammerspoon"}):send()
    end) 
end

function disableCaffeinate()
    hs.caffeinate.set("systemIdle", false)
    hs.notify.new({informativeText = "Caffeinate successfully disabled", title = "Hammerspoon"}):send()
end
# Disable system beep.
xset b off

# Define the rate for keyboard.
xset r rate 200 30

# Set xresources file.
xrdb -merge ~/.Xresources

# Start i3 window manager.
exec i3

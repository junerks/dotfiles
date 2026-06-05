local vars = require("edgar.vars")

local mainMod = "SUPER"

local execMenu = "pkill " .. vars.menu .. " || " .. vars.menuCmd
local execWinSwitcher = "pkill " .. vars.menu .. " || " .. vars.windowSwitcherCmd
local execStatusBar = "pkill " .. vars.statusBar .. " && " .. vars.statusBar
local execColorPicker = "pkill " .. vars.colorpicker .. " || " .. vars.colorpickerCmd
local execClipboard = ""

hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("swapwithmaster"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("orientationleft"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.layout("orientationtop"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(execMenu))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd(execWinSwitcher))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(vars.terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(vars.fileManager))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd(vars.screenLock))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(execStatusBar))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(execColorPicker))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(execClipboard))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("~/.local/bin/screenshot"))
hl.bind("Print", hl.dsp.exec_cmd("~/.local/bin/screenshot"))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

for i = 1, 7 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + slash", hl.dsp.workspace.toggle_special("hidden1"))
hl.bind(mainMod .. " + SHIFT + slash", hl.dsp.window.move({ workspace = "special:hidden1" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + Control_L", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + ALT_L", hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"), { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

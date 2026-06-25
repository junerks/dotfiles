hl.config({
	input = {
		kb_layout = "us,es",
		kb_options = "grp:alt_shift_toggle",

		accel_profile = "flat",
		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.3,
		},
		repeat_rate = 35,
		repeat_delay = 200,
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "dell0a20:00-0488:101a-touchpad",
	accel_profile = "flat",
})

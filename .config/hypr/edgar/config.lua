hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 15,

		border_size = 2,

		col = {
			active_border = "rgb(203, 166, 247)",
			inactive_border = "rgb(30, 30, 46)",
		},

		layout = "master",
	},

	decoration = {
		rounding = 20,
		rounding_power = 0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 5,
			popups = true,
		},
	},

	animations = {
		enabled = true,
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
})

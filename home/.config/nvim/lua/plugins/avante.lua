return {
	"yetone/avante.nvim",
	enable = false,
	event = "VeryLazy",
	lazy = false,
	opts = {
		provider = "copilot",
		windows = {
			wrap = true,
			sidebar_header = {
				align = "left",
				rounded = false,
			},
		},
	},
	build = ":AvanteBuild source=false",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"zbirenbaum/copilot.lua",

		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = true,
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}

return {
	"brenoprata10/nvim-highlight-colors",
	event = "VeryLazy",
	config = function()
		local r = require("utils.remaps")
		local c = require("nvim-highlight-colors")
		c.setup({
			render = "background",
			virtual_symbol = " ",
			virtual_symbol_prefix = "",
			virtual_symbol_suffix = "",
			virtual_symbol_position = "inline",
			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_var_usage = true,
			enable_named_colors = true,
			enable_tailwind = true,
			exclude_filetypes = {},
			exclude_buftypes = {},
		})
		r.noremap("n", "<leader><leader>c", function()
			c.toggle()
		end, "toggle colorizer")
		require("nvim-highlight-colors").turnOff()
	end,
}

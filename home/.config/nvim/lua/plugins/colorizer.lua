return {
	"brenoprata10/nvim-highlight-colors",
	event = "VeryLazy",
	config = function()
		local r = require("utils.remaps")
		local c = require("nvim-highlight-colors")
		c.setup({
			---Render style
			---@usage 'background'|'foreground'|'virtual'
			render = "virtual",
			virtual_symbol = "",
			virtual_symbol_prefix = "",
			virtual_symbol_suffix = "",
			---Set virtual symbol position()
			---@usage 'inline'|'eol'|'eow'
			---inline mimics VS Code style
			---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
			---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
			virtual_symbol_position = "eow",
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
		-- require("nvim-highlight-colors").turnOff()
	end,
}

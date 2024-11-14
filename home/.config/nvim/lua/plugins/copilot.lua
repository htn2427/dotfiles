return {
	"zbirenbaum/copilot.lua",
	enabled = false,
	cmd = "Copilot",
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
			copilot_node_command = "node", -- Node.js version must be > 18.x
		})
	end,
}

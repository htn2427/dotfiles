local keymap = vim.keymap
local check_duplicates = require("utils.duplicates").check_duplicates
local X = {}

function X.map(type, input, output, description, additional_options)
	local options = { remap = true, desc = description }
	if additional_options then
		options = vim.tbl_deep_extend("force", options, additional_options)
	end
	keymap.set(type, input, output, options)
	check_duplicates(type, input, description)
end

function X.noremap(type, input, output, description, additional_options)
	local options = { remap = false }
	if additional_options then
		options = vim.tbl_deep_extend("force", options, additional_options)
	end
	X.map(type, input, output, description, options)
end

return X

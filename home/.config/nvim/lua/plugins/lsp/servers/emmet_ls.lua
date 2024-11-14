return function(on_attach)
	return {
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
			client.server_capabilities.document_formatting = true
		end,
		filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		init_options = {
			html = {
				options = {
					["bem.enabled"] = true,
				},
			},
		},
	}
end

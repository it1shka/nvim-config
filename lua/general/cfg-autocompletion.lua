local autocompletion = {}

function autocompletion.setup()
	autocompletion.enable_servers()
	autocompletion.enable_diagnostics()
	autocompletion.enable_inlay_hints()
end

function autocompletion.enable_servers()
	local language_servers = { "ts_ls", "lua_ls", "rust_analyzer", "zls", "svelte" }
	for _, server_name in ipairs(language_servers) do
		vim.lsp.enable(server_name)
	end
end

function autocompletion.enable_diagnostics()
	vim.diagnostic.config({
		virtual_text = {
			prefix = "",
			severity = nil,
			source = "if_many",
			format = nil,
		},
		signs = true,
		severity_sort = true,
		update_in_insert = false,
	})
end

function autocompletion.enable_inlay_hints()
	vim.lsp.inlay_hint.enable(true)
	vim.lsp.config("ts_ls", {
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayVariableTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
					includeInlayParameterNameHintsWhenArgumentMatchesName = true,
					includeInlayVariableTypeHints = true,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHintsWhenTypeMatchesName = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
			},
		},
	})
end

return autocompletion

return {
	"neovim/nvim-lspconfig",
    config = function(_)
      	local lsp = require("lspconfig")

		lsp.flow.setup {
			--[[on_attach = on_attach,
			capabilities = capabilities]]--
		}

    	lsp.ts_ls.setup {
      		--[[on_attach = on_attach,
      		filetypes = {
				'javascript', 'react', 'typescript', 'typescriptreact', 'typescript.tsx',
      		},
			cmd = {  'typescript-language-server', '--stdio'  },
			capabilities = capabilities]]--
    	}



		lsp.lua_ls.setup {
			--[[onattach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = {  'vim'  }
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false
					},
				}
			}--]]
		}
    end,
}

return {
  {
		"neovim/nvim-lspconfig",
	  dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            {  path = "$/{3rd}/luv/library", words = {  "vim%.uv"  }  }
          }
        }
      }
    },
    config = function()
      	local lsp = require("lspconfig")
	 	--lsp.lua_ls.setup {} 
    
		local on_attach = function(client, bufnr)
			--vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      		if client.server_capabilities.documentFormattingProvider then
        		vim.api.nvim_command [[augroup Format]]
				vim.api.nvim_command [[autocmd! * <buffer>]]
				vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync{}]]
				vim.api.nvim_command [[augroup END]]
			end
		end


		-- Completion using nvim_cmp
		local capabilities = require('cmp_nvim_lsp').default_capabilities(
			vim.lsp.protocol.make_client_capabilities()
		)


		lsp.flow.setup {
			on_attach = on_attach,
			capabilities = capabilities
		}

    lsp.tsserver.setup {
      on_attach = on_attach,
      filetypes = {
				'javascript', 'react', 'typescript', 'typescriptreact', 'typescript.tsx',
      }, 
			cmd = {  'typescript-language-server', '--stdio'  },
			capabilities = capabilities
    }
    lsp.ts_ls.setup {
      on_attach = on_attach,
      filetypes = {
				'javascript', 'react', 'typescript', 'typescriptreact', 'typescript.tsx',
      }, 
			cmd = {  'typescript-language-server', '--stdio'  },
			capabilities = capabilities
    }



		lsp.lua_ls.setup {
			onattach = on_attach,
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
			}
		}
    end,
  },
}

return {
  {
    "williamboman/mason.nvim",
    config = function (_, opts)
      require("mason").setup({  ui = {  border = 'rounded'  }  })
    end,
  },


  {
    "williamboman/mason-lspconfig.nvim",
    config = function(_, opts) 
      require("mason-lspconfig").setup({  
        ensure_installed = {
				  "cssls",
          "html",
          "ts_ls",
          "eslint",
          "lua_ls",
			    "pyright"
        }
      })
    end,
  }
}

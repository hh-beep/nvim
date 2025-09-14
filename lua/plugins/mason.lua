return {
  {
    "mason-org/mason.nvim",
    config = function (_, opts)
      require("mason").setup({  ui = {  border = 'rounded'  }  })
    end,
  },


  {
    "mason-org/mason-lspconfig.nvim",
    config = function(_)
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

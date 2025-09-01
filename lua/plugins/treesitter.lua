return {
  "nvim-treesitter/nvim-treesitter",
   branch = 'master', lazy = false, build = ":TSUpdate",
  config = function(_)
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "tsx",
        "lua",
        "json",
        "css",
        "javascript",
        "c", "vim", "vimdoc", "query", "markdown", "markdown_inline" 
      },
      autotag = {
        enable = true,
      }
    })
  end,
}
local langs = {"c", "json", "lua", "proto", "typescript", "go", "gomod", "gosum", "vim", "vimdoc", "regex", "sql"}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = langs,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

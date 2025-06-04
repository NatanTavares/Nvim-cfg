local langs = {
  "lua",
  "vim",

  "json",
  "proto",

  "javascript",
  "typescript",
  "tsx",
  "html",
  "css",

  "dockerfile",
  "go",
  "sql",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        auto_install = true,
        ensure_installed = langs,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        textObjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
}

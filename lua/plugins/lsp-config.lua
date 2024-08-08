local lsps = { "lua_ls", "golangci_lint_ls", "gopls", "tsserver" }

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = lsps,
      })
      require("mason-lspconfig").setup({
        ensure_installed = lsps,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("mason").setup({
        ensure_installed = lsps,
      })
      require("mason-lspconfig").setup({
        ensure_installed = lsps,
      })

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.golangci_lint_ls.setup({})
      lspconfig.tsserver.setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
      vim.keymap.set({ "n", "v" }, "<leader>.", vim.lsp.buf.code_action, {})
    end,
  },
}

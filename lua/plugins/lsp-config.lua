local lsps = {
  "lua_ls",

  "golangci_lint_ls",
  "gopls",

  "buf_ls",

  "ts_ls",
  "prismals",
  "html",
  "cssls",
  "eslint",
  "tailwindcss"
}

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    module = "tailwindcss-colors",
    config = function()
      require("tailwindcss-colors").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason-lspconfig").setup({
        ensure_installed = lsps,
        automatic_installation = true,
      })

      for _, language in pairs(lsps) do
        require("lspconfig")[language].setup({
          capabilities = capabilities
        })
      end

      -- require("lspconfig").ts_ls.setup({ capabilities = capabilities, single_file_support = false })
      -- require("lspconfig").eslint.setup({
      --   capabilities = capabilities,
      --   root_dir = require("lspconfig.util").root_pattern("package.json", ".eslintrc.json", "node_modules"),
      --   settings = {
      --     workingDirectory = { mode = "location" },
      --   },
      -- })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
      vim.keymap.set({ "n", "v" }, "<leader>.", vim.lsp.buf.code_action, {})
    end,
  },
}

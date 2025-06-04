return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    vim.g.auto_format_enabled = true

    local function toggle_auto_format()
      vim.g.auto_format_enabled = not vim.g.auto_format_enabled
      vim.notify("Auto-format on save: " .. (vim.g.auto_format_enabled and "enabled" or "disabled"))
    end

    vim.api.nvim_create_user_command("ToggleAutoFormat", toggle_auto_format, { desc = "Toggle auto-format on save" })

    null_ls.setup({
      sources = {
        formatting.stylua,
        formatting.prettier.with({
          extra_args = {
            "--config",
            vim.fn.expand("~/.eslintrc.js")
          }
        }),

        diagnostics.golangci_lint,
      },

      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              if vim.g.auto_format_enabled then
                vim.lsp.buf.format({ bufnr = bufnr })
              end
            end,
          })
        end
      end,
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    vim.keymap.set("n", "<leader>gF", ":ToggleAutoFormat<CR>", { desc = "Toggle auto-format on save" })
  end,
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<leader>E", ":Neotree filesystem toggle<CR>", {})

    require("neo-tree").setup({
      close_if_last_window = true,

      filesystem = {
        hijack_netrw_behavior = "disabled",
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_by_name = {},
          never_show = {
            "node_modules",
            ".idea",
            ".DS_Store",
          },
        },
      },
    })
  end,
}

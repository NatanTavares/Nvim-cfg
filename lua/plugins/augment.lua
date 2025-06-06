return {
  {
    "augmentcode/augment.vim",
    config = function()
      vim.g.augment_disable_tab_mapping = 1

      vim.keymap.set("n", "<leader>at", ":Augment chat-toggle<CR>")
      vim.keymap.set("n", "<leader>an", ":Augment chat-new<CR>")

      vim.keymap.set("i", "<M-Enter>", "<Cmd>call augment#Accept()<CR>", { silent = true })
    end,
  },
}

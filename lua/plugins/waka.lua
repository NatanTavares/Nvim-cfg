return {
  {
    "wakatime/vim-wakatime",
    lazy = false,
    config = function()
      vim.cmd([[silent !~/.config/nvim/scripts/w_act.sh start]])
      vim.api.nvim_create_autocmd("VimLeave", {
        callback = function()
          vim.cmd("silent !~/.config/nvim/scripts/w_act.sh stop")
        end,
      })
    end,
  },
}

return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "rose-pine"
    require('rose-pine').setup {
      -- leave this setup function empty for default config
      -- or refer to the configuration section
      -- for configuration options
    }
  end,
}

local spec = {
  spec = {
    -- add your plugins here
    -- theme
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end,

    -- telescope
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
          ensure_installed = { "c", "json", "lua", "proto", "typescript", "go", "gomod", "gosum", "vim", "vimdoc", "regex", "sql" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    },

    -- neo-tree
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", 
        "MunifTanjim/nui.nvim",
      }
    }
  }
}

return {
  spec,
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  install = { colorscheme = { "poimandres" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}

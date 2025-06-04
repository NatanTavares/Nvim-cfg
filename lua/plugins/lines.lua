local function format_time(output)
  local hours, minutes = 0, 0

  hours = output:match("(%d+)%s*hr")
  minutes = output:match("(%d+)%s*min")

  hours = tonumber(hours) or 0
  minutes = tonumber(minutes) or 0

  local total_minutes = hours * 60 + minutes
  local formatted_time = string.format("%d:%02d", math.floor(total_minutes / 60), total_minutes % 60)

  return formatted_time
end

local function wakatime_activity()
  local file_path = os.getenv("HOME") .. "/.wakatime_activity"
  local file = io.open(file_path, "r")

  if file then
    local result = file:read("*a")
    file:close()

    return format_time(result:gsub("[^%g%s]", ""))
  else
    return "⚠︎"
  end
end

return {
  -- {
  --    "lukas-reineke/virt-column.nvim",
  --    opts = {},
  -- },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      disabled_filetypes = {
        "netrw",
        "NvimTree",
        "Lazy",
        "mason",
        "help",
        "text",
        "markdown",
        "tex",
        "html",
      },
      scope = "window",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin",
      },
      config = function()
        require("lualine").setup({
          options = {
            icons_enabled = true,
            theme = "auto",
          },
          sections = {
            lualine_x = {
              wakatime_activity,
              "enconding",
              "fileformat",
              "filetype",
            },
          },
        })
      end
      -- options = {
      --    theme = {
      --       normal = {
      --          c = { fg = "#b4befe" },
      --       },
      --       inactive = {
      --          c = { fg = "#b4befe" },
      --       },
      --    },
      --    section_separators = "",
      --    component_separators = { left = "──", right = "──" },
      --    padding = 0,
      -- },
      -- sections = {
      --    lualine_a = {},
      --    lualine_b = {},
      --    lualine_c = {
      --       {
      --          "branch",
      --          icon = { "", color = { fg = "#b4befe" } },
      --          color = { fg = "#cdd6f4" },
      --          padding = 1,
      --       },
      --       {
      --          "diff",
      --          padding = 1,
      --       },
      --       {
      --          "diagnostics",
      --          padding = 1,
      --          symbols = {
      --             error = " ",
      --             warn = " ",
      --             info = " ",
      --             hint = " ",
      --          },
      --       },
      --       "%=",
      --       {
      --          "filetype",
      --          colored = false,
      --          icon_only = true,
      --          padding = { left = 1, right = 0 },
      --          separator = "∙",
      --       },
      --       {
      --          "filename",
      --          file_status = true,
      --          newfile_status = false,
      --          path = 1,
      --          padding = 1,
      --          symbols = {
      --             modified = "●",
      --          },
      --          color = { fg = "#cdd6f4" },
      --       },
      --    },
      --    lualine_x = {},
      --    lualine_y = {},
      --    lualine_z = {
      --       {
      --          "progress",
      --          padding = 1,
      --          color = { fg = "#cdd6f4" },
      --       },
      --    },
      -- },
      -- inactive_sections = {
      --    lualine_a = {},
      --    lualine_b = {},
      --    lualine_c = {},
      --    lualine_x = {},
      --    lualine_y = {},
      --    lualine_z = {},
      -- },
    },
    -- init = function()
    --    vim.opt.showmode = false
    --    vim.opt.fillchars = {
    --       stl = "─",
    --       stlnc = "─",
    --    }
    -- end,
  },
  -- {
  --    "akinsho/bufferline.nvim",
  --    dependencies = "nvim-tree/nvim-web-devicons",
  --    opts = {
  --       options = {
  --          separator_style = "slant",
  --          mode = "tabs",
  --          offsets = {
  --             {
  --                filetype = "NvimTree",
  --                text = " File Explorer",
  --                highlight = "Directory",
  --                separator = false,
  --             },
  --          },
  --       },
  --    },
  -- },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    theme = "catppuccin",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      show_dirname = false,
      show_basename = false,
    },
  },
  {
    "yamatsum/nvim-cursorline",
    opts = {
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
      cursorline = {
        enable = false,
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}

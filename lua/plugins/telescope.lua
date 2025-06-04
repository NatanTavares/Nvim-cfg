-- In lua/plugins/telescope.lua (or init.lua)
return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      local action_layout = require("telescope.actions.layout")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<S-CR>"] = function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if not selection then
                  return
                end
                actions.close(prompt_bufnr)
                vim.cmd("vsplit " .. vim.fn.fnameescape(selection.value))
              end,
              ["<C-o>"] = action_layout.toggle_preview,
            },
            n = {
              ["o"] = action_layout.toggle_preview,
            },
          },
          layout_config = {
            width = 0.5,
          },
        },
        pickers = {
          find_files = {
            path_display = { "filename_first" },
            previewer = false,
            layout_config = {
              preview_width = 0.6,
            }
          },
          live_grep = {
            layout_config = {
              preview_width = 0.6,
            },
          },
          buffers = {
            layout_config = {
              preview_width = 0.6,
            },
          },
          help_tags = {
            layout_config = {
              preview_width = 0.6,
            },
          },
          colorscheme = {
            theme = "dropdown",
            previewer = false, -- Disable preview window
            layout_config = {
              center = {
                width = 0.1,
                height = 0.2,
                prompt_position = "top",
              },
            },
            path_display = { "truncate" },
            attach_mappings = function(prompt_bufnr, map)
              -- Apply theme on selection change
              local function apply_theme()
                local selection = action_state.get_selected_entry()
                if selection then
                  vim.cmd("colorscheme " .. selection.value)
                end
              end
              -- Trigger on selection change
              actions.select_default:replace(function()
                apply_theme()
                actions.close(prompt_bufnr)
              end)
              -- Apply theme when moving through list
              actions.move_selection_next:enhance({ post = apply_theme })
              actions.move_selection_previous:enhance({ post = apply_theme })
              return true
            end,
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              width = 0.3,
              height = 0.2,
              previewer = false,
            }),
          },
        },
      })

      -- Keybindings
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
      vim.keymap.set("n", "<leader>th", builtin.colorscheme, { desc = "Pick a theme" })

      pcall(telescope.load_extension, "ui-select")
    end,
  },
}

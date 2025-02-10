return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			telescope.setup({
				extensions = {
					["ui-select"] = {
						theme = require("telescope.themes").get_dropdown({
							width = 0.3,
							height = 0.2,
							previewer = false, -- Disable preview here, we'll handle it separately
						}),
					},
				},
			})

			-- Keybindings for Telescope actions
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

			-- Customizing theme picker layout with a preview window
			vim.keymap.set("n", "<leader>th", function()
				builtin.colorscheme({
					layout_config = {
						width = 0.3, -- 30% width of the screen
						height = 0.2, -- 20% height of the screen
					},
					previewer = require("telescope.previewers").new_buffer_previewer({
						define_preview = function(self, entry, status)
							-- Preview the theme by applying it
							vim.cmd("colorscheme " .. entry.value)
						end,
					}),
				})
			end, { desc = "Pick a theme" })

			-- Load extensions
			telescope.load_extension("ui-select")
		end,
	},
}

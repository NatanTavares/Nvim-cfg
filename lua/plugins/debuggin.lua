return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

      require('dapui').setup()
      require('dap-go').setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end

			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<leader>B", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<F5>", dap.continue, {})
			vim.keymap.set("n", "<F10>", dap.step_over, {})
			vim.keymap.set("n", "<F11>", dap.step_into, {})
			vim.keymap.set("n", "<F12>", dap.step_out, {})
		end,
	},
}

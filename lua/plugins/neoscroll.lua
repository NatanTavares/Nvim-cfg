return {
  "karb94/neoscroll.nvim",
  config = function()
    local nscroll = require("neoscroll")
    nscroll.setup({
      mappings = { "<C-u>", "<C-d>", "zt", "zz", "zb" },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
    })
  end,
}

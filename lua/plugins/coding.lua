return {
  {
    "MaximilianLloyd/tw-values.nvim",
    keys = {
      {
        "gK",
        "<cmd>TWValues<cr>",
        desc = "Show tailwind CSS values",
      },
    },
    opts = {
      border = "rounded",
      show_unknown_classes = true,
      focus_preview = true,
    },
  },
  {
    "nacro90/numb.nvim",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      pre_hook = function()
        return vim.bo.commentstring
      end,
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
  },
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    config = function()
      require("no-neck-pain").setup({
        width = 150,
        killScratchBuffer = true,
      })
    end,
    keys = {
      { "<Leader>n", ":NoNeckPain<CR>" },
    },
  },
  {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    config = function()
      require("distant"):setup()
    end,
  },
  {
    "mcauley-penney/visual-whitespace.nvim",
    opts = {
      highlight = { link = "LineNr" },
    },
  },
}

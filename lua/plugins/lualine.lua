return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        -- theme = 'poimandres'
        theme = 'rose-pine'
      }
    })
  end
}

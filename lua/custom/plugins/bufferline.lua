return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local bl = require 'bufferline'
      bl.setup {}
    end,
  },
}

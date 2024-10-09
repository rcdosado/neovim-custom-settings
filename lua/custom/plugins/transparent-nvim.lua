return {
  {
    'xiyaowong/transparent.nvim',
    config = function()
      local t = require 'transparent'
      t.setup {}
    end,
    lazy=true,
  },
}

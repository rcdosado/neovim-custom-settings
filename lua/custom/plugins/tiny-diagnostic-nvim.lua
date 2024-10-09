return {
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy',
    config = function()
      require('tiny-inline-diagnostic').setup {
        options = {
          break_line = {
            enabled = true,
            after = 30,
          },
        },
      }
    end,
    lazy=true,
  },
}

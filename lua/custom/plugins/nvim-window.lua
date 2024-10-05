return {

  { -- nvim-window
    'yorickpeterse/nvim-window',
    keys = {
      { '<leader>W', "<cmd>lua require('nvim-window').pick()<cr>", desc = 'nvim-window: Jump to window' },
    },
    config = true,
    lazy=true,
  },
}

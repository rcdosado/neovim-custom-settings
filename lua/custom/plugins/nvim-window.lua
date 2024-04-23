return {

  { -- nvim-window
    'yorickpeterse/nvim-window',
    lazy = true,
    keys = {
      { '<leader>W', "<cmd>lua require('nvim-window').pick()<cr>", desc = 'nvim-window: Jump to window' },
    },
    config = true,
  },
}

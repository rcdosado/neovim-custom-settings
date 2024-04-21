return {
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
      vim.keymap.del({ 'x', 'o' }, 'X')
      vim.keymap.del({ 'x', 'o' }, 'x')
    end,
    lazy = false,
  },
}

return {
  {
    'Exafunction/codeium.vim',
    lazy = true,
    event = 'BufEnter',
    config = function()
      vim.g.codeium_enabled = false
      vim.g.codeium_disable_bindings = 0
    end,
  },
}

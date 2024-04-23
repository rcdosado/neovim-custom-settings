return {
  {
    'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
    lazy = true,
    config = function()
      require('toggle_lsp_diagnostics').init { start_on = false }
    end,
  },
}

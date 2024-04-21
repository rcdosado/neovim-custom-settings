return {
  {
    'olimorris/persisted.nvim',
    lazy = false, -- make sure the plugin is always loaded at startup
    config = function()
      require('persisted').setup {
        use_git_branch = true,
        autosave = false,
        follow_cwd = true,
      }
    end,
  },
}

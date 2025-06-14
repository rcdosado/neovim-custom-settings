﻿-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- modular approach: using `require 'path/name'` will
  -- include a plugin definition from file lua/path/name.lua

  -- require 'kickstart/plugins/gitsigns',

  require 'kickstart/plugins/which-key',

  require 'kickstart/plugins/telescope',

  require 'kickstart/plugins/lspconfig',

  require 'kickstart/plugins/conform',

  require 'kickstart/plugins/cmp',

  -- require 'kickstart/plugins/todo-comments',

  require 'kickstart/plugins/mini',

  require 'kickstart/plugins/treesitter',

  -- require 'custom/plugins/nvim-window',

  require 'custom/plugins/leap',

  -- require 'custom/plugins/harpoon',

  require 'custom/plugins/aerial',

  require 'custom/plugins/themes',

  require 'custom/plugins/toggle-diagnostics',

  require 'custom/plugins/lexima',

  -- require 'custom/plugins/codeium-vim',

  require 'custom/plugins/bufferline',

  -- require 'custom/plugins/dashboard-nvim',

  -- require 'custom/plugins/nvim-tree',

  require 'custom/plugins/persisted',

  -- require 'custom/plugins/transparent-nvim',

  -- require 'custom/plugins/nvim-bufdel',

  -- require 'custom/plugins/nvim-neotest',

  -- require 'custom/plugins/markdown-preview',

  require 'custom/plugins/nvim-tree',

  -- require 'custom/plugins/goto-preview',

  -- require 'custom/plugins/nvim-lightbulb',

  -- require 'custom/plugins/telekasten',

  -- require 'custom/plugins/dressing-nvim',

  -- require 'custom/plugins/switch-vim',

  -- require 'custom/plugins/nvterm-nvim',

  require 'custom/plugins/egrepify-nvim',

  require 'custom/plugins/in-and-out-nvim',

  require 'custom/plugins/nvim-autopairs',

  -- require 'custom/plugins/readermode',

  -- require 'custom/plugins/my-note-nvim',

  -- require 'custom/plugins/ollama-nvim',
  -- require 'custom/plugins/llm',

  -- require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  require 'custom/plugins/tiny-diagnostic-nvim',
  require 'custom/plugins/nvim-emmet',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
-- vim: ts=2 sts=2 sw=2 et

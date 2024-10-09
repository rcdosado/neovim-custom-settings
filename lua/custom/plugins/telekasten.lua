return {
  {
    'renerocksai/calendar-vim',
  },
  {
    'nvim-telescope/telescope-bibtex.nvim',
  },
  {
    'nvim-telescope/telescope-symbols.nvim',
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = 'markdown',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview' },
  },
  {
    'prochri/telescope-all-recent.nvim',
  },
  {
    -- see docs
    -- https://github.com/renerocksai/telekasten.nvim
    'renerocksai/telekasten.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      local base_dir = vim.fn.expand '~/zettelkasten'
      local tmpl = base_dir .. '/templates'

      require('telekasten').setup {
        home = base_dir,
        dailies = base_dir .. '/daily',
        weeklies = base_dir .. '/weekly',
        templates = base_dir .. '/templates',

        template_new_note = tmpl .. '/new_note.md',
        template_new_daily = tmpl .. '/daily.md',
        template_new_weekly = tmpl .. '/weekly.md',
        auto_set_filetype = true,
        close_after_yanking = false,
        command_palette_theme = 'dropdown',
        insert_after_inserting = true,
        new_note_location = 'smart',
        new_note_filename = 'uuid-title',
        show_tags_theme = 'dropdown',
        subdirs_in_links = true,
        tag_notation = '#tag',
        take_over_my_home = true,
        sort = 'modified',
      }

      vim.cmd.highlight { 'tkLink', 'ctermfg=Blue cterm=bold,underline guifg=lightblue gui=bold,underline' }
      vim.cmd.highlight { 'tkBrackets', 'ctermfg=gray guifg=gray' }

      -- LIST OF DEFAULT SHORTCUTS
      -- https://github.com/renerocksai/telekasten.nvim/blob/main/doc/telekasten.txt#L1069
      vim.keymap.set('n', '<leader>z', '<cmd>Telekasten panel<CR>')

      vim.keymap.set('n', '<leader>pt', '<cmd>!start c:/tools/typora/typora "%"<CR>')

      -- Most used functions
      vim.keymap.set('n', '<leader>zf', '<cmd>Telekasten find_notes<CR>')
      vim.keymap.set('n', '<leader>zg', '<cmd>Telekasten search_notes<CR>')
      vim.keymap.set('n', '<leader>zd', '<cmd>Telekasten goto_today<CR>')
      vim.keymap.set('n', '<leader>zz', '<cmd>Telekasten follow_link<CR>')
      vim.keymap.set('n', '<leader>zn', '<cmd>Telekasten new_note<CR>')
      vim.keymap.set('n', '<leader>zc', '<cmd>Telekasten show_calendar<CR>')
      vim.keymap.set('n', '<leader>zb', '<cmd>Telekasten show_backlinks<CR>')
      vim.keymap.set('n', '<leader>zI', '<cmd>Telekasten insert_img_link<CR>')
      vim.keymap.set('n', '<leader>#', '<cmd>Telekasten show_tags<CR>')

      -- Call insert link automatically when we start typing a link
      vim.keymap.set('i', '[[', '<cmd>Telekasten insert_link<CR>')
    end,
    lazy=true,
  },
}

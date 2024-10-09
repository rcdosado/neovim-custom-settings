return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = true,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local function my_on_attach(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      -- https://github.com/nvim-tree/nvim-tree.lua/blob/81eb8d519233c105f30dc0a278607e62b20502fd/doc/nvim-tree-lua.txt#L362
      -- vim.keymap.set('n', '<CR>', '', opts '')
      -- vim.keymap.set('n', '<BS>', '', opts '')
      vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
      vim.keymap.set('n', '<ESC>', api.tree.close, opts 'Close Menu')
      vim.keymap.set('n', 'l', api.node.open.edit, opts 'Open directory')
      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts 'Close directory')
      vim.cmd 'hi NvimTreeNormal guibg=NONE ctermbg=NONE'
    end
    require('nvim-tree').setup {
      on_attach = my_on_attach,
      filters = {
        dotfiles = true,
        exclude = { vim.fn.stdpath 'config' .. '/lua/custom' },
      },
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
      },
      git = {
        enable = false,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
    }
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true
  end,
  lazy=true,
}

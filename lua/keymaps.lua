local options = {
  hlsearch = true, -- Set highlight on search, but clear on pressing <Esc> in normal mode
  backspace = vim.opt.backspace + { 'nostop' }, -- Don't stop backspace at insert
  swapfile = false,
  -- scrolloff = 15, -- Minimal number of screen lines to keep above and below the cursor.
  sidescrolloff = 9,
  clipboard = 'unnamedplus', -- Connection to the system clipboard
  cmdheight = 1, -- hide command line unless needed
  completeopt = { 'menuone', 'noselect' }, -- Options for insert mode completion
  copyindent = true, -- Copy the previous indentation on autoindenting
  cursorline = false, -- Show which line your cursor is on
  expandtab = true, -- Enable the use of space in tab
  fileencoding = 'utf-8', -- File content encoding for the buffer
  fillchars = { eob = ' ' }, -- Disable `~` on nonexistent lines
  history = 100, -- Number of commands to remember in a history table
  ignorecase = true, -- Case insensitive searching
  laststatus = 3, -- globalstatus
  lazyredraw = true, -- lazily redraw screen
  -- mouse = 'a', -- Enable mouse support
  timeoutlen = 300, -- Length of time to wait for a mapped sequence
  undofile = true, -- Enable persistent undo
  updatetime = 250, -- Length of time to wait before triggering the plugin
  wrap = true, -- Disable wrapping of lines longer than the width of window
  writebackup = false, -- Disable making a backup before overwriting a file
  smartcase = false,
  -- autoindent = true,
  smartindent = true,
  signcolumn = 'yes',
  splitright = true,
  splitbelow = true,
  inccommand = 'split',
  showmode = false,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  termguicolors = true,
  relativenumber = true,
  -- minimal number of screen columns either side of cursor if wrap is `false`
  -- guifont = "monospace:h17", -- the font used in graphical neovim applications
  -- guifont = 'Source_Code_Pro:h17', -- the font used in graphical neovim applications
  whichwrap = 'bs<>[]hl', -- which "horizontal" keys are allowed to travel to prev/next line
  wildignore = { '*.swp', '*.bak', '*.pyc', '*.class' },
  list = false,
  listchars = { tab = '» ', trail = '∙', eol = '↲', nbsp = '␣', extends = '⟩', precedes = '⟨' },
  pumheight = 6,
}
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- insert mode addendums
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', '<C-o>', '<Esc>o', { desc = 'Explicitly go to next line' })
vim.keymap.set('i', '<M-,>', '<Esc>$a,<Esc>o', { desc = 'Add comma, newline' })
vim.keymap.set('i', '<M-;>', '<Esc>$a;<Esc>o', { desc = 'Add semicolon, newline' })

-- delete without yanking
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', 'QQ', '<cmd>qall!<cr>', { nowait = true, desc = 'quit, dont save' })

vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<CR>', { desc = 'open mini.files' })

-- toggles
vim.keymap.set('n', '<leader>Td', '<Plug>(toggle-lsp-diag)<cr>', { desc = 'Toggle diagnostics' })
vim.keymap.set('n', '<leader>Tib', '<cmd>IBLToggle<cr>', { desc = 'Toggle Indent-blankline' })
vim.keymap.set('n', '<leader>Tln', '<cmd>set nu!<cr>', { nowait = true, desc = 'Toggle Line number' })
vim.keymap.set('n', '<leader>Trn', '<cmd>set rnu!<cr>', { nowait = true, desc = 'Toggle Relative number' })
vim.keymap.set('n', '<leader>Tlc', '<cmd>set list!<cr>', { nowait = true, desc = 'Show/Hide listchars' })
vim.keymap.set('n', '<leader>Trp', '<cmd>TransparentToggle<cr>', { nowait = true, desc = 'Toggle Transparency' })
vim.keymap.set('n', '<leader>Tld', function()
  vim.o.bg = (vim.o.bg == 'dark') and 'light' or 'dark'
end, { nowait = true, desc = 'Toggle Light/dark' })

vim.keymap.set('n', '<leader>Tac', function()
  local flag = require('cmp.config').get().enabled
  require('cmp').setup.buffer { enabled = not flag }
end, { nowait = true, desc = 'Toggle Autocomplete' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
--
-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +1<cr>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -1<cr>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize +2<cr>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize -2<cr>', { desc = 'Increase window width' })

-- Move Lines
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- Add undo break-points
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', ';', ';<c-g>u')

-- save file
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>sc', '<cmd>%y+<cr>', { nowait = true, desc = 'Select all & copy' })
vim.keymap.set('n', '<leader>sa', 'ggVG', { nowait = true, desc = 'Select all' })

vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<cr>:pwd<cr>', { desc = 'Go to current file folder' })
vim.keymap.set({ 'n', 'i' }, '<F5><F5>', "<cmd>pu=strftime('%c')<cr>", { desc = 'Insert Current Date/Time' })

--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yan()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et

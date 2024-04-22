local options = {
  hlsearch = true, -- Set highlight on search, but clear on pressing <Esc> in normal mode
  backspace = vim.opt.backspace + { 'nostop' }, -- Don't stop backspace at insert
  swapfile = false,
  -- scrolloff = 15, -- Minimal number of screen lines to keep above and below the cursor.
  sidescrolloff = 9,
  clipboard = 'unnamedplus', -- Connection to the system clipboard
  -- cmdheight = 1, -- hide command line unless needed
  completeopt = { 'menuone', 'noselect' }, -- Options for insert mode completion
  -- copyindent = true, -- Copy the previous indentation on autoindenting
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
  -- relativenumber = true,
  -- minimal number of screen columns either side of cursor if wrap is `false`
  -- guifont = "monospace:h17", -- the font used in graphical neovim applications
  -- guifont = 'Source_Code_Pro:h17', -- the font used in graphical neovim applications
  whichwrap = 'bs<>[]hl', -- which "horizontal" keys are allowed to travel to prev/next line
  wildignore = { '*.swp', '*.bak', '*.pyc', '*.class' },
  list = false,
  listchars = { tab = '» ', trail = '∙', eol = '↲', nbsp = '␣', extends = '⟩', precedes = '⟨' },
  pumheight = 8,
}
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- insert mode addendums
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', '<C-b>', '<Esc>^i', { desc = 'Beginning of Line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'End of Line' })
vim.keymap.set('i', '<M-,>', '<Esc>$a,<Esc>o', { desc = 'Add comma, newline' })
vim.keymap.set('i', '<M-;>', '<Esc>$a;<Esc>o', { desc = 'Add semicolon, newline' })
-- vim.keymap.set('i', ';;', '<Esc>$a:<Esc>o', { desc = 'Add colon, newline' })
-- vim.keymap.set('i', '...', '<Esc>$a.', { desc = 'continue after dot' })
vim.keymap.set('i', '<C-o>', '<Esc>o', { desc = 'Explicitly go to next line' })
vim.keymap.set('i', '<M-h>', '<BS>', { desc = '<Backspace>' })
vim.keymap.set('i', '<M-l>', '<Del>', { desc = '<Delete>' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- vim.keymap.set('n', 'n', 'nzzzv', { desc = 'center find/find next', nowait = true })
-- vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'center find/find next', nowait = true })

vim.keymap.set('n', 'QQ', '<cmd>qall!<cr>', { nowait = true, desc = 'quit, dont save' })

-- quick edit keymaps
vim.keymap.set('n', '<leader>ev', '<cmd>tabnew ~/AppData/Local/nvim/lua/keymaps.lua<CR>', { silent = true })
vim.keymap.set('n', '<leader>ew', '<cmd>tabnew ~/AppData/Local/nvim/lua/custom/wezterm.lua<CR>', { silent = true })
vim.keymap.set('n', '<leader>ed', '<cmd>tabnew c:/Users/RAG/Desktop/downloads.txt<CR>', { silent = true })

vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<CR>', { desc = 'open mini.files' })
vim.keymap.set('n', '<leader>X', '<cmd>%bd! | e#<cr>', { desc = ' Close buffers except current' })
vim.keymap.set('n', '<leader>x', '<cmd>bd!<cr>', { desc = 'Close current buffer' })
-- ["<leader>q"] = { "<cmd>%bd! | e#<cr>", "Close buffers except current", opts = { nowait = true, silent=true} },
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- toggles

vim.keymap.set('n', '<leader>tld', '<Plug>(toggle-lsp-diag)<cr>', { desc = 'Toggle diagnostics' })
vim.keymap.set('n', '<leader>tib', '<cmd>IBLToggle<cr>', { desc = 'Toggle Indent-Blankline' })
vim.keymap.set('n', '<leader>tln', '<cmd>set nu!<cr>', { nowait = true, desc = 'Toggle Line number' })
vim.keymap.set('n', '<leader>trn', '<cmd>set rnu!<cr>', { nowait = true, desc = 'Toggle Relative number' })
vim.keymap.set('n', '<leader>tlc', '<cmd>set list!<cr>', { nowait = true, desc = 'Show/Hide listchars' })
vim.keymap.set('n', '<leader>tat', '<cmd>AerialToggle!<CR>', { desc = 'Toggle aerial' })
vim.keymap.set('n', '<leader>tci', '<cmd>CodeiumToggle<cr>', { nowait = true, desc = 'Toggle Codeium' })
vim.keymap.set('n', '<leader>trp', '<cmd>TransparentToggle<cr>', { nowait = true, desc = 'Toggle Transparency' })
vim.keymap.set('n', '<leader>tac', function()
  local flag = require('cmp.config').get().enabled
  require('cmp').setup.buffer { enabled = not flag }
end, { nowait = true, desc = 'Toggle Autocomplete' })

-- LEAP
vim.keymap.set('n', 's', '<Plug>(leap)')
vim.keymap.set('n', 'gs', '<Plug>(leap-from-window)')
vim.keymap.set({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
vim.keymap.set({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')

-- Bufferline
vim.keymap.set('n', 'H', '<cmd>bprev<CR>', { desc = 'Go left Tab' })
vim.keymap.set('n', 'L', '<cmd>bnext<CR>', { desc = 'Go right Tab' })
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
--
-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Move Lines
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next search result' })
vim.keymap.set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
vim.keymap.set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
vim.keymap.set('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev search result' })
vim.keymap.set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
vim.keymap.set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

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
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et

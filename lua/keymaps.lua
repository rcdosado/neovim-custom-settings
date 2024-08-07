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

-- delete without yanking
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- move to underscores with - and l (repeatable with ";")
vim.keymap.set({ 'n', 'v' }, '<leader>-', 'f_', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>l', 'F_', { silent = true })

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
vim.keymap.set('n', '<leader>ekm', '<cmd>tabnew ~/AppData/Local/nvim/lua/keymaps.lua<CR>', { silent = true })
vim.keymap.set('n', '<leader>epi', '<cmd>tabnew ~/AppData/Local/nvim/lua/lazy-plugins.lua<CR>', { silent = true })
vim.keymap.set('n', '<leader>ewt', '<cmd>tabnew ~/AppData/Local/nvim/lua/custom/wezterm.lua<CR>', { silent = true })
vim.keymap.set('n', '<leader>ed', '<cmd>tabnew c:/Users/RAG/Desktop/downloads.txt<CR>', { silent = true })

vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<CR>', { desc = 'open mini.files' })
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
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

vim.keymap.set('n', '<leader>Td', '<Plug>(toggle-lsp-diag)<cr>', { desc = 'Toggle diagnostics' })
vim.keymap.set('n', '<leader>Tib', '<cmd>IBLToggle<cr>', { desc = 'Toggle Indent-Blankline' })
vim.keymap.set('n', '<leader>Tln', '<cmd>set nu!<cr>', { nowait = true, desc = 'Toggle Line number' })
vim.keymap.set('n', '<leader>Trn', '<cmd>set rnu!<cr>', { nowait = true, desc = 'Toggle Relative number' })
vim.keymap.set('n', '<leader>Tlc', '<cmd>set list!<cr>', { nowait = true, desc = 'Show/Hide listchars' })
vim.keymap.set('n', '<leader>Tal', '<cmd>AerialToggle!<CR>', { desc = 'Toggle aerial' })
vim.keymap.set('n', '<leader>Tc', '<cmd>CodeiumToggle<cr>', { nowait = true, desc = 'Toggle Codeium' })
vim.keymap.set('n', '<leader>Trp', '<cmd>TransparentToggle<cr>', { nowait = true, desc = 'Toggle Transparency' })
-- this is set in the readermode.lua file
-- vim.keymap.set('n', '<leader>Trm', '<cmd>ReaderMode<cr>', { nowait = true, desc = 'Toggle ReaderMode' })

vim.keymap.set('n', '<leader>Tld', function()
  vim.o.bg = (vim.o.bg == 'dark') and 'light' or 'dark'
end, { nowait = true, desc = 'Toggle Light/dark' })

vim.keymap.set('n', '<leader>Tac', function()
  local flag = require('cmp.config').get().enabled
  require('cmp').setup.buffer { enabled = not flag }
end, { nowait = true, desc = 'Toggle Autocomplete' })

vim.keymap.set('n', '[n', '<cmd>lua require("neotest").jump.prev({status = "failed"})<CR>', { silent = true })
vim.keymap.set('n', ']n', '<cmd>lua require("neotest").jump.next({status = "failed"})<CR>', { silent = true })

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

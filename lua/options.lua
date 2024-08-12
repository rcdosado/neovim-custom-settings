-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
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
-- vim: ts=2 sts=2 sw=2 et
--

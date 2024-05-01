-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

local options = {
  -- Make line numbers default
  number = false,
  -- vim.opt.relativenumber = true

  -- Enable mouse mode, can be useful for resizing splits for example!
  mouse = 'a',

  -- Don't show the mode, since it's already in the status line
  showmode = false,

  -- Sync clipboard between OS and Neovim.
  --  Remove this option if you want your OS clipboard to remain independent.
  --  See `:help 'clipboard'`
  clipboard = 'unnamedplus',

  -- Enable break indent
  breakindent = true,

  -- Save undo history
  undofile = true,

  -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
  ignorecase = true,
  smartcase = false,

  -- Keep signcolumn on by default
  signcolumn = 'yes',

  -- Decrease update time
  updatetime = 250,

  -- Decrease mapped sequence wait time
  -- Displays which-key popup sooner
  timeoutlen = 300,

  -- Preview substitutions live, as you type!
  inccommand = 'split',

  -- Show which line your cursor is on
  cursorline = true,

  -- Minimal number of screen lines to keep above and below the cursor.
  scrolloff = 10,

  -- Set highlight on search, but clear on pressing <Esc> in normal mode
  hlsearch = true,

  -- Don't stop backspace at insert
  backspace = vim.opt.backspace + { 'nostop' },

  swapfile = false,

  -- scrolloff = 15, -- Minimal number of screen lines to keep above and below the cursor.
  sidescrolloff = 9,
  --
  -- Connection to the system clipboard
  clipboard = 'unnamedplus',

  -- hide command line unless needed
  -- cmdheight = 1,

  -- Options for insert mode completion
  completeopt = { 'menuone', 'noselect' },

  -- copyindent = true, -- Copy the previous indentation on autoindenting

  -- Show which line your cursor is on
  cursorline = false,

  -- Enable the use of space in tab
  expandtab = true,

  -- File content encoding for the buffer
  fileencoding = 'utf-8',

  -- Disable `~` on nonexistent lines
  fillchars = { eob = ' ' },

  -- Number of commands to remember in a history table
  history = 100,

  -- Case insensitive searching
  ignorecase = true,
  -- globalstatus
  laststatus = 3,
  -- lazily redraw screen
  lazyredraw = true,

  -- Length of time to wait for a mapped sequence
  timeoutlen = 300,

  -- Enable persistent undo
  undofile = true,

  -- Length of time to wait before triggering the plugin
  updatetime = 250,

  -- Disable wrapping of lines longer than the width of window
  wrap = true,

  -- Disable making a backup before overwriting a file
  writebackup = false,

  -- autoindent = true,
  smartindent = true,

  splitright = true,

  splitbelow = true,

  shiftwidth = 2,

  tabstop = 2,

  softtabstop = 2,

  termguicolors = true,

  relativenumber = true,

  -- which "horizontal" keys are allowed to travel to prev/next line
  whichwrap = 'bs<>[]hl',

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

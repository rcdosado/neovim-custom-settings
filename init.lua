-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true
vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = '~/AppData/local/nvim/env/Scripts/python.exe'
-- vim.g.python3_host_prog = 'c:/python312/python.exe'

local nvim_path = vim.fn.stdpath 'config'

-- [[ Setting options ]]
-- require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[hConfigure and install plugins ]]
require 'lazy-plugins'

require 'current-theme'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

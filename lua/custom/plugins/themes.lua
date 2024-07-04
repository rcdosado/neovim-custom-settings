return {
  { 'sho-87/kanagawa-paper.nvim' },
  { 'uloco/bluloco.nvim', lazy = false, priority = 1000 },
  { 'dasupradyumna/midnight.nvim', lazy = false, priority = 1000 },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true, opts = {} },
  { 'sainnhe/gruvbox-material', name = 'gruvbox-material' },
  { 'EdenEast/nightfox.nvim' },
  { 'sainnhe/everforest' },
  { 'ishan9299/nvim-solarized-lua' },
  { 'Mofiqul/dracula.nvim' },
  { 'rebelot/kanagawa.nvim' },
  { 'kvrohit/substrata.nvim' },
  { 'romainl/Apprentice' },
  { 'hauleth/blame.vim' },
  { 'cocopon/iceberg.vim' },
  { 'LunarVim/darkplus.nvim' },
  { 'yeddaif/neovim-purple' },
  { 'scottmckendry/cyberdream.nvim' },
  { 'Mofiqul/vscode.nvim' },
  { 'mcchrish/zenbones.nvim', dependencies = {
    'rktjmp/lush.nvim',
  } },
  -- { 'projekt0n/gihub-nvim-theme' },
  { 'olivercederborg/poimandres.nvim' },
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'darker',
      }
    end,
  },
  {
    'Alexis12119/nightly.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'eldritch-theme/eldritch.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      terminal_colors = true,
    },
  },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      terminal_colors = true,
    },
  },
  {
    -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('tokyonight').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = 'storm', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = false },
          keywords = { italic = false },
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = 'dark', -- style for sidebars, see below
          floats = 'dark', -- style for floating windows
        },
      }
    end,
  },
  {
    'catppuccin/nvim',
    -- lazy = true,
    name = 'catppuccin',
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { 'undercurl' },
            hints = { 'undercurl' },
            warnings = { 'undercurl' },
            information = { 'undercurl' },
          },
        },
        navic = { enabled = true, custom_bg = 'lualine' },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
}

return {
  { 'rebelot/kanagawa.nvim' },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'Mofiqul/vscode.nvim' },
  { 'yeddaif/neovim-purple' },
  { 'scottmckendry/cyberdream.nvim' },
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
}

return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local logo = [[
                                                                             
               ████ ██████           █████      ██                     
              ███████████             █████                             
              █████████ ███████████████████ ███   ███████████   
             █████████  ███    █████████████ █████ ██████████████   
            █████████ ██████████ █████████ █████ █████ ████ █████   
          ███████████ ███    ███ █████████ █████ █████ ████ █████  
         ██████  █████████████████████ ████ █████ █████ ████ ██████ 
      ]]

      logo = string.rep('\n', 8) .. logo .. '\n\n'

      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = vim.split(logo, '\n'),
          center = {
            { action = 'Telescope find_files', desc = ' Find file', icon = ' ', key = 'SPC s f' },
            { action = 'ene | startinsert', desc = ' New file', icon = ' ', key = 'SPC n n' },
            { action = 'Telescope oldfiles', desc = ' Recent files', icon = ' ', key = 'SPC s.' },
            { action = 'Telescope live_grep', desc = ' Find text', icon = ' ', key = 'SPC sw' },
            -- { action = 'lua require("persistence").load()', desc = ' Restore Session', icon = ' ', key = 'qs' },
            { action = 'qall!', desc = ' Quit', icon = ' ', key = 'QQ' },
          },
          footer = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
          end,
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
}

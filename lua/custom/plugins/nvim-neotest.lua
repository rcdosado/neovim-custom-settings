return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',

      -- language specific
      'nvim-neotest/neotest-python',
    },
    -- lazy = true,
    config = function()
      require('neotest').setup {
        log_level = vim.log.levels.DEBUG,
        strategies = {
          integrated = {
            width = 180,
          },
        },
        adapters = {
          require 'neotest-python' {
            -- args = { '--log-level', 'DEBUG' },
            runner = 'pytest',
            python = 'python',
            dap = { justMyCode = false, console = 'integratedTerminal', subProcess = false },
          },
        },
        status = { virtual_text = true, signs = true },
        output = { open_on_run = true },
      }

      -- Keymaps
      vim.keymap.set('n', '<leader>ntf', function()
        require('neotest').run.run(vim.fn.expand '%')
      end, { desc = 'Run File' })

      vim.keymap.set('n', '<leader>nra', function()
        require('neotest').output.open { enter = true, last_run = true }
      end, { desc = 'Run attached' })

      vim.keymap.set('n', '<leader>nta', function()
        require('neotest').run.run(vim.loop.cwd())
      end, { desc = 'Run All Test Files' })

      vim.keymap.set('n', '<leader>ntt', function()
        require('neotest').run.run()
      end, { desc = 'Run Nearest' })

      vim.keymap.set('n', '<leader>ntl', function()
        require('neotest').run.run_last()
      end, { desc = 'Run Last test' })

      vim.keymap.set('n', '<leader>nss', function()
        require('neotest').summary.toggle()
      end, { desc = 'Toggle Summary' })

      vim.keymap.set('n', '<leader>nso', function()
        require('neotest').output.open { enter = true, auto_close = true }
      end, { desc = 'Show Output' })

      vim.keymap.set('n', '<leader>nsp', function()
        require('neotest').output_panel.toggle()
      end, { desc = 'Toggle Output Panel' })

      vim.keymap.set('n', '<leader>ntx', function()
        require('neotest').run.stop()
      end, { desc = 'Stop' })

      vim.keymap.set('n', '[n', '<cmd>lua require("neotest").jump.prev({status = "failed"})<CR>', { silent = true })
      vim.keymap.set('n', ']n', '<cmd>lua require("neotest").jump.next({status = "failed"})<CR>', { silent = true })
    end,
  },
}

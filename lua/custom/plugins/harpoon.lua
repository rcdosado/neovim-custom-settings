return {
  {
    'ThePrimeagen/harpoon',
    lazy = true,
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      -- REQUIRED
      harpoon:setup {}

      -- REQUIRED

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():append()
      end)
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set('n', ',g', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', ',h', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', ',f', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', ',j', function()
        harpoon:list():select(4)
      end)

      vim.keymap.set('n', ',d', function()
        harpoon:list():select(5)
      end)

      vim.keymap.set('n', ',k', function()
        harpoon:list():select(6)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
    lazy = true,
  },
}

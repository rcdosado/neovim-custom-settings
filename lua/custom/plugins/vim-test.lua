return {
  {
    "vim-test/vim-test",
    dependencies = { "nvim-lua/plenary.nvim" },  -- Required for some async features
    keys = {  -- Optional: Keybindings (customize as needed)
      { "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test Nearest" },
      { "<leader>tf", "<cmd>TestFile<cr>", desc = "Test File" },
      { "<leader>ts", "<cmd>TestSuite<cr>", desc = "Test Suite" },
      { "<leader>tl", "<cmd>TestLast<cr>", desc = "Rerun Last Test" },
    },
    config = function()
      -- Configure test strategies (async requires Neovim job control)
      vim.g["test#python#patterns"] = {"test*.py", "test_*.py", "tests.py"}
      vim.g["test#python#runner"] = "djangotest"  -- Default (others: "pytest", basic", "dispatch")
      vim.g["test#python#unittest#executable"] = "env312/Scripts/python"  
      vim.g["test#python#unittest#options"] = "manage.py test"  

      vim.g["test#strategy"] = "neovim"  -- Default (others: "basic", "dispatch")
      vim.g["test#neovim#term_position"] = "belowright"  -- Split window position
      vim.g["test#verbose"] = 1
    end,
    lazy = false,
  }
}

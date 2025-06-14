-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
      {
        'nvim-telescope/telescope-frecency.nvim',
      },
      {
        'andrew-george/telescope-themes',
      },
      {
        'crispgm/telescope-heading.nvim',
      },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`

      local function filenameFirst(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == '.' then
          return tail
        end
        return string.format('%s\t\t%s', tail, parent)
      end

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'TelescopeResults',
        callback = function(ctx)
          vim.api.nvim_buf_call(ctx.buf, function()
            vim.fn.matchadd('TelescopeParent', '\t\t.*$')
            vim.api.nvim_set_hl(0, 'TelescopeParent', { link = 'Comment' })
          end)
        end,
      })

      local egrep_actions = require 'telescope._extensions.egrepify.actions'

      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          -- remove this line to old format
          -- path_display = filenameFirst,

          file_ignore_patterns = {
            'node_modules',
            '%_files/',
            '%_cache',
            '.git/',
            'site_libs',
            '.venv',
            'env39',
            'env312',
          },

          layout_strategy = 'flex',
          -- sorting_strategy = 'ascending',
          -- layout_config = {
          --   prompt_position = 'top',
          -- },
        },
        pickers = {
          find_command = {
            'rg',
            '--files',
            '--hidden',
            '--glob',
            '!**/.git/*',
          },
          live_grep = {
            file_ignore_patterns = { 'node_modules', 'vendor', '.git', '.venv', 'env39', 'env312' },
            additional_args = function(_)
              return { '--hidden' }
            end,
          },
          find_files = {
            file_ignore_patterns = { 'node_modules', 'vendor', '.git', '.venv', 'env39', 'env312' },
            hidden = true,
          },
        },
        extensions = {
          egrepify = {
            -- intersect tokens in prompt ala "str1.*str2" that ONLY matches
            -- if str1 and str2 are consecutively in line with anything in between (wildcard)
            AND = true, -- default
            permutations = false, -- opt-in to imply AND & match all permutations of prompt tokens
            lnum = true, -- default, not required
            lnum_hl = 'EgrepifyLnum', -- default, not required, links to `Constant`
            col = false, -- default, not required
            col_hl = 'EgrepifyCol', -- default, not required, links to `Constant`
            title = true, -- default, not required, show filename as title rather than inline
            filename_hl = 'EgrepifyFile', -- default, not required, links to `Title`
            -- suffix = long line, see screenshot
            -- EXAMPLE ON HOW TO ADD PREFIX!
            prefixes = {
              -- ADDED ! to invert matches
              -- example prompt: ! sorter
              -- matches all lines that do not comprise sorter
              -- rg --invert-match -- sorter
              ['!'] = {
                flag = 'invert-match',
              },
              -- HOW TO OPT OUT OF PREFIX
              -- ^ is not a default prefix and safe example
              ['^'] = false,
            },
            -- default mappings
            mappings = {
              i = {
                -- toggle prefixes, prefixes is default
                ['<C-z>'] = egrep_actions.toggle_prefixes,
                -- toggle AND, AND is default, AND matches tokens and any chars in between
                ['<C-a>'] = egrep_actions.toggle_and,
                -- toggle permutations, permutations of tokens is opt-in
                ['<C-r>'] = egrep_actions.toggle_permutations,
              },
            },
          },
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          telekasten = {
            path_display = filenameFirst,
          },
          persisted = {
            layout_config = { width = 0.5, height = 0.55 },
          },
          themes = {
            -- you can add regular telescope config
            -- that you want to apply on this picker only
            layout_config = {
              horizontal = {
                width = 0.8,
                height = 0.7,
              },
            },
            -- extension specific config
            enable_previewer = true, -- (boolean) -> show/hide previewer window
            enable_live_preview = true, -- (boolean) -> enable/disable live preview
            -- ignore = { 'default', 'desert', 'elflord', 'habamax' },
            -- (table) -> provide table of theme names to ignore
            -- all builtin themes are ignored by default
            persist = {
              enabled = true, -- enable persisting last theme choice

              -- override path to file that execute colorscheme command
              path = vim.fn.stdpath 'config' .. '/lua/current-theme.lua',
            },
          },
          heading = {
            treesitter = true,
            picker_opts = {
              layout_config = { width = 0.8, preview_width = 0.5 },
              layout_strategy = 'horizontal',
            },
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'frecency')
      pcall(require('telescope').load_extension, 'persisted')
      pcall(require('telescope').load_extension, 'themes')
      pcall(require('telescope').load_extension, 'egrepify')
      pcall(require('telescope').load_extension, 'heading')

      -- SHORTCUTS

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      -- vim.keymap.set('n', '<leader>th', builtin.colorscheme, { desc = 'Switch [t][h]emes' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [g]rep' })
      vim.keymap.set('n', '<leader>sG', '<cmd>Telescope egrepify<cr>', { desc = '[S]earch by e[G]repify' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>rg', builtin.registers, { desc = 'Search VIM [R]e[G]isters' })
      vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = 'Search [W]ork[S]pace symbols' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- NON BUILT-IN

      vim.keymap.set('n', '<leader>st', '<cmd>Telescope themes<cr>', { desc = 'swi[T]ch t[H]emes' })
      vim.keymap.set(
        'n',
        '<leader>s,',
        ":lua require('telescope').extensions.frecency.frecency()<CR>",
        { desc = '[S]earch Frequently open Files ("." for repeat)' }
      )
      vim.keymap.set('n', '<leader>se', '<cmd>Telescope persisted<cr>', { desc = '[S]earch s[E]ssions' })
      vim.keymap.set('n', '<leader>dh', '<cmd>Telescope heading<cr>', { desc = '[D]isplay [H]eading' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      vim.keymap.set('n', '<leader>cs', function()
        builtin.live_grep { search_dirs = { 'c:/dev/codes' }, shorten_path = true, nowait = true }
      end, { desc = '[C]ode [S]earch' })

      vim.keymap.set('n', '<leader>cf', function()
        builtin.find_files { search_dirs = { 'c:/dev/codes' }, shorten_path = true, nowait = true }
      end, { desc = '[C]ode [F]iles find' })
    end,
    lazy = true,
  },
}
-- vim: ts=2 sts=2 sw=2 et

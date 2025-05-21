return {
  {
    "catppuccin/nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin-frappe]])
    end,
  },
  {
    'numToStr/Comment.nvim',

    keys = { { "<leader>/", mode = { "n", "v" }, desc = "Toggle comment" } },
    event = "VeryLazy",
    opts = {
      padding = true,
      toggler  = { line = "<leader>/", block = "<leader>?" },
      opleader = { line = "<leader>/", block = "<leader>?" },
    },
  },
  {
    "ntpeters/vim-better-whitespace",
    event = { "BufReadPre", "BufNewFile" },      -- lazy-load on first file
    init = function()
      -- ↓ these globals must be defined *before* the plugin is sourced
      vim.g.better_whitespace_enabled = 1        -- highlight trailing WS by default
      vim.g.show_spaces_that_precede_tabs = 1    -- flag mixed indent
      vim.g.better_whitespace_filetypes_blacklist = { -- disable in…
        "diff", "gitcommit", "qf", "help", "markdown"
      }
    end,
    keys = {
      { "<leader>ws", "<cmd>StripWhitespace<CR>",  desc = "Strip trailing whitespace" },
      { "<leader>wt", "<cmd>ToggleWhitespace<CR>", desc = "Toggle whitespace highlight" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",                      -- keep parsers fresh
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-fugitive",

    -- Load only when a Fugitive command is invoked
    cmd = {
      "Git",
      "G",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gedit",
      "Gread",
      "Gwrite",
      "GMove",
      "GRename",
      "GDelete",
      "Ggrep",
      "Glgrep",
    },

    -- Optional key-maps for common tasks
    keys = {
      { "<leader>gs", "<cmd>Git<CR>",        desc = "  Git status" },
      { "<leader>gc", "<cmd>Git commit<CR>", desc = "  Commit" },
      { "<leader>gp", "<cmd>Git push<CR>",   desc = "  Push" },
      { "<leader>gl", "<cmd>Git pull<CR>",   desc = "  Pull" },
      { "<leader>gd", "<cmd>Gvdiffsplit<CR>",desc = "  Vertical diff" },
    },
  },
  {
    "tpope/vim-surround",

    -- Load on first normal/visual/insert keystroke in a real buffer
    event = { "BufReadPre", "BufNewFile" },

    -- (Optional) adddescriptive entries for which-key or Lazy’s key UI
    keys = {
      { "ys", mode = { "n", "v" }, desc = "Add surround" },
      { "cs",                      desc = "Change surround" },
      { "ds",                      desc = "Delete surround" },
      { "yss",                     desc = "Add surround to current line" },
    },
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },      -- load on first real buffer
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "tpope/vim-eunuch",

    -- Lazy-load only when one of Eunuch's commands is invoked
    cmd = {
      "Remove", "Delete", "Unlink",
      "Move", "Rename",
      "Chmod", "Mkdir",
      "SudoWrite", "SudoEdit",
      "Wall",
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "claude",
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false", -- for windows
    build = (function()
      local uname = vim.loop.os_uname().sysname
      if uname == "Windows_NT" then
        return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      else
        return "make"
      end
    end)(),
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    }
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    event   = { "BufReadPre", "BufNewFile" },

    config = function()
      require("mini.align").setup()
      require("mini.surround").setup()
      require("mini.pairs").setup()
    end,
  },
  {
    "nanotee/zoxide.vim",

    -- Nothing is loaded until you call one of its commands
    cmd = { "Z", "Lz", "Tz", "Zi", "Lzi", "Tzi" },

    -- Optional key-maps (feel free to change/remove)
    keys = {
      { "<leader>zz",  ":Z<Space>",                      desc = "Jump (zoxide)" },   -- start :Z …
      { "<leader>zi",  ":Zi<Space>",                     desc = "Interactive jump" },-- fzf / vim.ui
      { "<leader>zl",  ":Lz<Space>",                     desc = "Window-local jump" },
      { "<leader>zt",  ":Tz<Space>",                     desc = "Tab-local jump"    },
    },
  },
  {
    "sbdchd/neoformat",
    cmd  = { "Neoformat" },
    keys = {
      { "<leader>nf", ":Neoformat<CR>", desc = "Format buffer (Neoformat)" },
    },
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd   = "Mason",
    opts  = {
      ui = {
        border = "rounded",
        icons  = {
          package_installed  = "✓",
          package_pending    = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
        "rust_analyzer",
        "powershell_es",
        "terraformls",
      },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",                     -- lazy-load on first insert
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",                   -- needed for :/?, :cmdline completion
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },

    config = function()
      --------------------------------------------------------------------------+
      -- Helpers                                                                |
      --------------------------------------------------------------------------+
      local cmp     = require("cmp")
      local luasnip = require("luasnip")

      -- friendly-snippets on-demand
      require("luasnip.loaders.from_vscode").lazy_load()

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
        and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      --------------------------------------------------------------------------+
      -- Core completion                                                        |
      --------------------------------------------------------------------------+
      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
          ["<C-f>"]     = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"]     = cmp.mapping.abort(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),  -- ⏎ to accept

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip"  },
        }, {
          { name = "buffer"   },
        }),
      })

      --------------------------------------------------------------------------+
      -- Cmdline completion ( / ? : )                                           |
      --------------------------------------------------------------------------+
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })

      cmp.setup.cmdline(":", {
        mapping  = cmp.mapping.preset.cmdline(),
        sources  = cmp.config.sources(
          { { name = "path" } },
          { { name = "cmdline" } }
        ),
        matching = { disallow_symbol_nonprefix_matching = false },
      })

      --------------------------------------------------------------------------+
      -- Expose capabilities for lspconfig                                      |
      --------------------------------------------------------------------------+

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('lspconfig')['powershell_es'].setup {
        capabilities = capabilities,
      }
      require('lspconfig')['terraformls'].setup {
        capabilities = capabilities
      }
      require('lspconfig')['rust_analyzer'].setup {
        capabilities = capabilities
      }
      require('lspconfig')['gopls'].setup {
        capabilities = capabilities
      }

    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {},
    keys = {
      {
        "<leader><leader>f",
        function()
          local hop  = require("hop")
          local hint = require("hop.hint")
          hop.hint_char1({
            direction        = hint.HintDirection.AFTER_CURSOR,
            current_line_only = false,
          })
        end,
        mode = "n",
        desc = "Hop forward to 1 char",
      },
      {
        "<leader><leader>F",
        function()
          local hop  = require("hop")
          local hint = require("hop.hint")
          hop.hint_char1({
            direction        = hint.HintDirection.BEFORE_CURSOR,
            current_line_only = false,
          })
        end,
        mode = "n",
        desc = "Hop backward to 1 char",
      },
      {
        "<leader>w",
        function()
          local hop  = require("hop")
          local hint = require("hop.hint")
          hop.hint_words({
            hint_position = hint.HintPosition.BEGIN,
          })
        end,
        mode = "n",
        desc = "Hop to word-begin",
      },
      {
        "<leader>e",
        function()
          local hop  = require("hop")
          local hint = require("hop.hint")
          hop.hint_words({
            hint_position = hint.HintPosition.END,
          })
        end,
        mode = { "n", "v" },
        desc = "Hop to word-end",
      },
      {
        "<leader>e",
        function()
          local hop  = require("hop")
          local hint = require("hop.hint")
          hop.hint_words({
            hint_position = hint.HintPosition.END,
            inclusive_jump = true,
          })
        end,
        mode = "o",
        desc = "Hop to word-end (operator-pending, inclusive)",
      },
    },

    config = function(_, opts)
      require("hop").setup(opts)
    end,
  },
  {
    "airblade/vim-rooter",
    event = { "BufReadPost", "BufNewFile" },

    init = function()
      vim.g.rooter_patterns = {
        ".git",         -- Git repo
        ".hg",          -- Mercurial
        ".svn",         -- Subversion
        "package.json", -- Node / JS / TS
        "go.mod",       -- Go modules
        "Cargo.toml",   -- Rust
        "pyproject.toml", -- Python (PEP 517)
        "Makefile",
        "composer.json",
      }

      -- Change *window-local* cwd (recommended) instead of the global one
      vim.g.rooter_cd_cmd = "lcd"

      -- Suppress the "--working directory changed" echo
      vim.g.rooter_silent_chdir = 1

      -- If you occasionally want to disable auto-rooting:
      --   :RooterToggle
      --   let g:rooter_manual_only = 1
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",                      -- lazy-load on :Telescope *or* any key below
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "jvgrootveld/telescope-zoxide", lazy = true },
      { "cljoly/telescope-repo.nvim",   lazy = true },
    },

    keys = {
      { "<C-p>",      function() require("telescope.builtin").find_files() end,
      desc = "Find files (<C-p>)" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end,
      desc = "Live grep" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end,
      desc = "Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end,
      desc = "Help tags" },
      { "<leader>gr", function() require("telescope.builtin").lsp_references() end,
      desc = "LSP references" },
      { "<leader>fc", "<cmd>Telescope colorscheme<CR>",
      desc = "Choose colorscheme" },

      -- extension pickers
      { "<leader>fz", "<cmd>Telescope zoxide list<CR>",
      desc = "Zoxide directories" },
      { "<leader>fr", "<cmd>Telescope repo list<CR>",
      desc = "Git repositories" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("zoxide")
      telescope.load_extension("repo")
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = {
      "Trouble",
    },
    keys = {
      -- Global diagnostics list
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>",
      desc = "Diagnostics (doc)" },

      -- LSP references/defs/… for word under cursor
      { "gr",         "<cmd>Trouble lsp_references<CR>",
      desc = "LSP references" },
      { "gd",         "<cmd>Trouble lsp_definitions<CR>",
      desc = "LSP definitions" },
      { "gi",         "<cmd>Trouble lsp_implementations<CR>",
      desc = "LSP implementations" },
      { "gt",         "<cmd>Trouble lsp_type_definitions<CR>",
      desc = "LSP type definitions" },
    },

    opts = {                          -- ← trouble.setup({ … })
      position             = "bottom",           -- bottom pane
      height               = 12,
      -- icons                = true,
      use_diagnostic_signs = true,    -- reuse :sign column icons
      cycle_results        = true,           -- wrap j/k navigation
    },

    config = function(_, opts)
      require("trouble").setup(opts)
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },

    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "File explorer" },
    },

    config = function()
      require("nvim-tree").setup({
        -- quit the tree after opening a file (tiny QoL tweak)
        actions = { open_file = { quit_on_open = true } },
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },

    config = function()
      require("lualine").setup()
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup{}
    end,
  }
}

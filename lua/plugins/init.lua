return {
  {
    "mfussenegger/nvim-jdtls",
  },

  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    lazy = true,
    ft = { "dart", "yaml" },
    -- config = true,
    config = function()
      require("flutter-tools").setup {
        -- decorations = {
        --   statusline = {
        --     app_version = true,
        --     device = true,
        --     project_config = true,
        --   },
        -- },
        -- fvm = true,
      } -- use defaults
    end,
  },

  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
  },
  {
    "jonarrien/telescope-cmdline.nvim",
    "jvgrootveld/telescope-zoxide",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  },

  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- lazy, only load diffview by these commands
    cmd = {
      "DiffviewFileHistory",
      "DiffviewOpen",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
    },
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
      },
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "pyright",
        "typescript-language-server",
        "eslint-lsp",
        "tailwindcss-language-server",
        "clangd",
        "angular-language-server",
        "csharp-language-server",
        "deno",
        "json-lsp",
        "rust-analyzer",
        "vetur-vls",
        "jdtls",
      },
    },
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
}

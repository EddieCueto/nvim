local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local plugins = {
    {
        'pwntester/octo.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require "octo".setup()
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    {
        "windwp/nvim-ts-autotag",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require('nvim-ts-autotag').setup({})
        end,
        lazy = true,
        event = "VeryLazy"
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "dockerfile",
                    "json",
                    "julia",
                    "latex",
                    "lua",
                    "vim",
                    "vimdoc",
                    "zig",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd('colorscheme tokyonight-night')
        end,
    },
    'nvim-treesitter/playground',
    'ThePrimeagen/harpoon',
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Telescope Undo" })
        end
    },
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Fugitive Panel" })
        end
    },
    { 'tpope/vim-repeat' },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    },
    { 'vimwiki/vimwiki' },
    { "nvim-tree/nvim-tree.lua" },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "olimorris/neotest-rspec",
            "haydenmeade/neotest-jest",
            "zidhuss/neotest-minitest",
            "mfussenegger/nvim-dap",
            "jfpedroza/neotest-elixir",
        },
        opts = {
            adapters = {
                ["neotest-elixir"] = {},
                ["neotest-minitest"] = {},
            },
        },
        config = function()
            local neotest = require('neotest')

            local neotest_jest = require('neotest-jest')({
                jestCommand = 'npm test --'
            })
            neotest_jest.filter_dir = function(name)
                return name ~= 'node_modules' and name ~= '__snapshots__'
            end

            neotest.setup({
                adapters = {
                    require('neotest-rspec')({
                        rspec_cmd = function()
                            return vim.tbl_flatten({
                                "bundle",
                                "exec",
                                "rspec",
                            })
                        end
                    }),
                    neotest_jest,
                },
                output_panel = {
                    enabled = true,
                    open = "botright split | resize 15"
                },
                quickfix = {
                    open = false,
                }
            })
        end
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                config = function(_, opts)
                    local dap = require("dap")
                    local dapui = require("dapui")
                    dapui.setup(opts)
                    dap.listeners.after.event_initialized["dapui_config"] = function()
                        dapui.open({})
                    end
                    dap.listeners.before.event_terminated["dapui_config"] = function()
                        dapui.close({})
                    end
                    dap.listeners.before.event_exited["dapui_config"] = function()
                        dapui.close({})
                    end
                end,
            },
            {
                "suketa/nvim-dap-ruby",
                config = function()
                    require("dap-ruby").setup()
                end,
            },
            {
                "theHamsta/nvim-dap-virtual-text",
                opts = {},
            },
            {
                "jay-babu/mason-nvim-dap.nvim",
                dependencies = "mason.nvim",
                cmd = { "DapInstall", "DapUninstall" },
                opts = {
                    automatic_installation = true,
                    handlers = {},
                    ensure_installed = {},
                },
            },
            { "jbyuki/one-small-step-for-vimkind", module = "osv" },
        },
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        dependencies = { "mfussenegger/nvim-dap" }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'palenight'
                }
            })
        end
    },
    {
        'lervag/vimtex'
    },
    {
        'bronson/vim-trailing-whitespace'
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
            })
        end
    },
    {
        'junegunn/fzf',
        build = ":call fzf#install()"
    },
    'nanotee/zoxide.vim',
    'nvim-telescope/telescope-ui-select.nvim',
    'debugloop/telescope-undo.nvim',
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
            { 'nvim-telescope/telescope.nvim' },
        },
    },
    'jinh0/eyeliner.nvim',
    {
        "anuvyklack/windows.nvim",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim"
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup()
        end
    },
    {
        'voldikss/vim-floaterm',
        config = function()
            vim.keymap.set("n", "<leader>ft",
                "<cmd>:FloatermNew --height=0.3 --width=0.8 --wintype=float --name=floaterm1 --position=center --autoclose=2<CR>", { desc = "Open FloatTerm" })
            vim.keymap.set("n", "<leader>flt",
                "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
            vim.keymap.set("t", "<leader>flt",
                "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
        end
    },
    {
        'tummetott/unimpaired.nvim',
        config = function()
            require('unimpaired').setup()
        end
    },
    'airblade/vim-gitgutter',
    'mg979/vim-visual-multi',
    'tpope/vim-rails',
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async'
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
            { "rafamadriz/friendly-snippets" },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'saadparwaiz1/cmp_luasnip' },
        }
    },
    {
        --'jose-elias-alvarez/null-ls.nvim',
        'nvimtools/none-ls.nvim',
        config = function()
            require('null-ls').setup({

            })
        end,
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        'folke/which-key.nvim',
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
        end,
        opts = {}
    },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    {
        "aaronhallaert/advanced-git-search.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "tpope/vim-fugitive",
            'tpope/vim-rhubarb',
        },
    },
}

require('lazy').setup(plugins, {
    change_detection = {
        notify = false,
    }
})

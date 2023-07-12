-- Install Packer automatically if it"s not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"



    --use "tanvirtin/monokai.nvim"
    -- Autocomplete
    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }
    use { "williamboman/mason-lspconfig.nvim"}
    use { "neovim/nvim-lspconfig" }            -- previous installed
    -- Cmp
    use { "hrsh7th/nvim-cmp", config = [[require("config.nvim-cmp")]] }
    use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
    use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }        -- buffer auto-completion
    use { "hrsh7th/cmp-path", after = "nvim-cmp" }          -- path auto-completion
    use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }       -- cmdline auto-completion
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- helps Vimtex completions
    use { "hrsh7th/cmp-omni" }

    -- ALE Linter
    use { "dense-analysis/ale" }

    -- :FixWhitespace
    use "bronson/vim-trailing-whitespace"
    -- Close parenthesis
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- gitgutter
    use { "airblade/vim-gitgutter" }

    -- Mappings
    use { "folke/which-key.nvim" }

    -- zig.vim
    use { "ziglang/zig.vim" }

    -- julia-vim
    --use { "JuliaEditorSupport/julia-vim" }

    -- LaTeX
    use { "lervag/vimtex" } -- essential for LaTeX; Vimscript
    use { "kdheepak/cmp-latex-symbols" }
    use { "jbyuki/nabla.nvim" } -- show symbols in editor
    use {
        "brymer-meneses/grammar-guard.nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "williamboman/nvim-lsp-installer"
        }
    }

    -- Devicons
    use { "nvim-tree/nvim-web-devicons" }

    -- Lua Line
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    }

    -- nvim tree
    use { "nvim-tree/nvim-tree.lua" }

    -- Airline
    --[[
    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"
    ]]--

    -- vim-visual-multi
    use { "mg979/vim-visual-multi" }

    -- Telescope fuzzy finder
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        -- or                            , branch = "0.1.x",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    -- Nord colorscheme
    --[[
    use {
        "arcticicestudio/nord-vim",
        config = function ()
            vim.cmd("colorscheme nord")
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    }
    ]]--

    -- Rose-Pine
    use ({
        "rose-pine/neovim",
        as = "rose-pine",
        config = function ()
            vim.cmd("colorscheme rose-pine")
        end
    })

    -- Shadotheme
    --[[
    use ({
        "Shadorain/shadotheme",
        config = function ()
            vim.cmd("colorscheme shado")
        end
    })
    ]]--

    -- Terminal toggle
    use ({"akinsho/toggleterm.nvim", tag = "*",
    config = function()
        require("toggleterm").setup()
    end
    })

    -- Alpha-nvim
    use {
        "goolord/alpha-nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            require"alpha".setup(require"alpha.themes.startify".config)
        end
    }

    -- Source code coloring
    use {
        "nvim-treesitter/nvim-treesitter",
        {run = ":TSUpdate"},
    }
    use "nvim-treesitter/playground"
    -- Harpoon
    use "nvim-lua/plenary.nvim"
    use "ThePrimeagen/harpoon"
    -- Undotree
    use "mbbill/undotree"
    -- Fugitive
    use "tpope/vim-fugitive"
    -- Buffers for nvim
    use {"akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons"}


    ---------------------------------------
    -- NOTE: PUT YOUR THIRD PLUGIN HERE --
    ---------------------------------------

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)


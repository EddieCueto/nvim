-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy Finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Colorscheme
  --use({
  --        'rose-pine/neovim',
  --        as = 'rose-pine',
  --        config = function()
  --      	  vim.cmd('colorscheme rose-pine')
  --        end
  --})
  
  use { "folke/tokyonight.nvim" }

  -- Color Coloring
  use({ 'nvim-treesitter/nvim-treesitter', { run =  ':TSUpdate' } })
  use( 'nvim-treesitter/playground' )

  -- Quick access to files
  use( 'ThePrimeagen/harpoon' )

  -- Recovery
  use( 'mbbill/undotree' )

  -- Git Status
  use( 'tpope/vim-fugitive' )
  use('airblade/vim-gitgutter')

  -- Language Servers
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {                                      -- Optional
          'williamboman/mason.nvim',
          run = function()
              pcall(vim.cmd, 'MasonUpdate')
          end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
  }
}

    -- Code formatting
    use "lukas-reineke/lsp-format.nvim"

    -- Latex on NVIM
    use 'lervag/vimtex'

    -- :FixWhitespace
    use "bronson/vim-trailing-whitespace"

    -- Terminal
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- Parenthesis complete
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

end)

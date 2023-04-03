-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use({ 'rose-pine/neovim', as = 'rose-pine' })
  vim.cmd('colorscheme rose-pine')

  -- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  -- Below is the Packer equivalent
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }
  use('neomake/neomake')
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use('JoosepAlviste/nvim-ts-context-commentstring')
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup(
        {
          pre_hook = require('ts_context_commentstring.integrations.comment_nvim')
              .create_pre_hook(),
        })
    end
  }
  use("lukas-reineke/indent-blankline.nvim")
  use('windwp/nvim-ts-autotag')
end)

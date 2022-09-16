local ok, packer = pcall(require, "packer")
if not ok then
  print("Packer is not installed")
  return
end

vim.cmd('packadd packer.nvim')

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- utility
  use 'nvim-lua/plenary.nvim'
  use 'vim-denops/denops.vim'

  -- Fades inactive buffers
  use 'TaDaa/vimade'

  -- Filer
  use 'lambdalisue/fern.vim'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'

  -- LSP manager
  use {
    'williamboman/mason.nvim',
    config = function() require('mason').setup() end,
  }
  use {
    'williamboman/mason-lspconfig.nvim',
    requires = { 'williamboman/mason.nvim' },
    after = { 'mason.nvim', 'nvim-cmp', 'nvim-lspconfig' },
    config = function() require('mason-lspconfig').setup() end,
  }
  -- LSP
  use 'neovim/nvim-lspconfig'
  -- pictogram
  use 'onsails/lspkind.nvim'
  -- snippet engine
  use 'L3MON4D3/LuaSnip'
  -- complete
  use 'hrsh7th/nvim-cmp'
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Autotag
  use {
    'windwp/nvim-ts-autotag',
    config = function() require('nvim-ts-autotag').setup() end
  }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt', 'vim', 'fern' }
      })
    end
  }

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- git plugins
  use {
    'TimUntersberger/neogit',
    requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' },
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'lambdalisue/gina.vim',
    opt = true,
    cmd = { 'Gina' },
  }

  -- 翻訳
  use {
    'skanehira/denops-translate.vim',
    requires = { 'vim-denops/denops.vim'}
  }

  -- colorscheme
  use 'EdenEast/nightfox.nvim'
end)
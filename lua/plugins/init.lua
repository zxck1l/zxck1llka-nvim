return {
  "folke/neodev.nvim",
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
   'neovim/nvim-lspconfig',
-- 'hrsh7th/cmp-nvim-lsp',
-- 'hrsh7th/cmp-buffer',
-- 'hrsh7th/cmp-path',
-- 'hrsh7th/cmp-cmdline',
-- 'hrsh7th/nvim-cmp',


'L3MON4D3/LuaSnip',
'saadparwaiz1/cmp_luasnip',
"SmiteshP/nvim-navic",
"LunarVim/breadcrumbs.nvim",
"rafi/awesome-vim-colorschemes",
'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    },


"Dan7h3x/signup.nvim",
    branch = "main",
    opts = {
          -- Your configuration options here
    },
    config = function(_,opts)
      require("signup").setup(opts)
    end
}



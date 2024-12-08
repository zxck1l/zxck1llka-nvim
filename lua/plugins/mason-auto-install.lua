return {
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  dependencies = { "mason.nvim" },
  config = function()
    require("mason-lspconfig").setup {
      automatic_installation = true
    }
  end
}


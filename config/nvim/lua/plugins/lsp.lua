-- from mason-lspconfig.nvim documentation
local handlers = {
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup{
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
  end,
}

-- load mason and lspconfig in one hook, as described in https://github.com/williamboman/mason-lspconfig.nvim
return {
  {
    "williamboman/mason.nvim", config = function() require("mason").setup() end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {'williamboman/mason.nvim'},
    config = function()
      require("mason-lspconfig").setup({ ensure_installed = { "clangd", "pylsp", "neocmake" } })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    event = "InsertEnter",
    config = function() 
        require("cmp").setup{
            sources = { 
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
            }
        }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason-lspconfig.nvim", "hrsh7th/nvim-cmp"},
    config = function()
      require("mason-lspconfig").setup_handlers(handlers) 
    end
  }
}

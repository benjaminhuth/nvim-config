local handlers = {
   -- The first entry (without a key) will be the default handler
   -- and will be called for each installed server that doesn't have
   -- a dedicated handler.
   function (server_name) -- default handler (optional)
       require("lspconfig")[server_name].setup {}
   end,
   -- Next, you can provide targeted overrides for specific servers.
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
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason-lspconfig.nvim"},
    config = function()
      require("mason-lspconfig").setup_handlers(handlers) 
    end
  }
}

-- from mason-lspconfig.nvim documentation
local handlers = {
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
	end,
}

-- use tab to scroll forward and shift-tab to scroll back
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmpMappings = {
	["<C-i>"] = function(fallback)
		local cmp = require("cmp")
		cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		})
	end,

	["<Tab>"] = function(fallback)
		local cmp = require("cmp")
		if not cmp.select_next_item() then
			if vim.bo.buftype ~= "prompt" and has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end
	end,

	["<S-Tab>"] = function(fallback)
		local cmp = require("cmp")
		if not cmp.select_prev_item() then
			if vim.bo.buftype ~= "prompt" and has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end
	end,
}

lspConfig = function()
  vim.lsp.config('pylsp', {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {
              'E231', -- spaces after comma
              'E225', -- spaces around operators
              'E202'  -- whitespaces before ]
            },
            maxLineLength = 100
          }
        }
      }
    }
  })
end

-- load mason and lspconfig in one hook, as described in https://github.com/williamboman/mason-lspconfig.nvim
return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "clangd", "pylsp", "cmake", "bashls" },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      { "neovim/nvim-lspconfig", config = lspConfig }
    },
  },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		event = "InsertEnter",
		config = function()
			require("cmp").setup({
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},
				mapping = cmpMappings,
			})
			vim.opt.pumheight = 10 -- limit completion items
		end,
	},
}

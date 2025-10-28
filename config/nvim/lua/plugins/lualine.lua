return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = { disabled_filetypes = { "NvimTree", "toggleterm" } },
			sections = {
				lualine_a = {},
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { {"filename", path = 1} },  -- path = 1: relative path
				lualine_x = { "filetype" },
				lualine_y = {},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = {},
				lualine_z = { "location" },
			},
		})
	end,
	enabled = true,
}

return {
	-- "romgrk/barbar.nvim",
  "benjaminhuth/barbar.nvim",
  branch = "fix/issue-647", -- fix for error on startup
  dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = { sidebar_filetypes = { NvimTree = true } },
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}

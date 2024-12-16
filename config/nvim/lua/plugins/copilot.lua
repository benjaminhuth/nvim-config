return {
	"zbirenbaum/copilot.lua",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				keymap = {
					accept = "<C-l>",
				},
			},
			panel = { enabled = true },
		})
		vim.keymap.set("n", "<C-k>", function()
			require("copilot.suggestion").toggle_auto_trigger()
		end)
	end,
}

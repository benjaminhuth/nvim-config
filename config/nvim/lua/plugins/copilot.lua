return {
	"zbirenbaum/copilot.lua",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				keymap = {
					accept = "<C-l>",
                    next = "<C-o>", -- this is very german
				},
			},
			panel = { enabled = false },
		})
		vim.keymap.set({"n", "i"}, "<C-k>", function()
			require("copilot.suggestion").toggle_auto_trigger()
		end)
	end,
}

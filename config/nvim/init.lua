require("config.lazy")

-- Disable some providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Settings
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.o.number = true
vim.o.relativenumber = true

-- Shortcuts
local tree = require("nvim-tree.api")
vim.keymap.set("n", "<leader>e", tree.tree.toggle, { desc = "Toggle tree" })

local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })

-- Terminal
local toggleterm = require("toggleterm")
vim.keymap.set("n", "<leader>t", function()
	toggleterm.toggle_command("direction=float", 1)
end, { desc = "Overlay terminal" })
vim.keymap.set("n", "<leader>h", function()
	toggleterm.toggle_command("direction=horizontal", 1)
end, { desc = "Horizontal terminal" })
vim.keymap.set("n", "<leader>v", function()
	toggleterm.toggle_command("direction=vertical", 1)
end, { desc = "Vertical terminal" })

vim.keymap.set("t", "<Esc>", toggleterm.toggle, { remap = true })
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { remap = true })

vim.api.nvim_command("autocmd TermOpen * setlocal nonumber norelativenumber")

-- Buffer switch with tabs
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Tab>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })

-- Dont continue comments in next line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})

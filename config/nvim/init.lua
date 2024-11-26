require("config.lazy")


-- Disable some providers
vim.g.loaded_node_provider=0
vim.g.loaded_perl_provider=0
vim.g.loaded_python3_provider=0
vim.g.loaded_ruby_provider=0


vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

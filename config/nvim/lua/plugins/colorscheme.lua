return { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
        require("catppuccin").setup{
            transparent_background = false,
            background = {
                light = "latte",
                dark = "mocha",
            },
        }
        vim.cmd.colorscheme("catppuccin")
    end,
}
--[[
return { 
    "ellisonleao/gruvbox.nvim", 
    priority = 1000 , 
    config = function() 
        require("gruvbox").setup{ terminal_colors = true }
        vim.cmd("colorscheme gruvbox")
    end
}
--]]

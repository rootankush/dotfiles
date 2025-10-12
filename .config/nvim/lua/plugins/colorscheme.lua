-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false, -- Load immediately to set colorscheme
        priority = 1000, -- Ensure it loads early
        config = function()
            require("kanagawa").setup({
                theme = "dragon", -- Default: "wave", options: "dragon", "lotus"
                transparent = false,
                terminalColors = true,
            })
            vim.cmd("colorscheme kanagawa")
        end,
    },
}

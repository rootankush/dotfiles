return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            config = {
                header = {
                    "   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗   ",
                    "   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║   ",
                    "   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║   ",
                    "   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║   ",
                    "   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║   ",
                    "   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝   ",
                    "",
                },
                shortcut = {
                    { desc = "Find File", group = "Label", key = "f", action = "Telescope find_files" },
                    { desc = "New File",  group = "Label", key = "n", action = "enew" },
                    { desc = "Quit",      group = "Label", key = "q", action = "q" },
                },
            },
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}

return {
    { -- Show CSS Colors
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
        opts = {
            check_ts = true, -- Integrate with Treesitter
            disable_filetype = { "TelescopePrompt", "vim" },
        },
    },
    {
        'alvan/vim-closetag',
        ft = { "html", "lua", "javascriptreact", "typescriptreact" },
    },
}

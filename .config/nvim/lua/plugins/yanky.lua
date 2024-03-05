return
{
    'gbprod/yanky.nvim',
    enabled = true,
    keys = {
        { '<leader>p', '<cmd>Telescope yank_history<cr>', desc = 'Paste from yanky' },
        { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' } },
        { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' } },
        { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' } },
        { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' } },
        { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' } },
        { '<right>y', '<Plug>(YankyCycleForward)' },
        { '<left>y', '<Plug>(YankyCycleBackward)' },
        { '<right>p', '<Plug>(YankyPutIndentAfterLinewise)' },
        { '<left>p', '<Plug>(YankyPutIndentBeforeLinewise)' },
        { '<right>P', '<Plug>(YankyPutIndentAfterLinewise)' },
        { '<left>P', '<Plug>(YankyPutIndentBeforeLinewise)' },
        { '>p', '<Plug>(YankyPutIndentAfterShiftRight)' },
        { '<p', '<Plug>(YankyPutIndentAfterShiftLeft)' },
        { '>P', '<Plug>(YankyPutIndentBeforeShiftRight)' },
        { '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)' },
        { '=p', '<Plug>(YankyPutAfterFilter)' },
        { '=P', '<Plug>(YankyPutBeforeFilter)' },
    },
    opts = {
        highlight = {
            on_put = true,
            on_yank = true,
            timer = 100,
        },
    },
}

-- bootstrap lazy.nvim, LazyVim and your plugins
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
}
require("lazy").setup(plugins, opts)

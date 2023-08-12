local prefix = "<leader><leader>"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󱡀 " or ""
maps.n[prefix] = { desc = icon .. "Harpoon" }
require("astronvim.utils").set_mappings(maps)

return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  { import = "astrocommunity.editing-support/rainbow-delimiters-nvim" },
  { import = "astrocommunity.project/project-nvim" },
  { import = "astrocommunity.motion/harpoon" },
  { import = "astrocommunity.utility/noice-nvim" },
  { import = "astrocommunity.git/git-blame-nvim" },
  { import = "astrocommunity.lsp/lsp-signature-nvim" },
  { import = "astrocommunity.media/presence-nvim" },
  { import = "astrocommunity.project/nvim-spectre" },
  { import = "astrocommunity.editing-support/todo-comments-nvim" },
  { import = "astrocommunity.motion/nvim-surround" },

  -- Customise opts of some community / core plugins
  {
    "noice.nvim",
    opts = function(_, opts)
      opts.presets.bottom_search = false
      opts.lsp.signature = { enabled = false } -- Here I create a PR to fix that: https://github.com/AstroNvim/astrocommunity/pull/518
      return opts
    end,
  },
}

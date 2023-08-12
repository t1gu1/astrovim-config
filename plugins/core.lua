return {

  -- Disable Core plugins
  { "nvim-notify", enabled = false },
  { "heirline.nvim", enabled = false },

  -- Extend Core plugins
  -- Dashboard (With custom image used from dashboard-images.lua)
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- dashboard-images.lua contains few "ASCII" images that you can change
      opts.section.header.val = require("../dashboard-images").cutty_cat

      local button = require("astronvim.utils").alpha_button
      opts.section.buttons.val = {
        button("LDR S l", "  Last Session  "),
        button("LDR S f", "  Find Recent sessions"),
        button("LDR f p", "  Open Project  "),
        button("LDR s", "  Settings  "),
      }
      return opts
    end,
  },
  -- File tree (Move to the right)
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { position = "right", width = 43 },
    },
  },
}

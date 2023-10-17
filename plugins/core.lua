return {

  -- Disable Core plugins
  { "nvim-notify", enabled = false },
  { "heirline.nvim", enabled = false },
  { "neovim-session-manager", enabled = false },
  { "resession.nvim", enabled = false },
  { "nvim-ufo", enabled = false },
  { "neo-tree.nvim", enabled = false },

  -- Extend Core plugins
  -- Dashboard (With custom image used from dashboard-images.lua)
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- dashboard-images.lua contains few "ASCII" images that you can change
      opts.section.header.val = require("user/dashboard-images").cutty_cat

      local button = require("astronvim.utils").alpha_button
      opts.section.buttons.val = {
        button("LDR f p", "  Open Project  "),
        button("LDR s", "  Settings  "),
      }
      return opts
    end,
  },
  -- File tree (Move to the right)
  -- Since I use Harpoon and hide tabs, I want neo-tree to auto manage buffers to close them
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = {
  --     window = { position = "right", width = 43 },
  --     event_handlers = {
  --       {
  --         event = "file_opened",
  --         handler = function(_file_path)
  --           -- auto close buffers when more than 9 has been open and you play with neo tree
  --           -- This is kind of an auto cleanup to keep nvim light (DELETE ALL EVENT_HANDLERS IF YOU USE TABS)
  --
  --           local function tablelength(T)
  --             local count = 0
  --             for _ in pairs(T) do
  --               count = count + 1
  --             end
  --             return count
  --           end
  --
  --           local get_ls = vim.tbl_filter(
  --             function(buf) return vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") end,
  --             vim.api.nvim_list_bufs()
  --           )
  --
  --           if tablelength(get_ls) > 6 then require("astronvim.utils.buffer").close_all(true) end
  --           print(vim.inspect(get_ls))
  --
  --           require("neo-tree.command").execute { action = "close" }
  --         end,
  --       },
  --     },
  --   },
  -- },
}

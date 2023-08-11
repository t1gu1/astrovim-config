local prefix = "<leader><leader>"
local term_string = vim.fn.exists "$TMUX" == 1 and "tmux" or "terminal"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󱡀 " or ""
maps.n[prefix] = { desc = icon .. "Harpoon" }
require("astronvim.utils").set_mappings(maps)

return {
  "AstroNvim/astrocommunity",
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "User AstroFile",
    config = function(_, opts) require "rainbow-delimiters.setup"(opts) end,
  },

  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  { -- further customize the options set by the community
    "catppuccin/nvim",
    optional = true,
    opts = {
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        rainbow_delimiters = true,
        harpoon = true,
      },
    },
  },
  {
    "ahmedkhalf/project.nvim",
    name = "project_nvim",
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    cond = not vim.g.neovide,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },

        signature = {
          enabled = false,
        },
      },
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    init = function() vim.g.lsp_handlers_enabled = false end,
  },

  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "Harpoon" },
    keys = {
      { prefix .. "a", function() require("harpoon.mark").add_file() end, desc = "Add file" },
      { prefix .. "e", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle quick menu" },
      {
        "<C-x>",
        function()
          vim.ui.input({ prompt = "Harpoon mark index: " }, function(input)
            local num = tonumber(input)
            if num then require("harpoon.ui").nav_file(num) end
          end)
        end,
        desc = "Goto index of mark",
      },
      { "<C-p>", function() require("harpoon.ui").nav_prev() end, desc = "Goto previous mark" },
      { "<C-n>", function() require("harpoon.ui").nav_next() end, desc = "Goto next mark" },
      { "<leader>1", function() require("harpoon.ui").nav_file(1) end, desc = "Goto mark 1" },
      { "<leader>2", function() require("harpoon.ui").nav_file(2) end, desc = "Goto mark 2" },
      { "<leader>3", function() require("harpoon.ui").nav_file(3) end, desc = "Goto mark 3" },
      { "<leader>4", function() require("harpoon.ui").nav_file(4) end, desc = "Goto mark 4" },
      { "<leader>5", function() require("harpoon.ui").nav_file(5) end, desc = "Goto mark 5" },
      { "<leader>6", function() require("harpoon.ui").nav_file(6) end, desc = "Goto mark 6" },
      { prefix .. "m", "<cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" },
      {
        prefix .. "t",
        function()
          vim.ui.input({ prompt = term_string .. " Tmux window number: " }, function(input)
            local num = tonumber(input)
            if num then require("harpoon." .. term_string).gotoTerminal(num) end
          end)
        end,
        desc = "Go to Tmux " .. term_string .. " window",
      },
    },
  },
}

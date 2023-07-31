return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

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
      },
    },
  },
  {
    "charludo/projectmgr.nvim",
    lazy = false, -- important!
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
    "zbirenbaum/neodim",
    event = "LspAttach",
    branch = "v2",
    config = function()
      require("neodim").setup {
        refresh_delay = 75, -- time in ms to wait after typing before refresh diagnostics
        alpha = 0.75,
        blend_color = "#000000",
        hide = { underline = true, virtual_text = true, signs = true },
        priority = 100, -- priority of dim highlights (increasing may interfere with semantic tokens!!)
        disable = {}, -- table of filetypes to disable neodim
      }
    end,
  },
  {
    -- "giusgad/pets.nvim", --vOriginal waiting for my PR to be merged: https://github.com/giusgad/pets.nvim/pull/37
    "t1gu1/pets.nvim",
    branch = "secret-sauce",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
    config = function()
      require("pets").setup {
        row = 3, -- the row (height) to display the pet at (higher row means the pet is lower on the screen), must be 1<=row<=10
        col = 0, -- the column to display the pet at (set to high number to have it stay still on the right side)
        speed_multiplier = 1, -- you can make your pet move faster/slower. If slower the animation will have lower fps.
        default_pet = "cat", -- the pet to use for the PetNew command
        default_style = "dark_gray", -- the style of the pet to use for the PetNew command
        -- random = true, -- wether to use a random pet for the PetNew command, ovverides default_pet and default_style
        death_animation = true, -- animate the pet's death, set to false to feel less guilt -- currently no animations are available
        popup = { -- popup options, try changing these if you see a rectangle around the pets
          width = "100%", -- can be a string with percentage like "45%" or a number of columns like 45
          winblend = 100, -- winblend value - see :h 'winblend' - only used if avoid_statusline is false
          hl = { Normal = "Normal" }, -- hl is only set if avoid_statusline is true, you can put any hl group instead of "Normal"
          avoid_statusline = false, -- if winblend is 100 then the popup is invisible and covers the statusline, if that
          -- doesn't work for you then set this to true and the popup will use hl and will be spawned above the statusline (hopefully)
        },
      }
      vim.api.nvim_command "PetsNewCustom cat dark_gray Tauky"
      vim.api.nvim_command "PetsNewCustom cat black Shaguy"
    end,
  },
}

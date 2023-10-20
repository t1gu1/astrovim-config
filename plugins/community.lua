local prefix = "<leader><leader>"
local maps = { n = {} }
local icon = vim.g.icons_enabled and "󱡀 " or ""
maps.n[prefix] = { desc = icon .. "Harpoon" }
require("astronvim.utils").set_mappings(maps)

return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  { import = "astrocommunity.project/project-nvim" },
  { import = "astrocommunity.motion/harpoon" },
  { import = "astrocommunity.media/presence-nvim" },
  { import = "astrocommunity.project/nvim-spectre" },
  { import = "astrocommunity.editing-support/todo-comments-nvim" },
  { import = "astrocommunity.motion/nvim-surround" },
  { import = "astrocommunity.pack/godot" },
  { import = "astrocommunity.git/git-blame-nvim" },
  { import = "astrocommunity.editing-support/rainbow-delimiters-nvim" },
  { import = "astrocommunity.utility/noice-nvim" },
  { import = "astrocommunity.lsp/lsp-signature-nvim" },
  { import = "astrocommunity.file-explorer/oil-nvim" },
  { import = "astrocommunity.bars-and-lines/lualine-nvim" },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections = {
        lualine_c = {
          {
            "filename",
            path = 1,

            file_status = true, -- Displays file status (readonly status, modified status)
            newfile_status = false, -- Display new file status (new file means no write after created)

            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = " ●", -- Text to show when the file is modified.
              readonly = "[Read Only]", -- Text to show when the file is non-modifiable or readonly.
              unnamed = "[No Name]", -- Text to show for unnamed buffers.
              newfile = "[New]", -- Text to show for newly created file before first write
              directory = "",
            },

            filetype_names = {
              TelescopePrompt = "Telescope",
              dashboard = "Dashboard",
              packer = "Packer",
              fzf = "FZF",
              alpha = "Alpha",
            },
          },
        },

        lualine_y = {
          { "progress" },
          {
            "searchcount",
            maxcount = 999,
            timeout = 500,
          },
        },
      }
      return opts
    end,
  },

  {
    "oil.nvim",
    opts = {
      use_default_keymaps = false,
      keymaps = {
        ["<Esc>"] = "actions.close",
        ["q"] = "actions.close",
        ["<CR>"] = "actions.select",
        ["g"] = "actions.select",
        ["b"] = "actions.parent",
        ["?"] = "actions.show_help",
        ["<C-p>"] = "actions.preview",
        ["<C-r>"] = "actions.refresh",
        ["<C-t>"] = "actions.select_tab",

        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["<C-f>"] = "actions.change_sort",
        ["<C-e>"] = "actions.open_external",
        ["<C-.>"] = "actions.toggle_hidden",
      },
    },
    keys = {
      { "<leader>O", false },
      { "<leader>e", function() require("oil").open() end, desc = "Explorer in current file folder" },
      {
        "<leader>E",
        function() require("oil").open(require("project_nvim").get_project_root()) end,
        desc = "Explorer at project root",
      },
    },
  },

  -- Customise opts of some community / core plugins
  {
    "noice.nvim",
    opts = function(_, opts)
      opts.presets.bottom_search = false
      opts.lsp.signature = { enabled = false }
      return opts
    end,
  },
}

-- get highlights from highlight groups
local fg, bg = "#778da9", "NONE"
local bg_alt = "NONE"
local green = "NONE"
local red = "NONE" -- Edited color to fit with the theme

-- Simply comment the return to get default astroVim telescope theme
-- this table overrides highlights in all themes
return {
  TelescopeBorder = { fg = bg_alt, bg = bg },
  TelescopeNormal = { bg = bg },
  TelescopePreviewBorder = { fg = bg, bg = bg },
  TelescopePreviewNormal = { bg = bg },
  TelescopePreviewTitle = { fg = bg, bg = green },
  TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
  TelescopePromptNormal = { fg = fg, bg = bg_alt },
  TelescopePromptPrefix = { fg = red, bg = bg_alt },
  TelescopePromptTitle = { fg = bg, bg = red },
  TelescopeResultsBorder = { fg = bg, bg = bg },
  TelescopeResultsNormal = { bg = bg },
  TelescopeResultsTitle = { fg = bg, bg = bg },

  -- set the transparency for all of these highlight groups
  Normal = { bg = "NONE", ctermbg = "NONE" },
  NormalNC = { bg = "NONE", ctermbg = "NONE" },
  CursorColumn = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
  CursorLine = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
  CursorLineNr = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
  LineNr = {},
  SignColumn = {},
  StatusLine = {},
  NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
  NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
}

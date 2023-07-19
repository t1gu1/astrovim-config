local get_hlgroup = require("astronvim.utils").get_hlgroup
-- get highlights from highlight groups
local fg, bg = "#778da9", "#333550"
local bg_alt = get_hlgroup("Visual").bg
local green = get_hlgroup("String").fg
local red = "#bbd0ff" -- Edited color to fit with the theme

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
}

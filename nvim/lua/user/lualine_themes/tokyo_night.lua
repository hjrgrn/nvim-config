-- TODO:

local colors = {
  black        = '#15161E',
  white        = '#a9b1d6',
  red          = '#f7768e',
  orange       = '#ff9e64',
  brightorange = '#ffb86c',
  green        = '#9ece6a',
  blue         = '#7aa2f7',
  lightblue    = '#7dcfff',
  darkblue     = '#33467c',
  yellow       = '#e0af68',
  gray         = '#C0Caf5',
  darkgray     = '#44475a',
  purple       = '#bb9af7',
}
return {
  normal = {
    a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
    b = {bg = colors.black, fg = colors.blue},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  insert = {
    a = {bg = colors.orange, fg = colors.black, gui = 'bold'},
    b = {bg = colors.black, fg = colors.orange},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  visual = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.black, fg = colors.green},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  replace = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = {bg = colors.blue, fg = colors.darkgray},
    c = {bg = colors.black, fg = colors.white}
  },
  command = {
    a = {bg = colors.purple, fg = colors.black, gui = 'bold'},
    b = {bg = colors.black, fg = colors.purple},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.gray},
    c = {bg = colors.darkgray, fg = colors.gray}
  }
}
-- require('lualine').setup {options = {theme = gruvbox}}

local nordic = require "nordic"

nordic.setup {
  on_palette = function(palette) return palette end,
  bold_keywords = true,
  italic_comments = true,
  transparent_bg = false,
  bright_border = false,
  reduced_blue = true,
  swap_backgrounds = false,
  override = {},
  cursorline = {
    bold = true,
    bold_number = true,
    theme = 'dark',
    blend = 0.8,
  },
  telescope = {
    style = 'flat',
  },
  leap = {
    dim_backdrop = false,
  },
  ts_context = {
    dark_background = true,
  }
}

nordic.load()

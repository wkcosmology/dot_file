local colors = {
  rosewater = "#f5e0dc",
  flamingo = "#f2cdcd",
  pink = "#f5c2e7",
  mauve = "#cba6f7",
  red = "#f38ba8",
  maroon = "#eba0ac",
  peach = "#fab387",
  yellow = "#f9e2af",
  green = "#a6e3a1",
  teal = "#94e2d5",
  sky = "#89dceb",
  sapphire = "#74c7ec",
  blue = "#89b4fa",
  lavender = "#b4befe",

  text = "Orange",
  subtext1 = "Orange",
  subtext0 = "LightBlue",

  surface2 = "#585b70",
  surface1 = "#45475a",
  surface0 = "#313244",

  base = "#1e1e2e",
  crust = "#11111b",
}

return {
  normal = {
    a = { fg = colors.base, bg = colors.blue, gui = "bold" },
    b = { fg = colors.text, bg = colors.surface0 },
    c = { fg = colors.subtext1, bg = colors.base },
  },

  insert = {
    a = { fg = colors.base, bg = colors.green, gui = "bold" },
  },

  visual = {
    a = { fg = colors.base, bg = colors.mauve, gui = "bold" },
  },

  replace = {
    a = { fg = colors.base, bg = colors.red, gui = "bold" },
  },

  command = {
    a = { fg = colors.base, bg = colors.peach, gui = "bold" },
  },

  inactive = {
    a = { fg = colors.base, bg = colors.blue },
    b = { fg = colors.subtext0, bg = colors.surface0 },
    c = { fg = colors.subtext0, bg = colors.base },
    x = { fg = colors.subtext0, bg = colors.surface0 },
  },
}

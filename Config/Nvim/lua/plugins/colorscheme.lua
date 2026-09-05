return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      on_colors = function(colors)
        -- Shift the default blue-gray background toward violet, to match
        -- the Hyprland accent (KDE Sweet violet).
        colors.bg = "#26123c"
        colors.bg_dark = "#1c0d2e"
        colors.bg_float = "#1c0d2e"
        colors.bg_highlight = "#3d1a63"
        colors.bg_popup = "#1c0d2e"
        colors.bg_sidebar = "#1c0d2e"
        colors.bg_statusline = "#1c0d2e"
        colors.bg_visual = "#552a8c"
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}

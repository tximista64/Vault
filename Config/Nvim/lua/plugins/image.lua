return {
  -- Rendu des images inline dans le terminal via le protocole graphique de kitty
  {
    "3rd/image.nvim",
    build = false, -- pas de build luarocks : on passe par le CLI ImageMagick (magick)
    ft = { "markdown", "vimwiki", "norg" },
    opts = {
      backend = "kitty",
      processor = "magick_cli", -- évite la dépendance au rock 'magick' (absent de luarocks ici)
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          filetypes = { "markdown", "vimwiki" },
        },
      },
      max_width_window_percentage = 80,
      max_height_window_percentage = 60,
      window_overlap_clear_enabled = true, -- masque l'image quand une fenêtre la recouvre
      editor_only_render_when_focused = false,
      tmux_show_only_in_active_window = true,
    },
  },

  -- Évite que snacks.image rende AUSSI les images (sinon double affichage)
  {
    "folke/snacks.nvim",
    opts = {
      image = { enabled = false },
    },
  },
}

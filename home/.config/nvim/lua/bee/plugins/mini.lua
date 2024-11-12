return {
  {
    'echasnovski/mini.base16',
    version = false,
    config = function()
      require("mini.base16").setup({
        palette = {
          base00 = "#151515",
          base01 = "#1c1c1c",
          base02 = "#333333",
          base03 = "#404040",
          -- base00 = "#151820",
          -- base01 = "#191C25",
          -- base02 = "#2d3343",
          -- base03 = "#343e4f",
          base04 = "#C8C093",
          base05 = "#b1b5b1",
          base06 = "#E46876",
          base07 = "#6d607d",
          base08 = "#b04d4d",
          base09 = "#b35b79",
          base0A = "#b3745b",
          base0B = "#6f8256",
          base0C = "#7E9CD8",
          base0D = "#4e8ca2",
          base0E = "#a28aa9",
          base0F = "#658594",
        },
      })
    end
  },
  {
    'echasnovski/mini.icons',
    version = false,
    config = function()
      require("mini.icons").setup()
    end
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    config = function()
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = vim.g.have_nerd_font })
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end
    end
  }
}

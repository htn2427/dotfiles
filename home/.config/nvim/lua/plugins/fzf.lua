return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = false,
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>" },
    { "<leader>fs", "<cmd>FzfLua live_grep_native<cr>" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>" },
    { "<leader>fh", "<cmd>FzfLua helptags<cr>" },

    { "<leader>fd", "<cmd>FzfLua lsp_definitions<cr>" },
    { "<leader>fi", "<cmd>FzfLua lsp_implementations<cr>" },
    { "<leader>fr", "<cmd>FzfLua lsp_references<cr>" },
  },
  lazy = true,
  config = function()
    local fzflua = require("fzf-lua")
    local actions = require("fzf-lua.actions")
    local img_prev_bin = vim.fn.executable("ueberzug") == 1 and { "ueberzug" }
        or vim.fn.executable("chafa") == 1 and { "chafa" }
        or vim.fn.executable("viu") == 1 and { "viu", "-b" }
        or nil
    fzflua.setup({
      fzf_colors = {
        ["gutter"] = { "bg", "Normal" },
      },
      keymap = {
        builtin = {
          ["<c-d>"] = "preview-page-down",
          ["<c-u>"] = "preview-page-up",
        },
        fzf = {
          ["ctrl-e"] = "select-all+accept",
        },
      },
      fzf_opts = {
        ["--cycle"] = "",
      },
      previewers = {
        builtin = {
          title_fnamemodify = function(s)
            return s
          end,
          ueberzug_scaler = "cover",
          extensions = {
            ["gif"] = img_prev_bin,
            ["png"] = img_prev_bin,
            ["jpg"] = img_prev_bin,
            ["jpeg"] = img_prev_bin,
            ["svg"] = { "chafa" },
          },
        },
      },
      winopts = {
        border = "rounded",
        backdrop = 100,
        preview = {
          layout = "flex",
          flip_columns = 120,
          scrollbar = "float",
        },
      },
      files = {
        cwd_prompt = false,
        actions = {
          ["alt-i"] = { actions.toggle_ignore },
          ["alt-h"] = { actions.toggle_hidden },
        },
      },
      grep = {
        actions = {
          ["alt-i"] = { actions.toggle_ignore },
          ["alt-h"] = { actions.toggle_hidden },
        },
      },
      lsp = {
        code_actions = {
          winopts = {
            preview = {
              layout = "vertical",
            },
          },
        },
      },
    })
    fzflua.register_ui_select()
  end,
}

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        -- TODO:
      }
      wk.register(keymaps)
    end,
    opts = {
      key_labels = {
        ["<leader>"] = "SPC",
        ["<tab>"] = "TAB",
      },
    },
  },
}


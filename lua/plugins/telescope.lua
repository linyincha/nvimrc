local util = require("util")

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
      -- short
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/", util.telescope("live_grep"), desc = "Find in Files (Grep)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader><space>", util.telescope("files"), desc = "Find Files (root dir)" },
      -- git
      { "<leader>fgc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>fgs", "<cmd>Telescope git_status<CR>", desc = "status" },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>fF", util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>fr", util.tele_extn("frecency"), desc = "Recent" },
      { "<leader>fd", util.tele_extn("file_browser", { path = "%:p:h" }), desc = "File Browser" },
			{ "<leader>fD", util.tele_extn("file_browser"), desc = "File Browser" },
      { "<leader>fa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>fH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>fo", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>uc", util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
      {
        "<leader>fs",
        util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        util.telescope("lsp_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol (Workspace)",
      },
    },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    local extns = { "file_browser", "frecency" }
    for _, extn in ipairs(extns) do
      telescope.load_extension(extn)
    end
  end,
}


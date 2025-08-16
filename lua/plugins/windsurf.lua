
return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "AstroNvim/astrocore",
    "nvim-lua/plenary.nvim",
  },
  event = "InsertEnter",
  build = ":Codeium Auth",
  opts = {
    enable_chat = true,
    enable_tabnine = false,
    tools = {
      enable_ai_assistant = true,
    },
    virtual_text = {
      enabled = true,
      spacing = 4,
      prefix = " ➜ ",
      hl_mode = "combine",
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      accept_key = "<C-g>",
      debounce_ms = 200,
    },
  },

  config = function(_, opts)
    require("codeium").setup(opts)
    -- Remove any references to codeium.accept() or custom ai_accept functions.
    -- Bindings via opts.accept_key or via :map are enough!
    vim.keymap.set("i", "<C-g>", function()
      -- Use the plugin’s mapping, not a manual function call.
      return vim.fn["codeium#Accept"]() -- For codeium.vim; for .nvim, just use opts
    end, { expr = true, noremap = true, silent = true })
  end,
}


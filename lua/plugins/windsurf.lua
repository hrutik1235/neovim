return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",  -- Better event for triggering
  build = ":Copilot auth",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,  -- Enable automatic suggestions
      debounce = 75,
      keymap = {
        accept = "<M-l>",  -- Use Alt/Meta-l to accept
        accept_word = false,
        accept_line = false,
        next = "<M-j>",
        prev = "<M-k>",
        dismiss = "<M-h>",
      },
    },
    panel = { enabled = false },  -- Disable panel if using cmp
  },

  config = function(_, opts)
    require("copilot").setup(opts)

    -- Set up integration with cmp if you're using it
    if require("astrocore").is_available("cmp") then
      require("copilot_cmp").setup()
    end

    -- Alternative manual accept function
    vim.g.ai_accept = function()
      local suggestion = require("copilot.suggestion")
      if suggestion.is_visible() then
        suggestion.accept()
        return true
      end
      return false
    end
  end,
}


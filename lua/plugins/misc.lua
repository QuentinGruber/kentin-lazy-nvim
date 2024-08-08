return {
  {
    "quentingruber/timewasted.nvim",
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "quentingruber/timespent.nvim",
    keys = {
      { "<leader>ts", "<cmd>:ShowTimeSpent<cr>", mode = { "n" }, desc = "Show time spent" },
    },
    opts = {},
    -- dir = "~/Documents/timespent.nvim/",
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
    opts = function()
      local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
    end,
  },
}

return {
  {
    "quentingruber/timewasted.nvim",
  },
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "quentingruber/timespent.nvim",
    lazy = false,
    keys = {
      { "<leader>ts", "<cmd>:ShowTimeSpent<cr>", mode = { "n" }, desc = "Show time spent" },
    },
    opts = {},
    -- dir = "~/Documents/timespent.nvim/",
  },
  {
    "tamton-aquib/duck.nvim",
  },
  -- {
  --   "quentingruber/pomodoro.nvim",
  --   lazy = false,
  --   -- dir = "~/Documents/pomodoro.nvim/",
  --   keys = {
  --     { "<leader>pu", "<cmd>:PomodoroUI<cr>", mode = { "n" }, desc = "" },
  --     { "<leader>ps", "<cmd>:PomodoroStart<cr>", mode = { "n" }, desc = "" },
  --     { "<leader>pS", "<cmd>:PomodoroStop<cr>", mode = { "n" }, desc = "" },
  --   },
  --   opts = {
  --     start_at_launch = true,
  --     work_duration = 25,
  --     break_duration = 5,
  --     snooze_duration = 1, -- The additionnal work time you get when you delay a break
  --   },
  -- },
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

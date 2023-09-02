local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and not vim.g.vscode then
    opts.remap = nil
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- tmux
map("n", "<C-h>", "<cmd>:TmuxNavigateLeft<cr>", { desc = "TmuxNavigateLeft" })
map("n", "<C-j>", "<cmd>:TmuxNavigateDown<cr>", { desc = "TmuxNavigateDown" })
map("n", "<C-k>", "<cmd>:TmuxNavigateUp<cr>", { desc = "TmuxNavigateUp" })
map("n", "<C-l>", "<cmd>:TmuxNavigateRight<cr>", { desc = "TmuxNavigateRight" })

-- splits
map("n", "<leader>/", "<cmd>vsplit<cr>", { desc = "Comment" })
map("n", "|", "<cmd>vsplit<cr>", { desc = "Vsplit" })
map("n", "-", "<cmd>split<cr>", { desc = "Hsplit" })

map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = "Toggle comment line", remap = true })

map(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  { desc = "Toggle comment lines" }
)
-- Zen
map("n", "<leader>z", "<cmd>:ZenMode<cr>", { desc = "Toggle ZenMode" })

-- Terminals

-- Base terminal
map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
map("n", "<leader>tf", "<cmd>:ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
map("n", "<leader>th", "<cmd>:ToggleTerm size=10 direction=horizontal<cr>",
  { desc = "ToggleTerm horizontal split" })
map("n", "<leader>tv", "<cmd>:ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })


-- Node
local function createNodeTerm()
  require("toggleterm.terminal").Terminal:new({ cmd = "node", hidden = true }):toggle();
end
if vim.fn.executable "node" == 1 then
  map("n", "<leader>tn", function() createNodeTerm() end, { desc = "ToggleTerm node" })
end


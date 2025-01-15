local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and not vim.g.vscode then
    opts.remap = nil
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

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

-- Modify config
map("n", "<leader>²", "<cmd>:e $MYVIMRC <cr>", { desc = "Open nvim config" })

-- OCTO
-- pr
map("n", "<leader>opl", "<cmd>Octo pr list<cr>", { desc = "Display open pr for this repo" })
map("n", "<leader>opn", "<cmd>Octo pr create<cr>", { desc = "Create a new pr" })
map("n", "<leader>opb", "<cmd>Octo pr checkout<cr>", { desc = "Checkout a pr" })
map("n", "<leader>opd", "<cmd>Octo pr diff<cr>", { desc = "Show pr diff" })
map("n", "<leader>opm", "<cmd>Octo pr merge<cr>", { desc = "merge pr" })
map("n", "<leader>opw", "<cmd>Octo pr browser<cr>", { desc = "Open pr in browser" })
map("n", "<leader>opc", "<cmd>Octo pr checks<cr>", { desc = "Display checks for this Pr" })
-- review
map("n", "<leader>ors", "<cmd>Octo review start<cr>", { desc = "Start a review" })
map("n", "<leader>orS", "<cmd>Octo review submit<cr>", { desc = "Submit a review" })
map("n", "<leader>orr", "<cmd>Octo review resume<cr>", { desc = "Resume a review" })
map("n", "<leader>orR", "<cmd>Octo review discard<cr>", { desc = "Dismiss a review" })
-- comments
map("n", "<leader>ocn", "<cmd>Octo comment add<cr>", { desc = "Add a comment" })
map("n", "<leader>ocd", "<cmd>Octo comment delete<cr>", { desc = "Delete a comment" })
map("n", "<leader>ocl", "<cmd>Octo review comments<cr>", { desc = "List pending comments" })

-- issues
map("n", "<leader>oil", "<cmd>Octo issue list<cr>", { desc = "Display open issues for this repo" })
map("n", "<leader>oin", "<cmd>Octo issue create<cr>", { desc = "Create a new issue" })
map("n", "<leader>oiw", "<cmd>Octo issue browser<cr>", { desc = "Open issue in browser" })

-- TMUX
-- map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "TmuxNavigateLeft" })
-- map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "TmuxNavigateDown" })
-- map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "TmuxNavigateUp" })
-- map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "TmuxNavigateRight" })
-- Zen
map("n", "<leader>z", "<cmd>:ZenMode<cr>", { desc = "Toggle ZenMode" })

-- lsp
map("n", "<leader>r", "<cmd>:LspRestart<cr>", { desc = "Restart Lsp server" })

-- TimeSpent
-- map("n", "<leader>ts", "<cmd>:ShowTimeSpent<cr>", { desc = "Show time spent" })

local function duck()
  require("duck").hatch()
end
local function duck_cook()
  require("duck").cook_all()
end
-- DUCK
map("n", "<leader>dd", duck, { desc = "Duck" })
map("n", "<leader>dc", duck_cook, { desc = "Rip Duck" })

-- Terminals
-- Base terminal
map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
map("n", "<leader>tf", "<cmd>:ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
map("n", "<leader>th", "<cmd>:ToggleTerm size=10 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
map("n", "<leader>tv", "<cmd>:ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })

-- Node
local function createNodeTerm()
  require("toggleterm.terminal").Terminal:new({ cmd = "node", hidden = true }):toggle()
end
if vim.fn.executable("node") == 1 then
  map("n", "<leader>tn", function()
    createNodeTerm()
  end, { desc = "ToggleTerm node" })
end

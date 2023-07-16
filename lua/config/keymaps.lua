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

-- TODO: leader / not // but rn it's random if the key is set or not :(
map("n", "<leader>//", function()
  require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = "Toggle comment line" })

map(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  { desc = "Toggle comment lines" }
)

-- TODO: mutiple terminals
-- TODO: pass a defaukt command to toggle_term_cmd example "nu"
map("n", "<leader>tt", "<cmd>ToggleTerm nu<cr>", { desc = "Toggle terminal" })
-- if vim.fn.executable "node" == 1 then
--   map("n", "<leader>tn", "<cmd>:ToggleTerm node<cr>", { desc = "ToggleTerm node" })
-- end
-- local python = vim.fn.executable "python" == 1 and "python" or vim.fn.executable "python3" == 1 and "python3"
-- if python then map("t", "<leader>tp", "<cmd>:ToggleTerm python<cr>", { desc = "ToggleTerm python" }) end
map("n", "<leader>tf", "<cmd>:ToggleTerm direction=float nu<cr>", { desc = "ToggleTerm float" })
map("n", "<leader>th", "<cmd>:ToggleTerm size=10 direction=horizontal nu<cr>",
  { desc = "ToggleTerm horizontal split" })
map("n", "<leader>tv", "<cmd>:ToggleTerm size=80 direction=vertical nu<cr>", { desc = "ToggleTerm vertical split" })

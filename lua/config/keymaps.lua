-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

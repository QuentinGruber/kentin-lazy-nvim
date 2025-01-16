return {
  -- { "navarasu/onedark.nvim" },
  -- { "sainnhe/sonokai" },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "sonokai",
      colorscheme = "cyberdream",
      -- colorscheme = "onedark",
    },
  },
}

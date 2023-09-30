return {

  -- octo

  {
    "pwntester/octo.nvim",
    requires = { "nvim-lua/plenary.nvim","nvim-tree/nvim-web-devicons" },
    config = function()
      require "octo".setup()
    end
  }
  -- end of octo
}

return {
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",
    },
    opts = {
      ui = {
        icons = {
          package_installed = "😎",
          package_uninstalled = "😪",
          package_pending = "😀",
        },
      },
    },
  },
}

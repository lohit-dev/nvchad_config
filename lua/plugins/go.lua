return {
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function()
      require("gopher").setup {
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "gotests",
          impl = "impl",
          iferr = "iferr",
        },
      }
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}

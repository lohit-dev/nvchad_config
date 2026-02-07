return {
  {
    "nvchad/ui",
    dependencies = {
      "abeldekat/harpoonline",
      config = function()
        require("harpoonline").setup {
          on_update = function()
            vim.cmd.redrawstatus()
          end,
        }
      end,
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
      "<leader>a",
      "<leader>mm",
      "<leader>1",
      "<leader>2",
      "<leader>3",
      "<leader>4",
    },
    config = function() end,
  },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    dependencies = { "windwp/nvim-ts-autotag" }, 
    opts = {
      ensure_installed = {
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "rust",
        "go",
        "lua",
        "json",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true,
        use_languagetree = true,
        -- disable = { "vim", "vimdoc" },
      },
      indent = { enable = true },
      autopairs = { enable = true },
      autotag = { enable = true },
    },
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "java",
        "javascript",
        "typescript",
        "html",
        "css",
        "python",
        "make",
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
    })
  end,
}

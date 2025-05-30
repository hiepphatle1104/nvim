return {
  "ray-x/go.nvim",
  opts = {},
  config = function(_, opts)
    require("go").setup(opts)
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
}

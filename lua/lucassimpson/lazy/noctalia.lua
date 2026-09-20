return {
  "keremimo/noctalia.nvim",
  main = "noctalia",
  lazy = false,
  priority = 1000,
  opts = {
    palette_path = vim.fn.expand("~/.config/noctalia/colors.json"),
    transparent = false,
    auto_reload = true, -- Automatically reloads when Noctalia updates colors
  },
  config = function(_, opts)
    require("noctalia").setup(opts)
    vim.cmd.colorscheme("noctalia")
  end,
}

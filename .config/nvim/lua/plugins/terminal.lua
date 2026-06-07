---@type LazySpec
return {
  "AstroNvim/astrocore",
  opts = {
    mappings = {
      t = {
        ["<Esc><Esc>"] = { "<C-\\><C-n>", desc = "Exit terminal input mode" },
      },
    },
  },
}

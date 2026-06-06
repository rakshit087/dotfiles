---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        ["<Leader>ff"] = {
          function() require("snacks").picker.files { hidden = true } end,
          desc = "Find files",
        },
        ["<Leader>fG"] = {
          function() require("snacks").picker.lsp_workspace_symbols() end,
          desc = "Search workspace symbols",
        },
      },
    },
  },
}

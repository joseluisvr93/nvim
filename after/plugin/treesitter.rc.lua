local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "lua",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "html",
    "scss",
    "css",
    "java",
    "python",
    "r",
    "cpp"
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filename_to_parsername = { "javascript", "typescript.tsx" }

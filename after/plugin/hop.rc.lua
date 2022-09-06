local status, hop = pcall(require, 'hop')
if (not status) then return end

hop.setup({
  keys = 'etovxqpdygfblzhckisuran'
})

local keymap = vim.keymap

keymap.set('n', 'f', ':HopChar1<cr>')

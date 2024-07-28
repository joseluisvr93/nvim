local status, autopairs = pcall(require, 'nvim-autopairs')
if (not status) then return end

local keymap = vim.keymap

keymap.set('n', '<space>ta', '<cmd>ToggleAlternate<cr>')
autopairs.setup({
  disable_filetype = { 'TelescopePrompt', 'vim' }
})

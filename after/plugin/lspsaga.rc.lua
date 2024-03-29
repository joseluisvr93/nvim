local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gj', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)


vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('n', 'gk', '<Cmdk>Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga rename<cr>', opts)

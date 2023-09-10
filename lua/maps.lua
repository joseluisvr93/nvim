local keymap = vim.keymap

-- Shortcurt to edit config file: (e)dit (c)onfiguration
keymap.set('n', '<space>ec', ':e $MYVIMRC<cr>')

-- Shortcurt to source (reload) this configuration file after editing it: (s)ource (c)onfiguration
keymap.set('n', '<space>sc', ':source $MYVIMRC<cr>')
keymap.set('n', '<space>sa', ':source %<cr>')

-- Use ;; for escape
keymap.set('i', ';;', '<ESC>')
keymap.set('v', ';;', '<ESC>')

-- Go to the next buffer
keymap.set('n', '<space>bn', ':bn<cr>')
-- Go to the next buffer
keymap.set('n', '<space>bp', ':bp<cr>')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Split window
keymap.set('n', 'bh', ':split<return><C-w>l', { silent = true })
keymap.set('n', 'bv', ':vsplit<return><C-w>j', { silent = true })

-- Move window
keymap.set('n', '<space>n', '<C-w>w')
keymap.set('', '<space>j', '<C-w>j')
keymap.set('', '<space>k', '<C-w>k')
keymap.set('', '<space>h', '<C-w>h')
keymap.set('', '<space>l', '<C-w>l')

-- Resize window
keymap.set('n', '<C-left>', '<C-w><')
keymap.set('n', '<C-right>', '<C-w>>')
keymap.set('n', '<C-up>', '<C-w>+')
keymap.set('n', '<C-down>', '<C-w>-')
keymap.set('n', '<space>>', '10<C-w><')
keymap.set('n', '<space><', '10<C-w>>')

keymap.set('i', 'jk', '<ESC>')
keymap.set('n', '<space>w', ':w!<return>')
keymap.set('n', '<space>q', ':q<return>')

-- Improve keybooard support for navigation (especially terminal)
keymap.set('t', '<esc>', '<C-\\><C-n>')
keymap.set('t', 'jk', '<C-\\><C-n>')
keymap.set('t', ';;', '<C-\\><C-n>')
keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h')
keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j')
keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k')
keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l')
keymap.set('n', '<A-h>', '<C-w>h')
keymap.set('n', '<A-j>', '<C-w>j')
keymap.set('n', '<A-k>', '<C-w>k')
keymap.set('n', '<A-l>', '<C-w>l')
-- Start terminal in instert mode
vim.opt.splitright = true
vim.opt.splitbelow = true
keymap.set('t', '<C-x>', '<C-\\><C-n><C-w>q')
keymap.set('n', '<C-t>', ':terminal<cr>')
keymap.set('n', 'th', ':vnew<cr>:terminal<cr>')
keymap.set('n', 'tv', ':new:terminal<cr>')
vim.api.nvim_command [[au BufEnter * if &buftype == 'terminal' | :startinsert | endif]]

-- Tabs
keymap.set('n', 'tt', ':tabnew<cr>')
keymap.set('n', 'te', ':tabedit ')
keymap.set('n', '<S-tab>', ':tabprev<cr>')
keymap.set('n', '<tab>', ':tabnext<cr>')

-- Faster scrollin
keymap.set('n', '<C-j>', '10<C-e>')
keymap.set('n', '<C-k>', '10<C-y>')

-- Tab
keymap.set('x', '<tab>', '>gv')
keymap.set('x', '<S-tab>', '<gv')

-- Salto de linea
keymap.set('n', '<space>o', 'o<esc>0"_D')
keymap.set('n', '<space>O', 'O<esc>0"_D')

keymap.set('n', '<A-v>', '<C-v>')

-- correr python
vim.api.nvim_command [[au filetype python nnoremap <f9> :20 split term://python %<cr>]]
vim.api.nvim_command [[au filetype cpp nnoremap <f5> :w <bar> !g++ -std=c++17 %<cr> :vnew <bar> :te "a.exe" <cr><cr>]]
vim.api.nvim_command [[au filetype cpp nnoremap <f6> :vnew <bar> :te "a.exe" <cr>]]


keymap.set('n', 'H', '^')
keymap.set('n', 'L', '$')

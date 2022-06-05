let mapleader=";"

"Shortcurt to edit this config file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<cr>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>et :source $MYVIMRC<cr>

" use ;; for escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
inoremap ;; <Esc>

" go to next buffer
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <C-l> :bn<CR>
" go to previous buffer
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <C-h> :bp<CR>
" close buffer
nnoremap <silent> <leader>bd :bd<CR>
" kill buffer
nnoremap <silent> <leader>bk :bd!<CR>
" list buffers
nnoremap <silent> <leader>bl :ls<CR>
" list and select buffer
nnoremap <silent> <leader>bg :ls<CR>:buffer<Space>

" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

" redraw screan and clear search highlighted items
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Move window
map <Leader>h <C-w>h
map <Leader>k <C-w>k
map <Leader>j <C-w>j
map <Leader>l <C-w>l

" improved keyboard support for navigation (especially terminal)
" https://neovim.io/doc/user/nvim_terminal_emulator.html
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Start terminal in insert mode
:set splitright
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <silent> <leader>tt :terminal<CR>
nnoremap <silent> <leader>tv :vnew<CR>:terminal<CR>
nnoremap <silent> <leader>th :new<CR>:terminal<CR>
tnoremap <C-x> <C-\><C-n><C-w>q
nnoremap <C-t> :vsp<CR>:term<CR>i 

" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''

nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Tabs

" Open current directory
nmap <Leader>c <C-v>
nmap tt :tabnew<CR>
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
nmap <Leader>s :split<Return><C-w>w
nmap <Leader>v :vsplit<Return><C-w>w
" Resize window
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" faster scrolling
nnoremap <C-j> 10<C-e>
nnoremap <C-k> 10<C-y>
nmap <Leader>f <Plug>(easymotion-s2)

nnoremap <Space>w :w<CR>
nnoremap <Space>q :q<CR>

inoremap jk <ESC>

nnoremap <f9> :sp term://python %<cr><c-w><c-r>:resize 20<cr>a
augroup compileandrun
    autocmd!
    autocmd filetype python nnoremap <f9>:sp term://python %<cr><c-w><c-r>:resize 20<cr>a
    autocmd filetype cpp nnoremap <f5> :w <bar> !g++ -std=c++17 % <cr> :vnew <bar> :te "a.exe" <cr><cr>
    autocmd filetype cpp nnoremap <f6> :vnew <bar> :te "a.exe" <cr>
augroup END

xnoremap <Tab> >gv
xnoremap <S-Tab> <gv
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

vmap <Space>+ <Plug>NERDCommenterToggle
nmap <Space>+ <Plug>NERDCommenterToggle

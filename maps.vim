" Description: Keymaps
let mapleader=" "

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
nmap <Leader>v <C-v>
nmap tt :tabnew<CR>
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
nmap <Leader>s :split<Return><C-w>w
nmap <Leader>v :vsplit<Return><C-w>w
" Move window
"nmap <Space> <C-w>w
map <Leader>h <C-w>h
map <Leader>k <C-w>k
map <Leader>j <C-w>j
map <Leader>l <C-w>l
" Resize window
"nmap <C-w><up> <C-w>+
"nmap <C-w><down> <C-w>-
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" faster scrolling
nnoremap <C-j> 10<C-e>
nnoremap <C-k> 10<C-y>
nmap <Leader>f <Plug>(easymotion-s2)

nnoremap <Space>w :w<CR>
nnoremap <Space>q :q<CR>

inoremap jk <ESC>

nnoremap <f9> :sp term://python3 %<cr><c-w><c-r>:resize 20<cr>a
:set splitright
nnoremap <C-t> :vsp<CR>:term<CR>i 
tnoremap <Esc> <C-\><C-n>

xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

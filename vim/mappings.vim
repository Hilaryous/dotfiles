" Clear search highlighting
map <Leader><space> :nohl<cr>

" Hide the quickfix window
noremap <silent><leader>\ :nohlsearch<CR>

" Switch between the last two files
nnoremap <Leader>O <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" vim tab navigation
nnoremap th :tabfirst<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<CR>

" Coc commands
nnoremap <silent>gl :CocList files<CR>
nnoremap gz :CocSearch<space>
nmap <silent>gy :CocCommand explorer<CR>
" Keep around in case coc-explorer borks
" nnoremap <silent>gy :NERDTreeToggle<CR>

" Pretty print json
map <Leader>j :%!python -m json.tool<cr>

" Leader
let mapleader = " "
nmap \ <space>
nmap , <space>

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup      " no backup files
set nowritebackup " no backup file while editing
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50    " history of commands
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Better search behavior
set hlsearch      " highlight all search matches
set incsearch     " do incremental searching
set ignorecase    " case-insensitive search
set smartcase     " trigger case-sensitive search with uppercase query

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Set spellcheck for md files

" Auto Commands
" --------------------------------------
func! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

if has("autocmd")
  augroup FTOptions
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.ts set syntax=javascript
    autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
    autocmd BufRead,BufNewFile *.tsx set syntax=javascript.jsx
    autocmd BufRead,BufNewFile .env.* set filetype=sh
    autocmd BufRead,BufNewFile COMMIT_EDITMSG setlocal spell
    autocmd FileType markdown,text,txt setlocal textwidth=80 linebreak nolist wrap spell
    autocmd FileType qf setlocal wrap
    autocmd QuickFixCmdPost *grep* botright copen
    autocmd QuitPre * if empty(&buftype) | lclose | endif
    " Abbreviations
    autocmd FileType javascript,javascript.jsx,typescript,typescript.tsx iabbrev <buffer> bgc backgroundColor: '',<Left><Left><C-R>=Eatchar('\s')<CR>
    autocmd FileType javascript,javascript.jsx,typescript,typescript.tsx iabbrev <buffer> sdb outline: '1px dotted blue',<C-R>=Eatchar('\s')<CR>
    autocmd FileType javascript,javascript.jsx,typescript,typescript.tsx iabbrev <buffer> cdl console.log()<Left><C-R>=Eatchar('\s')<CR>
  augroup END
endif

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
    nnoremap <leader><bs> :Ag '<c-r><c-w>' <cr>
  endif
endif

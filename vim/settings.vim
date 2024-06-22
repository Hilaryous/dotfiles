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
    autocmd BufRead,BufNewFile COMMIT_EDITMSG setlocal spell
    autocmd FileType markdown,text,txt setlocal textwidth=80 linebreak nolist wrap spell
    autocmd FileType qf setlocal wrap
    " Abbreviations
    "" Put an outline around things for debugiing CSS
    autocmd FileType javascript,javascript.jsx,typescript,typescript.tsx iabbrev <buffer> sdb outline: '1px dotted blue',<C-R>=Eatchar('\s')<CR>
    "" Console.log shortcut
    autocmd FileType javascript,javascript.jsx,typescript,typescript.tsx iabbrev <buffer> cdl console.log()<Left><C-R>=Eatchar('\s')<CR>
  augroup END
endif

let g:go_def_mapping_enabled = 0

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

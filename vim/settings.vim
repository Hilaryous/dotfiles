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
autocmd BufRead,BufNewFile *.md setlocal spell

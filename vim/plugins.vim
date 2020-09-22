" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

  "EDITOR

  Plug 'christoomey/vim-tmux-navigator'              " map tmux navigation to vim
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }  " navigation/search/other assorted magics
  Plug 'tpope/vim-eunuch'                            " remove/move/ other unix commands in vim
  Plug 'tpope/vim-fugitive'                          " vim plugin for git
  Plug 'tpope/vim-abolish'                           " searching/finding word variants
  Plug 'tpope/vim-commentary'                        " comment things out easily
  Plug 'tpope/vim-repeat'                            " . command for plugins
  Plug 'tpope/vim-surround'                          " surround words/lines/etc. with stuff
  Plug 'vim-airline/vim-airline'                     " vim status/tabline
  Plug 'arcticicestudio/nord-vim'                    " vim theme
  Plug 'vim-airline/vim-airline-themes'              " theme for vim status/tabline
  let g:coc_global_extensions = ['coc-css', 'coc-eslint', 'coc-explorer', 'coc-html', 'coc-json', 'coc-lists', 'coc-python', 'coc-tsserver', 'coc-yaml']
  " Keeping around in case coc-explorer breaks
  " Plug 'scrooloose/nerdtree'

  "FILETYPES

  Plug 'jparise/vim-graphql'                         " make graphql look nice
  Plug 'leafgarland/typescript-vim'                  " make typescript look nice
  Plug 'mattn/emmet-vim'                             " html helper
  Plug 'maxmellon/vim-jsx-pretty'                    " make jsx look nice
  Plug 'othree/html5.vim'                            " make html5 look nice
  Plug 'pangloss/vim-javascript'                     " make javascript look nice

call plug#end()

" Set vim theme
colorscheme nord

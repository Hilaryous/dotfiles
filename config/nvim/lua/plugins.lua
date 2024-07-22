local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
   -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  -- Editor plugins
  use 'christoomey/vim-tmux-navigator'            -- Navigate between vim and tmux
  use {
    'neoclide/coc.nvim',
     branch = 'release',
     config = function()
      local extensions = {'coc-css', 'coc-eslint', 'coc-explorer', 'coc-html', 'coc-json', 'coc-lists', 'coc-python', 'coc-tsserver', 'coc-yaml', 'coc-prettier', 'coc-lua'}
      vim.fn['coc#rpc#request']('installExtensions', extensions)
     end
  }
  use 'tpope/vim-abolish'                         -- Advanced abbreviation and substitution
  use 'tpope/vim-commentary'                      -- Comment out lines easily
  use 'tpope/vim-eunuch'                          -- Unix commands inside vim
  use 'tpope/vim-fugitive'                        -- Git commands
  use 'tpope/vim-repeat'                          -- Repeat last plugin map
  use 'tpope/vim-surround'                        -- Manage pairs of surroundings
  use 'vim-airline/vim-airline'                   -- Lean status line
  use 'vim-airline/vim-airline-themes'            -- Themes for vim-airline


 -- Filetype plugins
  use 'jparise/vim-graphql'                       -- GraphQL syntax highlighting
  use 'leafgarland/typescript-vim'                -- TypeScript syntax
  use 'mattn/emmet-vim'                           -- Emmet support
  use 'maxmellon/vim-jsx-pretty'                  -- JSX formatting
  use 'othree/html5.vim'                          -- HTML5 syntax
  use 'pangloss/vim-javascript'                   -- JavaScript syntax
  use 'digitaltoad/vim-pug'                       -- Pug syntax

  -- Productivity
  use 'wakatime/vim-wakatime'                     -- Track time spent in Vim

  -- Debugging
  use 'mfussenegger/nvim-dap'                     -- Debugger
  use { 'nvim-telescope/telescope-dap.nvim' }     -- Telescope integration for DAP

  -- Theme
  use {
    'shaunsingh/nord.nvim',
    config = function()
      vim.cmd('colorscheme nord')
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end

end)

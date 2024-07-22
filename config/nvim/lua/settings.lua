-- Leader
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '\\', '<Space>', { noremap = true })
vim.api.nvim_set_keymap('n', ',', '<Space>', { noremap = true })

vim.o.backspace = '2' -- Backspace deletes like most programs in insert mode
vim.o.backup = false -- No backup files
vim.o.writebackup = false -- No backup file while editing
vim.o.swapfile = false -- http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
vim.o.history = 50 -- History of commands
vim.o.ruler = true -- Show the cursor position all the time
vim.o.showcmd = true -- Display incomplete commands
vim.o.laststatus = 2 -- Always display the status line
vim.o.autowrite = true -- Automatically :write before running commands

-- Better search behavior
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Softtabs, 2 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.expandtab = true

-- Display extra whitespace
vim.o.list = true
vim.o.listchars = 'tab:»·,trail:·,nbsp:·'

vim.o.joinspaces = false -- Use one space, not two, after punctuation

-- Make it obvious where 100 characters is
vim.o.textwidth = 100
vim.o.colorcolumn = '+1'

-- Numbers
vim.o.number = true
vim.o.numberwidth = 5

-- Open new split panes to right and bottom
vim.o.splitbelow = true
vim.o.splitright = true

-- Autocomplete with dictionary words when spell check is on
vim.o.complete = vim.o.complete .. ',kspell'

-- Auto Commands
if vim.api.nvim_has_autocmd ~= nil then
    -- Clear existing augroup named FTOptions if it exists
    vim.api.nvim_command('augroup FTOptions | autocmd! | augroup END')

    -- Autocommand for COMMIT_EDITMSG buffers
    vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
        pattern = "COMMIT_EDITMSG",
        command = "setlocal spell"
    })

    -- Autocommand for markdown, text, and txt filetypes
    vim.api.nvim_create_autocmd({"FileType"}, {
        pattern = {"markdown", "text", "txt"},
        command = "setlocal textwidth=80 | setlocal linebreak | setlocal nolist | setlocal wrap | setlocal spell"
    })

    -- Autocommand for quickfix windows
    vim.api.nvim_create_autocmd({"FileType"}, {
        pattern = "qf",
        command = "setlocal wrap"
    })

    -- Abbreviations for JavaScript and TypeScript files
    vim.api.nvim_create_autocmd({"FileType"}, {
        pattern = {"javascript", "javascript.jsx", "typescript", "typescript.tsx"},
        callback = function()
            vim.api.nvim_command("iabbrev <buffer> sdb outline: '1px dotted blue',<C-R>=Eatchar('\\s')<CR>")
            vim.api.nvim_command("iabbrev <buffer> cdl console.log()<Left><C-R>=Eatchar('\\s')<CR>")
        end
    })
end


-- Disable default Go to definition mapping
vim.g.go_def_mapping_enabled = 0

-- Mapping for showing documentation
vim.api.nvim_set_keymap('n', 'K', ':call ShowDocumentation()<CR>', { silent = true })

function ShowDocumentation()
  if vim.fn['coc#rpc#ready']() and vim.fn['coc#rpc#has_provider']('hover') then
    vim.fn['coc#rpc#async']('doHover')
  else
    vim.api.nvim_feedkeys('K', 'n', true)
  end
end


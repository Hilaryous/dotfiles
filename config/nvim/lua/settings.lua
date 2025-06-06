-- Leader
vim.g.mapleader = " "
vim.keymap.set('n', '\\', '<Space>', { noremap = true })
vim.keymap.set('n', ',', '<Space>', { noremap = true })

vim.o.backspace = '2' -- Backspace deletes like most programs in insert mode
vim.o.backup = false -- No backup files
vim.o.writebackup = false -- No backup file while editing
vim.o.swapfile = false -- http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
vim.o.history = 50 -- History of commands
vim.o.ruler = true -- Show the cursor position all the time
vim.o.showcmd = true -- Display incomplete commands
vim.o.laststatus = 2 -- Always display the status line
vim.o.autowrite = true -- Automatically :write before running commands
vim.o.autoread = true -- Automatically update when changes are made outside of vim

-- More robust autoread settings
vim.api.nvim_create_autocmd({ "FocusGained", "BufReadPost" }, {
  callback = function()
    vim.cmd("checktime")
  end,
})

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

-- Ensure CoC completion confirm works
vim.api.nvim_set_keymap('i', '<C-y>', 'pumvisible() ? coc#_select_confirm() : "<C-y>"', { expr = true, noremap = true, silent = true })

-- Numbers
vim.o.number = true
vim.o.numberwidth = 5

-- Open new split panes to right and bottom
vim.o.splitbelow = true
vim.o.splitright = true

-- Autocomplete with dictionary words when spell check is on
vim.o.complete = vim.o.complete .. ',kspell'

-- Makes wildmenu nice
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'
vim.o.cmdheight = 1
vim.o.wildignore = vim.o.wildignore .. '*.DS_Store'

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

end

-- Mapping for showing documentation

function ShowDocumentation()
   if vim.fn['coc#rpc#ready']() == 1 then
    local has_hover = vim.fn.CocAction('hasProvider', 'hover')
    if has_hover then
      vim.fn.CocActionAsync('doHover')
      return
    end
  end

  vim.api.nvim_feedkeys('K', 'n', true)
end

vim.keymap.set('n', 'K', function()
  ShowDocumentation()
end, { silent = true })

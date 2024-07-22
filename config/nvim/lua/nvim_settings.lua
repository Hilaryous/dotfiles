-- Makes wildmenu nice
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'
vim.o.cmdheight = 1
vim.o.wildignore = vim.o.wildignore .. '*.DS_Store'

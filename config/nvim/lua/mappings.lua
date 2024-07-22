-- Clear search highlighting
vim.keymap.set('n', '<Leader><space>', ':nohl<CR>', { noremap = true, silent = true })

-- Clear search highlighting (alternative mapping)
vim.keymap.set('n', '<Leader>\\', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Switch between the last two files
vim.keymap.set('n', '<Leader>O', '<C-^>', { noremap = true })

-- Get off my lawn
vim.keymap.set('n', '<Left>', ':echoe "Use h"<CR>', { noremap = true })
vim.keymap.set('n', '<Right>', ':echoe "Use l"<CR>', { noremap = true })
vim.keymap.set('n', '<Up>', ':echoe "Use k"<CR>', { noremap = true })
vim.keymap.set('n', '<Down>', ':echoe "Use j"<CR>', { noremap = true })

-- Quicker window movement
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Vim tab navigation
vim.keymap.set('n', 'th', ':tabfirst<CR>', { noremap = true })
vim.keymap.set('n', 'tj', ':tabprev<CR>', { noremap = true })
vim.keymap.set('n', 'tk', ':tabnext<CR>', { noremap = true })
vim.keymap.set('n', 'tl', ':tablast<CR>', { noremap = true })
vim.keymap.set('n', 'tc', ':tabclose<CR>', { noremap = true })
vim.keymap.set('n', 'tn', ':tabnew<CR>', { noremap = true })

-- Coc commands
vim.keymap.set('n', '<Leader>gl', ':CocList files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '\\', ':CocSearch<SPACE>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader><bs>', ':CocSearch <C-r><C-w> <CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gy', ':CocCommand explorer<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })

-- Pretty print json
vim.keymap.set('n', '<Leader>j', ':!python -m json.tool<CR>', { noremap = true })

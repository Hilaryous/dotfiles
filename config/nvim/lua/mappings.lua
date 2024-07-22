-- Clear search highlighting
vim.api.nvim_set_keymap('n', '<Leader><space>', ':nohl<CR>', { noremap = true, silent = true })

-- Clear search highlighting (alternative mapping)
vim.api.nvim_set_keymap('n', '<Leader>\\', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Switch between the last two files
vim.api.nvim_set_keymap('n', '<Leader>O', '<C-^>', { noremap = true })

-- Get off my lawn
vim.api.nvim_set_keymap('n', '<Left>', ':echoe "Use h"<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', ':echoe "Use l"<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', ':echoe "Use k"<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', ':echoe "Use j"<CR>', { noremap = true })

-- Quicker window movement
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- Vim tab navigation
vim.api.nvim_set_keymap('n', 'th', ':tabfirst<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tj', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tk', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tl', ':tablast<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tc', ':tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true })

-- Coc commands
vim.api.nvim_set_keymap('n', '<Leader>gl', ':CocList files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\\', ':CocSearch<SPACE>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><bs>', ':CocSearch <C-r><C-w> <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gy', ':CocCommand explorer<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = true, silent = true })

-- Pretty print json
vim.api.nvim_set_keymap('n', '<Leader>j', ':!python -m json.tool<CR>', { noremap = true })

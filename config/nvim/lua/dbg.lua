-- require('telescope').load_extension('dap')

vim.keymap.set('n', '<Leader>dct', '<cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<Leader>dsv', '<cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>dsi', '<cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>dso', '<cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<Leader>dhv',
          '<cmd>lua require"dap.ui.variables".visual_hover()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>duf',
          "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>dsbr',
          '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>dsbm',
          '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>dro', '<cmd>lua require"dap".repl.open()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>', { noremap = true, silent = true })


-- telescope-dap
-- vim.keymap.set('n', '<leader>dcc',
--           '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
-- vim.keymap.set('n', '<leader>dco',
--           '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
-- vim.keymap.set('n', '<leader>dlb',
--           '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
-- vim.keymap.set('n', '<leader>dv',
--           '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
-- vim.keymap.set('n', '<leader>df',
--           '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')

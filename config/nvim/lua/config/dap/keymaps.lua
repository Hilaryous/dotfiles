local M = {}

function M.setup(js_based_server_languages, js_based_browser_languages)
  vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
  vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
  vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
  vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
  vim.keymap.set('n', 'tb', function() require('dap').toggle_breakpoint() end)
  vim.keymap.set('n', 'TB', function() require('dap').set_breakpoint() end)
  vim.keymap.set('n', 'lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
  vim.keymap.set(
    'n',
    'da',
    function()
      if vim.fn.filereadable(".vscode/launch.json") then
        local dap_vscode = require("dap.ext.vscode")
        dap_vscode.load_launchjs(nil, {
          ["pwa-node"] = js_based_server_languages,
          ["node"] = js_based_server_languages,
          ["chrome"] = js_based_browser_languages,
          ["pwa-chrome"] = js_based_browser_languages,
        })
      end
      require("dap").continue()
    end
  )
end

return M


local M = {}

function M.setup(js_based_server_languages, js_based_browser_languages)
  local dap = require("dap")

  for _, language in ipairs(js_based_server_languages) do
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        address = 'localhost',
        port = 9229,
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
      },
    }
  end

  for _, language in ipairs(js_based_browser_languages) do
    dap.configurations[language] = {
      {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch & Debug Chrome",
        url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({
                prompt = "Enter URL: ",
                default = "http://localhost:3000",
              }, function(url)
                if url == nil or url == "" then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
        webRoot = "${workspaceFolder}",
        skipFiles = { "<node_internals>/**/*.js" },
        protocol = "inspector",
        sourceMaps = true,
        userDataDir = false,
      },
    }
  end

end

return M

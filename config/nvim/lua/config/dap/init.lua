local M = {}

local js_based_server_languages = {
  "typescript",
  "javascript",
}

local js_based_browser_languages = {
  "typescriptreact",
  "javascriptreact",
}

function M.setup()
  require("config.dap.javascript").setup(js_based_server_languages, js_based_browser_languages)
  require("config.dap.keymaps").setup(js_based_server_languages, js_based_browser_languages)
end

return M

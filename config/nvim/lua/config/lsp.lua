local M = {}

function M.setup()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = { "ts_ls", "html", "cssls", "jsonls", "lua_ls", "eslint" },
  })

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  vim.lsp.config('*', { capabilities = capabilities })

  vim.lsp.config('eslint', {
    on_attach = function(_, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  })

  vim.lsp.enable({ 'ts_ls', 'html', 'cssls', 'jsonls', 'lua_ls', 'eslint' })

  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { silent = true })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { silent = true })
end

return M

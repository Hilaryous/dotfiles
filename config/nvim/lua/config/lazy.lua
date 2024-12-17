-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  -- Manage itself
  { "folke/lazy.nvim", event = "VimEnter" },

  -- Editor plugins
  { "christoomey/vim-tmux-navigator" },  -- Tmux navigation
  {
    "neoclide/coc.nvim",
    branch = "release",
    build = function()
      local extensions = {'coc-css', 'coc-eslint', 'coc-explorer', 'coc-html', 'coc-json',
      'coc-lists', 'coc-python', 'coc-tsserver', 'coc-yaml', 'coc-prettier', 'coc-lua',
      '@yaegassy/coc-pug', 'coc-xml'}
      vim.fn['coc#rpc#request']('installExtensions', extensions)
    end,
  },
  { "tpope/vim-abolish" },
  { "tpope/vim-commentary" },
  { "tpope/vim-eunuch" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "vim-airline/vim-airline" },
  { "vim-airline/vim-airline-themes" },

  -- Filetype plugins
  { "jparise/vim-graphql" },
  { "leafgarland/typescript-vim" },
  { "mattn/emmet-vim" },
  { "maxmellon/vim-jsx-pretty" },
  { "othree/html5.vim" },
  { "pangloss/vim-javascript" },
  { "digitaltoad/vim-pug" },
  { "elzr/vim-json" },

  -- Productivity
  { "wakatime/vim-wakatime" },

 -- Debugging
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("config.dap").setup()
    end,
    dependencies = {
      {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
          require("dap-vscode-js").setup({
            debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
            adapters = {
              "chrome",
              "pwa-node",
              "pwa-chrome",
              "pwa-msedge",
              "pwa-extensionHost",
              "node-terminal"
            },
          })
        end,
      },
      {
        "microsoft/vscode-js-debug",
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
      },
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          local dap, dapui = require("dap"), require("dapui")
          dap.listeners.before.attach.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.launch.dapui_config = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
          end
          dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
          end
        end,
        dependencies = {
          "nvim-neotest/nvim-nio"
        }
      },
    },
  },
  {
  },

  -- Theme
  {
    "shaunsingh/nord.nvim",
    config = function()
      vim.cmd("colorscheme nord")
    end
  },
})

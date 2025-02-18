-- Set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "vscode-neovim/vscode-multi-cursor.nvim",
    config = function()
      require("vscode-multi-cursor").setup()
    end
  }
})

-- Basic settings
vim.g.mapleader = ' ' 
vim.opt.clipboard = 'unnamedplus' 

-- Search settings
vim.opt.ignorecase = true    
vim.opt.smartcase = true 

-- File operations
vim.keymap.set('n', '<leader>s', ':w<CR>', { silent = true })
vim.keymap.set('n', '<leader>q', ':wq<CR>', { silent = true })

-- Line navigation for wrapped lines
vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })

-- Multi-cursor functionality
vim.keymap.set({ "n", "x", "i" }, "<C-t>", function()
  require("vscode-multi-cursor").addSelectionToNextFindMatch()
end)


-- VSCode specific keymaps
-- File explorer
vim.keymap.set('n', '<leader>e', '<Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>', { silent = true })
vim.keymap.set('n', '<leader>f', '<Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>', { silent = true })

-- Editor management
vim.keymap.set('n', '<leader>w', '<Cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', '<Cmd>call VSCodeNotify("workbench.action.navigateLeft")<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', '<Cmd>call VSCodeNotify("workbench.action.navigateRight")<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', '<Cmd>call VSCodeNotify("workbench.action.navigateUp")<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', '<Cmd>call VSCodeNotify("workbench.action.navigateDown")<CR>', { silent = true })

-- Search and replace
vim.keymap.set('n', '<leader>h', '<Cmd>call VSCodeNotify("workbench.action.findInFiles")<CR>', { silent = true })
vim.keymap.set('n', '<leader>r', '<Cmd>call VSCodeNotify("editor.action.startFindReplaceAction")<CR>', { silent = true })

-- Code actions
vim.keymap.set('n', '<leader>ca', '<Cmd>call VSCodeNotify("editor.action.quickFix")<CR>', { silent = true })
vim.keymap.set('n', '<leader>cf', '<Cmd>call VSCodeNotify("editor.action.formatDocument")<CR>', { silent = true })
vim.keymap.set('n', '<leader>cr', '<Cmd>call VSCodeNotify("editor.action.rename")<CR>', { silent = true })

-- Peek actions
vim.keymap.set('n', 'gd', '<Cmd>call VSCodeNotify("editor.action.peekDefinition")<CR>', { silent = true })
vim.keymap.set('n', 'gr', '<Cmd>call VSCodeNotify("editor.action.goToReferences")<CR>', { silent = true })

-- Terminal
vim.keymap.set('n', '<leader>t', '<Cmd>call VSCodeNotify("workbench.action.terminal.toggleTerminal")<CR>', { silent = true })
vim.keymap.set('n', '<leader>tn', '<Cmd>call VSCodeNotify("workbench.action.terminal.new")<CR>', { silent = true })
vim.keymap.set('n', '<leader>tk', '<Cmd>call VSCodeNotify("workbench.action.terminal.kill")<CR>', { silent = true })
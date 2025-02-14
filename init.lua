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
vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
  require("vscode-multi-cursor").addSelectionToNextFindMatch()
end)

-- Enhanced navigation mappings
-- Insert mode: Alt + hjkl for movement (less likely to conflict)
vim.keymap.set('i', '<A-h>', '<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '<A-j>', '<Down>', { noremap = true, silent = true })
vim.keymap.set('i', '<A-k>', '<Up>', { noremap = true, silent = true })
vim.keymap.set('i', '<A-l>', '<Right>', { noremap = true, silent = true })

-- Visual mode navigation
vim.keymap.set('v', '<A-h>', '<Left>', { noremap = true, silent = true })
vim.keymap.set('v', '<A-j>', '<Down>', { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', '<Up>', { noremap = true, silent = true })
vim.keymap.set('v', '<A-l>', '<Right>', { noremap = true, silent = true })
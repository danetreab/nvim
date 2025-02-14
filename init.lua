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

vim.g.mapleader = ' ' 

-- Save file
vim.keymap.set('n', '<leader>s', ':w<CR>', { silent = true })

-- Write and quit 
vim.keymap.set('n', '<leader>q', ':wq<CR>', { silent = true })

vim.opt.clipboard = 'unnamedplus' 

-- Search settings
vim.opt.ignorecase = true    
vim.opt.smartcase = true 

-- Better line navigation for wrapped lines
vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })

-- Highlight word under cursor
vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
  require("vscode-multi-cursor").addSelectionToNextFindMatch()
end)
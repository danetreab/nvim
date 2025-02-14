return { -- Example: Install a colorscheme
{"folke/tokyonight.nvim"}, -- Example: Install Telescope (fuzzy finder)
{
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    cmd = "Telescope"
}, {
    "vscode-neovim/vscode-multi-cursor.nvim",
    config = function()
        require('vscode-multi-cursor').setup { -- Config is optional
            -- Whether to set default mappings
            default_mappings = true,
            -- If set to true, only multiple cursors will be created without multiple selections
            no_selection = false
        }
    end
}}


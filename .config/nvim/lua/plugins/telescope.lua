return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 
            'nvim-lua/plenary.nvim',
            'folke/which-key.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },

        config = function()
            local builtin = require('telescope.builtin')
            local extensions = require('telescope').extensions
            local wk = require('which-key')

            -- Enable telescope-fzf-native
            pcall(require('telescope').load_extension, 'fzf')

            wk.add({
                    {"<leader>ff", builtin.find_files, desc = "Telescope [F]ind [F]iles"},
                    {"<leaderfg", builtin.live_grep, desc = "Telescope Live [G]rep"},
                    {"<leader>fb", builtin.buffers, desc = "Telescope [B]uffers"},
                    {"<leader>ft", builtin.help_tags, desc = "Telescope Help [T]ags"},
                    {"<leader>fd", extensions.file_browser.file_browser, desc = "Telescope File Browser"},
            })

            wk.add({
                    name = 'Telescope Git',
                    {"<leader>gf", builtin.git_files, desc = 'Git files' },
                    {"<leader>gc", builtin.git_commits, desc = 'Git Commits' },
                    {"<leader>gb", builtin.git_branches, desc = 'Git Branches' },
                    {"<leader>gs", builtin.git_stash, desc = 'Git Stash' },
            })
        end,
    },
}

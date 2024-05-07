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

            wk.register({
                f = {
                    f = { builtin.find_files, "Telescope [F]ind [F]iles"},
                    g = {builtin.live_grep, "Telescope Live [G]rep"},
                    b = {builtin.buffers, "Telescope [B]uffers"},
                    h = {builtin.help_tags, "Telescope Help [T]ags"},
                    d = { extensions.file_browser.file_browser, "Telescope File Browser"},
                }
            }, { prefix = "<leader>" })

            wk.register({
                g = {
                    name = 'Telescope Git',
                    f = { builtin.git_files, 'Git files' },
                    c = { builtin.git_commits, 'Git Commits' },
                    b = { builtin.git_branches, 'Git Branches' },
                    s = { builtin.git_stash, 'Git Stash' },
                }
            }, { prefix = "<leader>" })
        end,
    },
}

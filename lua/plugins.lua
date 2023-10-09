plugins = {
    -- only set relativenumber on focused window
    "sitiom/nvim-numbertoggle",

    -- list available keymaps
    {
        "folke/which-key.nvim",
        lazy = VeryLazy,
        init = function() 
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },

    -- color theme
    {
        "ful1e5/onedark.nvim",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme onedark")
        end,
    },

    -- file tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            window = {
                width = 30,
            },
        },
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "onedark",
            },
            sections = {
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = {},
            },
        },
    },

    -- comment/uncomment blocks of code easily
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup()
        end,
    },

    -- fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- git changes in gutter
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },

    -- save session by working directory
    {
        "rmagatti/auto-session",
        opts = {
            pre_save_cmds = { 
                function()
                    current_tab = vim.fn.tabpagenr()
                    vim.cmd("tabdo Neotree close")
                    vim.cmd("Neotree close")
                    vim.cmd.tabnext(current_tab)
                    vim.cmd("Neotree close")

                end
            },
            post_restore_cmds = { "Neotree show", function() restore_done = true end },
        },
        config = function(_, opts) 
            require("auto-session").setup(opts)
        end,
    },

    -- surround text
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    }
}

-- get lazy.nvim if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins)

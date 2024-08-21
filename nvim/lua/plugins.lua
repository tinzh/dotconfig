plugins = {
    -- only set relativenumber on focused window
    "sitiom/nvim-numbertoggle",

    -- list available keymaps
    {
        "folke/which-key.nvim",
    },

    -- color theme
    {
        "Mofiqul/vscode.nvim",
        priority = 1000,
        config = function()
           require("vscode").load()
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
                mappings = {
                    ["s"] = "noop",
                    ["S"] = "noop",
                    ["z"] = "noop",
                },
            },
        },
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "codedark",
            },
            sections = {
                lualine_c = { { "filename", path = 1 } },
                lualine_x = {},
            },
            inactive_sections = {
                lualine_c = { { "filename", path = 1} },
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
        config = function()
            rg_args = { unpack(require("telescope.config").values.vimgrep_arguments) }
            table.insert(rg_args, "-L")
            require("telescope").setup({
                defaults = {
                    vimgrep_arguments = rg_args

                },
                pickers = {
                    find_files = {
                        follow = true
                    },
                    git_files = {
                        follow = true
                    },
                },
            })

        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- git changes in gutter
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
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
    },

    -- preview registers
    {
        "tversteeg/registers.nvim",
        config = function()
            require("registers").setup({ window = { border = "single" } })
        end,
    },

    -- git
    {
        "tpope/vim-fugitive",
    },

    -- file finding
    {
        "theprimeagen/harpoon",
        config = function()
            require("harpoon").setup({
                menu = {
                    width = vim.api.nvim_win_get_width(0) / 2
                }
            })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "comment" },
                auto_install = true,
                highlight = { enable = true },
                indent = {
                    enable = true,
                    disable = { "lua" },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                },
            })
        end,
    },

    -- treesitter objects
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = {
            "nvim-treesitter/nvim-treesitter"
        },
    },

    -- lsp
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.on_attach(
                function(_, bufnr)
                    lsp_zero.default_keymaps({ buffer = bufnr, exclude = {"K", "[d", "]d", "gr"} })
                    vim.keymap.set("n", "ge", vim.diagnostic.open_float, { buffer = bufnr, desc = "View whole error" })
                    vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Go to previous error" })
                    vim.keymap.set("n", "g]", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Go to next error" })
                    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename all references" })
                    vim.keymap.set("n", "k", vim.lsp.buf.hover, { buffer = bufnr, desc = "Display hover information" })
                end
            )

            -- use tab and enter to navigate snippet selection
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ selected = true }),
                    ["<Tab>"] = lsp_zero.cmp_action().luasnip_supertab(),
                    ["<S-Tab>"] = lsp_zero.cmp_action().luasnip_shift_supertab(),
                })
            })

            require("mason").setup()
            require("mason-lspconfig").setup({
                handlers = {
                    lsp_zero.default_setup,
                },
            })
        end,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
    },

    -- autosave
    {
        "pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup({
                debounce_delay = 10000,
            })
        end,
    },

    -- git conflicts
    {
        "akinsho/git-conflict.nvim",
        version = "*",
        opts = {
            default_mappings = false,
        },
    },

    -- indent guessing
    {
        "tpope/vim-sleuth",
    },

    -- indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    -- whitespace highlighter
    {
        "ntpeters/vim-better-whitespace",
    },

    -- session saving
    {
        "rmagatti/auto-session",
        opts = {
            auto_session_enabled = true,
            pre_save_cmds = {
                function()
                    current_tabpage = vim.fn.tabpagenr()
                    vim.cmd.tabdo("Neotree close")
                    vim.cmd.tabnext(current_tabpage)
                end
            },
            post_restore_cmds = {
                function()
                    -- current_tabpage = vim.fn.tabpagenr()
                    -- vim.cmd.tabdo("Neotree show")
                    -- vim.cmd.tabnext(current_tabpage)
                    -- vim.cmd("Neotree show")
                end
            },
        },
    },

    -- motions
    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").setup({
                -- unused by me: ljKQXZ!-+=^*\`_()~{}&|HML
                safe_labels = "stnhlfu/jSTNHMGLFUZQXJ!-+=()?\\~_*'~{}`", -- bBeEwW?
                labels = "arstneiodhvkgmplfuc,wyx.z/q;ARSTNEIODHVKGMPLFUC,WYZQ!-+=:()?\\~`|#&\"_>[*{<]/}^@'%"
                -- TODO: labels = ""
            })
        end,
    },

    -- git blame
    {
        "FabijanZulj/blame.nvim",
        config = function()
            require("blame").setup()
        end
    },
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

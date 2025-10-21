plugins = {
    -- only set relativenumber on focused window
    "sitiom/nvim-numbertoggle",

    -- list available keymaps
    {
        "folke/which-key.nvim",
        opts = {
            delay = 400,
            sort = {"alphanum"}
        },
    },

    -- color theme
    {
        "Mofiqul/vscode.nvim",
        priority = 1000,
        config = function()
            require("vscode").setup({
                terminal_colors = false,
                transparent = true,
                color_overrides = { vscCursorDarkDark = "#07090a", vscTabCurrent = '#000000', vscTabOther = '#212121', vscTabOutside = '', },
            });
            vim.cmd("colorscheme vscode")
            local c = require("vscode.colors").get_colors()
            vim.api.nvim_set_hl(0, '@keyword', { fg = c.vscPink, bg = 'NONE' })
            vim.api.nvim_set_hl(0, '@keyword.modifier', { fg = c.vscBlue, bg = 'NONE' })
            vim.api.nvim_set_hl(0, '@constructor', { fg = c.vscBlueGreen, bg = 'NONE' })
        end,
    },

    {
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            require("onedark").setup({ style = "darker" })
        end,
    },

    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                color_overrides = {
                    mocha = {
                        base = "#1F1F1F",
                        mantle = "#2D2D2D",
                        crust = "#252525",
                    },
                },
            })
        end,
    },

    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        config = function()
            require("nightfox").setup()
        end,
    },

    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require("tokyonight").setup()
        end,
    },

    {
        "nyoom-engineering/oxocarbon.nvim",
        priority = 1000,
    },

    {
        "sainnhe/everforest",
        priority = 1000,
    },

    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
    },

    {
        "Mofiqul/dracula.nvim",
        priority = 1000,
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
            default_component_configs = {
                symlink_target = {
                    enabled = false,
                },
            },
            window = {
                width = 30,
                mappings = {
                    ["s"] = "noop",
                    ["S"] = "noop",
                    ["z"] = "noop",
                },
            },
            filesystem = {
                filtered_items = {
                    hide_hidden = false,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_by_name = { ".git" },
                },
            },
        },
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local colors = {
                gray     = '#3C3C3C',
                lightred = '#D16969',
                blue     = '#569CD6',
                pink     = '#C586C0',
                black    = '#15191e',
                white    = '#D4D4D4',
                green    = '#608B4E',
            }
            custom_codedark = {
                normal = {
                    b = { fg = colors.green, },
                    a = { fg = colors.black, bg = colors.green, gui = 'bold' },
                    c = { fg = colors.white, },
                },
                visual = {
                    b = { fg = colors.pink, },
                    a = { fg = colors.black, bg = colors.pink, gui = 'bold' },
                },
                inactive = {
                    b = { fg = colors.black, bg = colors.blue },
                    a = { fg = colors.white, bg = colors.gray, gui = 'bold' },
                },
                replace = {
                    b = { fg = colors.lightred, },
                    a = { fg = colors.black, bg = colors.lightred, gui = 'bold' },
                    c = { fg = colors.white, },
                },
                insert = {
                    b = { fg = colors.blue, },
                    a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
                    c = { fg = colors.white, },
                },
            }

            require("lualine").setup({
                options = {
                    theme = custom_codedark,
                },
                sections = {
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = {},
                },
                inactive_sections = {
                    lualine_c = { { "filename", path = 1} },
                }
            })
        end,
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
        config = function()
            rg_args = { unpack(require("telescope.config").values.vimgrep_arguments) }
            table.insert(rg_args, "-L")
            require("telescope").setup({
                defaults = {
                    -- for live grep
                    vimgrep_arguments = rg_args
                },
                pickers = {
                    find_files = {
                        follow = true,
                        no_ignore = true,
                    },
                    git_files = {
                        follow = true,
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
            require("nvim-surround").setup({
                keymaps = {
                    normal = "j",
                    normal_cur = "jj",
                    normal_line = "jJ",
                    normal_cur_line = "jJJ",
                    visual = "j",
                    visual_line = "J",
                    delete = "dj",
                    change = "cj",
                    change_line = "cJ",
                }
            })
        end,
    },

    -- -- preview registers
    -- {
    --     "tversteeg/registers.nvim",
    --     config = function()
    --         require("registers").setup({ window = { border = "single" } })
    --     end,
    -- },

    -- git
    -- {
    --     "tpope/vim-fugitive",
    -- },

    {
        "oguzbilgic/vim-gdiff",
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
                    disable = { "lua", "gitcommit" },
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
                    lsp_zero.default_keymaps({ buffer = bufnr, exclude = {"K", "[d", "]d"} })
                    vim.keymap.set("n", "ge", vim.diagnostic.open_float, { buffer = bufnr, desc = "View whole error" })
                    vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Go to previous error" })
                    vim.keymap.set("n", "g]", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Go to next error" })
                    vim.keymap.set("n", "<leader>m", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename all references" })
                    vim.keymap.set("n", "k", vim.lsp.buf.hover, { buffer = bufnr, desc = "Display hover information" })
                    vim.api.nvim_create_user_command("LZF", "LspZeroFormat", {})
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
            require("lspconfig").clangd.setup({
                cmd = {"clangd", "--header-insertion=never"},
            })

            -- vim.cmd("highlight def link @lsp.mod.constructorOrDestructor.cpp @function")
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
        "rhysd/conflict-marker.vim",
        config = function()
            vim.g.conflict_marker_enable_mappings = 0
            -- vim.g.conflict_marker_highlight_group = ""

            vim.g.conflict_marker_begin = "^<<<<<<< .*$"
            vim.g.conflict_marker_end = "^>>>>>>> .*$"

            vim.cmd("highlight ConflictMarkerBegin guibg=#355c54")
            vim.cmd("highlight ConflictMarkerOurs guibg=#25403a")
            vim.cmd("highlight ConflictMarkerTheirs guibg=#26394d")
            vim.cmd("highlight ConflictMarkerEnd guibg=#344f69")
            vim.cmd("highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81")
        end,
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
        "cameronr/auto-session",
        branch = 'shada',
        opts = {
            -- auto_session_enabled = true,
            save_and_restore_shada = true,
            pre_save_cmds = {
                function()
                    current_tabpage = vim.fn.tabpagenr()
                    vim.cmd.tabdo("Neotree close")
                    vim.cmd.tabnext(current_tabpage)
                end
            },
        },
    },

    -- motions
    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").setup({
                -- unused by me: jKQXZ!-+=^*\`_()~{}&|HML
                safe_labels = "stnhfu/jSTNHMGLFUZQXJ!-+=()?\\~_*'~{}`", -- bBeEwW?
                labels = "arstneiodhvkgmplfuc,wyx.z/q;ARSTNEIODHVKGMPLFUC,WYZQ!-+=:()?\\~`|#&\"_>[*{<]/}^@'%"
                -- TODO: labels = ""
            })
        end,
    },

    -- git blame
    {
        "FabijanZulj/blame.nvim",
        config = function()
            require("blame").setup({
                date_format = "%m.%d.%Y"
            })
        end
    },

    -- closing characters
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    -- automatic file reload
    {
        "djoshea/vim-autoread",
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

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd(
    "TermOpen",
    {
        callback = function()
            vim.cmd("DisableWhitespace")
        end,
        desc = "Disable trailing whitespace highlighting for terminal windows",
    }
)

autocmd(
    "BufEnter",
    {
        callback = function()
            vim.cmd("hi chiplogalways guifg=#81e397")
            vim.cmd("syn match chiplogalways /^.*|ALWAYS|.*$/");
            vim.cmd("hi chiplogerror guifg=#cf7e77")
            vim.cmd("syn match chiplogerror /^.*|ERROR |.*$/");
            vim.cmd("hi chiplogwarning guifg=#eae14a")
            vim.cmd("syn match chiplogwarning /^.*|WARN  |.*$/");
            vim.cmd("hi chiplognotice gui=bold")
            vim.cmd("syn match chiplognotice /^.*|NOTICE|.*$/");
            -- info is normal
            vim.cmd("hi chiplogdebug guifg=#969696")
            vim.cmd("syn match chiplogdebug /^.*|DEBUG |.*$/");

            vim.cmd("hi newfile guifg=#d382db")
            vim.cmd("syn match newfile /^.*following new file$/");
        end,
        desc = "Highlighting for log files"
    }
)

autocmd(
    "BufReadPost",
    {
        pattern = "quickfix",
        callback = function()
            vim.keymap.set("n", "<CR>", "<CR>", { buffer = true })
        end,
    }
)

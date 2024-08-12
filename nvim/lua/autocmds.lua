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
    "BufReadPost",
    {
        pattern = "quickfix",
        callback = function()
            vim.keymap.set("n", "<CR>", "<CR>", { buffer = true })
        end,
    }
)

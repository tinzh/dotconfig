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
        desc = "Revert <CR> keymap for quickfix menu"
    }
)

autocmd(
    "TermClose",
    {
        callback = function()
            vim.cmd("bdelete!")
        end,
        desc = "Delete terminal buffers on exit"
    }
)

autocmd(
    {"BufReadPost", "BufNewFile"},
    {
        pattern = "*.log",
        callback = function()
            vim.opt_local.readonly = true;
            vim.opt_local.modifiable = false;
            vim.opt_local.undofile = false;
        end,
        desc = "Make .log files readonly and not modifiable"
    }
)

-- after timeout, close neovim
local timeoutDays = 4
local timeoutMin = 4 * 24 * 60
local idleTimer = vim.loop.new_timer()
local function resetTimer()
    idleTimer:stop()
    idleTimer:start(timeoutMin * 60 * 1000, 0, vim.schedule_wrap(function() vim.cmd("qa!") end))
end

autocmd(
    {
        "CursorMoved",
        "CursorMovedI",
        "InsertEnter",
        "InsertLeave",
        "TextChanged",
        "TextChangedI",
        "CmdlineEnter",
        "CmdlineLeave",
        "BufEnter",
        "WinEnter",
        "FocusGained",
    },
    {
        callback = resetTimer,
        desc = "Reset idle timer on any activitiy"
    }
)

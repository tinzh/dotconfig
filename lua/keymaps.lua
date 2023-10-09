local keymap = vim.keymap

vim.g.mapleader = " "

-- "kj" to escape
keymap.set({"i", "v", "c"}, "kj", "<Esc>", { desc = "Exit" })
keymap.set("t", "kj", "<C-\\><C-n>", { desc = "Exit" })

-- remove highlighting
keymap.set("n", "<leader>nl", "<cmd>nohl<CR>", { desc = "Remove highlighting" })

-- de-indent in insert mode
keymap.set("i", "<S-Tab>", "", { desc = "De-indent" })

-- comment with <C-/>
keymap.set("i", "", "<Esc>gcci<C-f>", { remap = true, desc = "Comment current line" })
keymap.set("n", "", "gcc", { remap = true, desc = "Comment current line"})
keymap.set("v", "", "gc", { remap = true, desc = "Comment block" })

-- surround with s
keymap.set("v", "s", "S", { remap = true, desc = "Surround with s"})

-- quit all windows
keymap.set("n", "<leader>q", "<cmd>wa<CR><cmd>qa<CR>", { desc = "Save and quit all buffers" })

-- better scrolling
keymap.set(
    "n", 
    "<C-d>", 
    function()
        curr_height = vim.fn.winheight(0)
        ans = ""

        for _ = 1, curr_height/2, 1 do
            ans = ans .. "jzz:sleep 1m<CR>"
        end
        return ans
    end, 
    { expr = true, desc = "Jump"  }
)
keymap.set(
    "n", 
    "<C-u>", 
    function()
        curr_height = vim.fn.winheight(0)
        ans = ""

        for _ = 1, curr_height/2, 1 do
            ans = ans .. "kzz:sleep 1m<CR>"
        end
        return ans
    end, 
    { expr = true, desc = "Jump"  }
)

-- telescope
keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Open Telescope" })
keymap.set("n", "<leader>F", "<cmd>Telescope git_files<CR>", { desc = "Open Telescope with files tracked by Git" })

-- git
keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk" })
keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })

-- open terminal below, or toggle focus to it
keymap.set(
    "n", 
    "<leader>'", 
    function()
        -- if focus is on a terminal, move focus away
        if string.find(vim.fn.bufname(), "term://", 1, true) then
            vim.cmd("wincmd p")
            return
        end

        -- if tab has a terminal, move focus to it
        for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
            bufname = vim.fn.bufname(vim.fn.winbufnr(win))
            if string.find(bufname, "term://", 1, true) then
                vim.api.nvim_set_current_win(win)
                return
            end
        end

        -- no terminal found, create new terminal
        vim.cmd("wincmd s")
        vim.cmd("terminal")
        vim.cmd("wincmd 7-")
        wd = vim.fn.getcwd()
        vim.api.nvim_feedkeys("cd " .. wd .. "\nclear\n", "m", false)
    end,
    { desc = "Open terminal" }
)

-- windows and splitting
keymap.set("n", "<leader>sh", "<cmd>set nosplitright<CR><C-w>v<cmd>set splitright<CR>", { desc = "Split window vertically left" })
keymap.set("n", "<leader>sl", "<C-w>v", { desc = "Split window vertically right" })
keymap.set("n", "<leader>sj", "<C-w>s", { desc = "Split window horizontally below" })
keymap.set("n", "<leader>sk", "<cmd>set nosplitbelow<CR><C-w>s<cmd>set splitbelow<CR>", { desc = "Split window horizontally above" })
keymap.set("n", "<leader>w;", "<C-w>q", { desc = "Close window", remap = true })
keymap.set("n", "<leader>w", "<C-w>", { desc = "Easier <C-w>" })
    
-- tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>t;", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tj", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tk", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tO", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

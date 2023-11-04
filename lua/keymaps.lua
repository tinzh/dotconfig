local keymap = vim.keymap.set

vim.g.mapleader = " "

-- "kj" to escape
keymap({"i", "v", "c"}, "kj", "<Esc>", { desc = "Exit" })
keymap("t", "kj", "<C-\\><C-n>", { desc = "Exit" })

-- remove highlighting
keymap("n", "<leader>nl", "<cmd>nohl<CR>", { desc = "Remove highlighting" })

-- de-indent in insert mode
keymap("i", "<S-Tab>", "", { desc = "De-indent" })

-- insert line before/after
keymap("n", "<CR>", function() vim.fn.append(vim.fn.line("."), "") end, { desc = "Add one line below" })
keymap("n", "<leader><CR>", function() vim.fn.append(vim.fn.line(".")-1, "") end, { desc = "Add one line above" })

-- comment with <C-/>
keymap("i", "", "<Esc>gcci<C-f>", { remap = true, desc = "Comment current line" })
keymap("n", "", "gcc", { remap = true, desc = "Comment current line"})
keymap("v", "", "gc", { remap = true, desc = "Comment block" })

-- surround with s
keymap("v", "s", "S", { remap = true, desc = "Surround with s"})

-- replace current word
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Replace current word" })

-- quit all windows
keymap("n", "<leader>q", "<cmd>wa<CR><cmd>qa<CR>", { desc = "Save and quit all buffers" })

-- better scrolling
keymap(
    "n", 
    "<C-d>", 
    "<C-d>zz",
    { desc = "Jump"  }
)
keymap(
    "n", 
    "<C-u>", 
    "<C-u>zz",
    { desc = "Jump"  }
)

-- neotree
keymap("n", "<leader>te", "<cmd>Neotree<CR>", { desc = "Open Neotree" })

-- telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Open Telescope" })
keymap("n", "<leader>F", "<cmd>Telescope git_files<CR>", { desc = "Open Telescope with files tracked by Git" })

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
keymap("n", "<leader>h", ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })
keymap("n", "<leader>ha", function() mark.toggle_file(mark.get_current_index()) end, { desc = "Toggle file to Harpoon" })
keymap("n", "<leader>gk", ui.nav_next, { desc = "Go to next Harpoon mark" })
keymap("n", "<leader>gj", ui.nav_prev, { desc = "Go to previous Harpoon mark" })

-- git
keymap("n", "<leader>gh", "<cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk" })
keymap("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
keymap("n", "co", "<cmd>GitConflictChooseOurs<CR>", { desc = "Merge conflict: choose original" })
keymap("n", "ci", "<cmd>GitConflictChooseTheirs<CR>", { desc = "Merge conflict: choose incoming" })
keymap("n", "cb", "<cmd>GitConflictChooseBoth<CR>", { desc = "Merge conflict: choose both" })
keymap("n", "cn", "<cmd>GitConflictChooseNone<CR>", { desc = "Merge conflict: choose none" })
keymap("n", "[x", "<cmd>GitConflictPrevConflict<CR>", { desc = "Merge conflict: go to previous" })
keymap("n", "]x", "<cmd>GitConflictNextConflict<CR>", { desc = "Merge conflict: go to next" })

-- open terminal below, or toggle focus to it
local toggle_terminal = function()
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
            vim.cmd("startinsert")
            return
        end
    end

    -- no terminal found, create new terminal
    vim.cmd("wincmd s")
    vim.cmd("terminal")
    vim.cmd("wincmd 7-")
    wd = vim.fn.getcwd()
    -- vim.api.nvim_feedkeys("cd " .. wd .. "\nclear\ni", "m", false)
    vim.cmd("startinsert")
end

keymap({ "n", "t" }, "<C-G>", toggle_terminal, { desc = "Toggle terminal" })
keymap("n", "<leader>'", toggle_terminal, { desc = "Open terminal" })

-- windows and splitting
keymap("n", "<leader>sh", "<cmd>set nosplitright<CR><C-w>v<cmd>set splitright<CR>", { desc = "Split window vertically left" })
keymap("n", "<leader>sl", "<C-w>v", { desc = "Split window vertically right" })
keymap("n", "<leader>sj", "<C-w>s", { desc = "Split window horizontally below" })
keymap("n", "<leader>sk", "<cmd>set nosplitbelow<CR><C-w>s<cmd>set splitbelow<CR>", { desc = "Split window horizontally above" })
keymap("n", "<leader>;", "<C-w>q", { desc = "Close window", remap = true })
keymap("n", "<leader>w", "<C-w>", { desc = "Easier <C-w>" })
    
-- tabs
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>t;", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap("n", "<leader>tj", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap("n", "<leader>tk", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tO", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

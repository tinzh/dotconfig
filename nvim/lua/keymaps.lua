local keymap = vim.keymap.set

vim.g.mapleader = " "

-- reload config
keymap("n", "<leader>l", "<cmd>so ~/.config/nvim/init.lua<CR>", { desc = "Reload config" })

-- remove highlighting
keymap("n", "<leader>nl", "<cmd>nohl<CR>", { desc = "Remove highlighting" })

-- insert line before/after
keymap("n", "<CR>", "o<Esc>", { desc = "Add one line below" })
keymap("n", "<leader><CR>", "O<Esc>", { desc = "Add one line above" })

-- replace current word
keymap("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Replace current word" })

-- quit all windows
keymap("n", "<leader>q", "<cmd>wa<CR><cmd>qa<CR>", { desc = "Save and quit all buffers" })
keymap("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all buffers" })

-- better scrolling
keymap( "n", "<C-d>", "<C-d>zz", { desc = "Jump"  })
keymap( "n", "<C-u>", "<C-u>zz", { desc = "Jump"  })

-- native remaps
keymap("n", "h", "'", { desc = "Jump to mark" })
keymap("n", "l", "@", { desc = "Run macro" })

-- leap.nvim
keymap({"n", "x", "o"}, "s", "<Plug>(leap)", { desc = "Leap" })
keymap({"n", "x", "o"}, "S", "<Plug>(leap-from-window)", { desc = "Leap from window" })

-- quickfix menu
keymap("n", "<leader>ce", "<cmd>cn<CR>", { desc = "Go to next quickfix" })
keymap("n", "<leader>cn", "<cmd>cp<CR>", { desc = "Go to prev quickfix" })
keymap("n", "<leader>cq", "<cmd>ccl<CR>", { desc = "Close quickfix window" })

-- .h/.cpp file switching
keymap("n", "<leader>u", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch between .h/.cpp files" })

-- neotree
keymap("n", "<leader>ti", "<cmd>Neotree<CR>", { desc = "Open Neotree" })
keymap("n", "<leader>to", "<cmd>Neotree reveal_file=%<CR>", { desc = "Open Neotree to file" })

-- telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Open Telescope" })
-- keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files({find_command = { 'rg', '--follow', '--sort', 'path', '--no-ignore' }})<CR>", { desc = "Open Telescope" })
keymap("n", "<leader>F", "<cmd>Telescope git_files<CR>", { desc = "Open Telescope with files tracked by Git" })
keymap("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { desc = "Search for a string with Telescope" })
keymap("n", "<leader>.", "<cmd>Telescope grep_string<CR>", { desc = "Search for current string with Telescope" })

-- harpoon
-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
-- keymap("n", "<leader>ht", ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })
-- keymap("n", "<leader>ha", function() mark.toggle_file(mark.get_current_index()) end, { desc = "Toggle file to Harpoon" })
-- keymap("n", "<leader>te", ui.nav_next, { desc = "Go to next Harpoon mark" })
-- keymap("n", "<leader>tn", ui.nav_prev, { desc = "Go to previous Harpoon mark" })

-- git
keymap("n", "gh", "<cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk" })
keymap("n", "gt", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
keymap("n", "<leader>gn", "<cmd>Gitsigns nav_hunk prev<CR>zz", { desc = "Go to previous hunk" })
keymap("n", "<leader>ge", "<cmd>Gitsigns nav_hunk next<CR>zz", { desc = "Go to next hunk" })
keymap("n", "gm", "<cmd>BlameToggle virtual<CR>", { desc = "Toggle Git blame" })
keymap("n", "gM", "<cmd>BlameToggle window<CR>", { desc = "Toggle Git blame" })
keymap("n", "<leader>co", "<cmd>ConflictMarkerOurselves<CR>", { desc = "Merge conflict: choose original" })
keymap("n", "<leader>ct", "<cmd>ConflictMarkerThemselves<CR>", { desc = "Merge conflict: choose theirs" })
keymap("n", "<leader>cb", "<cmd>ConflictMarkerBoth<CR>", { desc = "Merge conflict: choose both" })
keymap("n", "<leader>cv", "<cmd>ConflictMarkerNone<CR>", { desc = "Merge conflict: choose none" })
keymap("n", "<leader>cm", "<cmd>ConflictMarkerPrevHunk<CR>", { desc = "Merge conflict: go to previous" })
keymap("n", "<leader>ci", "<cmd>ConflictMarkerNextHunk<CR>", { desc = "Merge conflict: go to next" })

-- terminal
keymap("t", "<C-a>",  "<C-\\><C-n>", { desc = "Escape in terminal" })
keymap("n", "<leader>tm", ":term<CR>i", { desc = "Open terminal in current window" })
keymap("n", "<F5>", ":term<CR>i", { desc = "Open terminal in current window" })

-- windows and splitting
keymap("n", "<leader>sm", "<cmd>set nosplitright<CR><C-w>v<cmd>set splitright<CR>", { desc = "Split window vertically left" })
keymap("n", "<leader>si", "<C-w>v", { desc = "Split window vertically right" })
keymap("n", "<leader>sn", "<C-w>s", { desc = "Split window horizontally below" })
keymap("n", "<leader>se", "<cmd>set nosplitbelow<CR><C-w>s<cmd>set splitbelow<CR>", { desc = "Split window horizontally above" })
keymap("n", "<leader>;", "<C-w>q", { desc = "Close window", remap = true })
keymap("n", "<leader>wm", "<C-w>h", { desc = "Easier <C-w>h" })
keymap("n", "<leader>wn", "<C-w>j", { desc = "Easier <C-w>j" })
keymap("n", "<leader>we", "<C-w>k", { desc = "Easier <C-w>k" })
keymap("n", "<leader>wi", "<C-w>l", { desc = "Easier <C-w>l" })

-- windows and splitting, with function keys
keymap("n", "<F6>", "<C-w>h", { desc = "Easier <C-w>h" })
keymap("n", "<F7>", "<C-w>j", { desc = "Easier <C-w>j" })
keymap("n", "<F8>", "<C-w>k", { desc = "Easier <C-w>k" })
keymap("n", "<F9>", "<C-w>l", { desc = "Easier <C-w>l" })
keymap("n", "<F10>", "<C-w>q", { desc = "Close window", remap = true })
keymap("n", "<S-F4>", "<cmd>set nosplitright<CR><C-w>v<cmd>set splitright<CR>", { desc = "Split window vertically left" })
keymap("n", "<F16>", "<cmd>set nosplitright<CR><C-w>v<cmd>set splitright<CR>", { desc = "Split window vertically left" })
keymap("n", "<S-F5>", "<C-w>s", { desc = "Split window horizontally below" })
keymap("n", "<F17>", "<C-w>s", { desc = "Split window horizontally below" })
keymap("n", "<S-F6>", "<cmd>set nosplitbelow<CR><C-w>s<cmd>set splitbelow<CR>", { desc = "Split window horizontally above" })
keymap("n", "<F18>", "<cmd>set nosplitbelow<CR><C-w>s<cmd>set splitbelow<CR>", { desc = "Split window horizontally above" })
keymap("n", "<S-F7>", "<C-w>v", { desc = "Split window vertically right" })
keymap("n", "<F19>", "<C-w>v", { desc = "Split window vertically right" })
keymap("n", "<C-p>", "<leader>u", { desc = "Switch between .h/.cpp files", remap = true })

-- tabs
keymap("n", "<F11>", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap("n", "<F12>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap("n", "<S-F1>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<F13>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<S-F2>", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<F14>", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<C-F14>", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
keymap("n", "<S-F3>", ":tabm ", { desc = "Move tab" })
keymap("n", "<F15>", ":tabm ", { desc = "Move tab" })

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

restore_done = false
autocmd(
    { "TabEnter", "TabNew" },
    {
        callback = function()
            -- don't run things if auto-session hasn't restored everything
            if restore_done then
                -- sometimes "Neotree show" gets a bad current_win to switch back to
                -- this error checks to make sure that doesn't happen
                current_win = vim.api.nvim_get_current_win()
                vim.cmd("Neotree")
                current_wins = vim.api.nvim_list_wins()
                for _, win in pairs(vim.api.nvim_list_wins()) do
                    -- if window does exists, switch to it
                    if win == current_win then
                        vim.api.nvim_set_current_win(current_win)
                        return
                    end
                end

                -- otherwise, just switch to the window right of Neotree
                vim.cmd("wincmd l")
            end
        end,
        desc = "Activate Neotree",
    }
)

-- autocmd(
--     "BufEnter",
--     {
--         callback = function() 
--             if (string.find(vim.bo.buftype, "terminal")) then
--                 vim.cmd("startinsert")
--             end
--         end,
--         desc = "Enter terminal mode automatically",
--     }
-- )

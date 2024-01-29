local opt = vim.opt -- concision

-- hybrid line numbers
opt.relativenumber = true
opt.number = true

-- tabs/indentation
opt.tabstop = 8
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- keymap timeout
opt.timeout = true
opt.timeoutlen = 300

-- line wrapping
opt.wrap = false

-- colors
opt.termguicolors = true

-- searching
opt.ignorecase = true
opt.smartcase = true

-- highlight line with cursor
opt.cursorline = true

-- keep context around cursor at ends of window
opt.scrolloff = 3

-- good backspace as expected
opt.backspace = "indent,eol,start"

-- windows
opt.splitright = true
opt.splitbelow = true

-- keep undos between sessions
opt.updatetime = 750
opt.undofile = true
opt.swapfile = false

-- ruler
opt.colorcolumn = "80"

-- read file when changed outside of neovim
opt.autoread = true

-- fold markers
opt.foldcolumn = "auto"

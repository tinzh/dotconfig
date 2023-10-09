local opt = vim.opt -- concision

-- hybrid line numbers
opt.relativenumber = true
opt.number = true

-- tabs/indentation
opt.tabstop = 8
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

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
opt.undofile = true

-- ruler
opt.colorcolumn = "80"

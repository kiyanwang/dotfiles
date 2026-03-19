local opt = vim.opt

-- General
opt.history = 500
opt.hidden = true
opt.backspace = { "indent", "eol", "start" }
opt.title = true
opt.mouse = "a"
opt.laststatus = 2

-- UI / Colors
opt.termguicolors = true
opt.background = "dark"
opt.wildmenu = true
opt.wildignore:append({ ".git/*", ".hg/*", ".svn/*" })
opt.encoding = "utf-8"
opt.scrolloff = 5
opt.ruler = true
opt.cursorline = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Performance
opt.lazyredraw = true

-- Bracket matching
opt.showmatch = true
opt.matchtime = 2

-- No annoying sounds
opt.errorbells = false
opt.visualbell = true

-- Fold
opt.foldcolumn = "1"
opt.foldenable = false

-- Display
opt.showcmd = true
opt.showmode = true
opt.number = true
opt.relativenumber = true

-- Clipboard (works with tmux)
opt.clipboard = "unnamed"

-- Indent defaults (2 spaces)
opt.autoindent = true
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- Line wrapping
opt.linebreak = true
opt.textwidth = 80

-- No backups (everything is in git)
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- File handling
opt.autoread = true
opt.fileencodings = { "utf-8", "iso-8859-1" }
opt.fileformats = { "unix", "mac", "dos" }

-- Sign column and command line (from CoC, still useful for LSP)
opt.signcolumn = "yes"
opt.cmdheight = 2
opt.updatetime = 300
opt.shortmess:append("c")

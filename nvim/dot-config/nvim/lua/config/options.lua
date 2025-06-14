vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50


vim.opt.guicursor = {
  "n-v-c:block",         -- Normal, Visual, Command: block cursor
  "i-ci-ve:ver25",       -- Insert, Command Insert, Visual Ex: vertical bar
  "r-cr:hor20",          -- Replace modes: horizontal bar
  "o:hor50",             -- Operator pending: horizontal bar
  "a:blinkon100",        -- All modes: blink settings
}

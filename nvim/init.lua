require('packages')
require('treesitter')
require('lsp')

vim.cmd('colorscheme NeoSolarized')

vim.diagnostic.config({
  virtual_text = {
    prefix = '◀',
  },
  underline = true
})

local cmp = require("cmp")

cmp.setup({
  mapping = {
    ["<Esc>"] = cmp.mapping.close(),
    ["<Enter>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
  },
})


local opt = vim.opt
opt.autoindent = true
opt.background = "light"
opt.backspace = {"indent", "eol", "start"}
opt.clipboard= "unnamedplus"
opt.colorcolumn = {80, 98}
opt.cursorline = true
opt.encoding = "utf-8"
opt.expandtab = true
opt.formatoptions = "r1tcq"
opt.gdefault = true
opt.hidden = true
opt.ignorecase = true
opt.incsearch = true
opt.lazyredraw = true
opt.linebreak = true
opt.listchars= {eol = '↲', tab = '▸ ', trail = '·'}
opt.modelines = 0
opt.mouse = "a"
opt.number = true
opt.scrolloff = 3
opt.shiftwidth = 2
opt.shortmess = "atI"
opt.showcmd = true
opt.showmatch = true
opt.showmode = true
opt.smartcase = true
opt.smartindent = true
opt.tabstop = 2
opt.termguicolors = true
opt.textwidth = 98
opt.title = true
opt.vb = false
opt.wildmode = "list:longest"
opt.wrap = false

vim.g["ackprg"] = "ag --nogroup --nocolor --column"
vim.g["blameLineGitFormat"] = "%an | (%h) %ar | %s"
vim.g["markdown_fenced_languages"] = {"html", "javascript", "ruby", "elixir"}

vim.cmd [[
  autocmd BufWritePre *.ex,*.exs undojoin | lua vim.lsp.buf.formatting_sync()
  autocmd FileType markdown setlocal wrap linebreak textwidth=80
]]

vim.g.mapleader = ","
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>1', ':NERDTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader><space>', ':noh<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>B', ':ToggleBlameLine<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>T', ":lua require('telescope.builtin').find_files {previewer = false}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>b', ':LustyJuggler<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>f', ':Ack<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>j', ':NERDTreeFind<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>t', ":lua require('telescope.builtin').git_files {previewer = false}<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>w', ':set wrap!<CR>', opts)
vim.api.nvim_set_keymap('n', 'C', '"_C', opts)
vim.api.nvim_set_keymap('n', 'D', '"_D', opts)
vim.api.nvim_set_keymap('n', 'c', '"_c', opts)
vim.api.nvim_set_keymap('n', 'd', '"_d', opts)
vim.api.nvim_set_keymap('n', 'dd', '"_dd', opts)
vim.api.nvim_set_keymap('n', 'Q', '"<nop>', opts)
vim.api.nvim_set_keymap('n', 'QQ', ':q<CR>', opts)
vim.api.nvim_set_keymap('n', 's', '"_s', opts)
vim.api.nvim_set_keymap('n', 'x', '"_x', opts)
opt.grepprg = "ag --nogroup --nocolor"

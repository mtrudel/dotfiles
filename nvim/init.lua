require('packages')
require('treesitter')
require('lsp')
require('cmp-local')
require('tree')

vim.cmd('colorscheme NeoSolarized')

vim.diagnostic.config({
  virtual_text = {
    prefix = '◀',
  },
  underline = true
})

vim.opt.autoindent = true
vim.opt.background = "light"
vim.opt.backspace = {"indent", "eol", "start"}
vim.opt.clipboard= "unnamedplus"
vim.opt.colorcolumn = {80, 98}
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.expandtab = true
vim.opt.formatoptions = "r1tcq"
vim.opt.gdefault = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.listchars= {eol = '↲', tab = '▸ ', trail = '·'}
vim.opt.modelines = 0
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 2
vim.opt.shortmess = "atI"
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.textwidth = 98
vim.opt.title = true
vim.opt.vb = false
vim.opt.wildmode = "list:longest"
vim.opt.wrap = false
vim.opt.grepprg = "ag --nogroup --nocolor"

vim.g.ackprg = "ag --nogroup --nocolor --column"
vim.g.blameLineGitFormat = "%an | (%h) %ar | %s"
vim.g.markdown_fenced_languages = {"html", "javascript", "ruby"}
vim.g.mapleader = ","

vim.keymap.set('n', '<leader>1', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader><space>', ':noh<CR>')
vim.keymap.set('n', '<leader>b', function() require('telescope.builtin').oldfiles({include_current_session = true, previewer = false}) end)
vim.keymap.set('n', '<leader>B', ':ToggleBlameLine<CR>')
vim.keymap.set('n', '<leader>T', function() require('telescope.builtin').git_files({previewer = false}) end)
vim.keymap.set('n', '<leader>f', ':Ack ')
vim.keymap.set('n', '<leader>j', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<leader>t', function() require('telescope.builtin').find_files({previewer = false}) end)
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>w', ':set wrap!<CR>')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('', 'C', '"_C')
vim.keymap.set('', 'D', '"_D')
vim.keymap.set('', 'c', '"_c')
vim.keymap.set('', 'd', '"_d')
vim.keymap.set('', 'dd', '"_dd')
vim.keymap.set('', 'Q', '"<nop>')
vim.keymap.set('', 'QQ', ':q<CR>')
vim.keymap.set('', 's', '"_s')
vim.keymap.set('', 'x', '"_x')
vim.keymap.set('i','#', 'X#')
vim.keymap.set('i','<C-a>', '<C-o>^')
vim.keymap.set('i','<C-e>', '<C-o>$')
vim.keymap.set('i','<C-b>', '<C-o>b')
vim.keymap.set('i','<C-f>', '<C-o>w')

vim.cmd [[
  autocmd BufWritePre *.ex,*.exs silent! undoj | lua vim.lsp.buf.format()
  autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
  autocmd FileType markdown setlocal wrap linebreak textwidth=80
]]

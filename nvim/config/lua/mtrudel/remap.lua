vim.g.mapleader = ','

-- Make Q act better
vim.keymap.set('', 'q', '<nop>')
vim.keymap.set('', 'Q', '<nop>')
vim.keymap.set('', 'QQ', ':q<CR>')

-- System clipboard all the things
vim.keymap.set('', 'C', '"_C')
vim.keymap.set('', 'D', '"_D')
vim.keymap.set('', 'c', '"_c')
vim.keymap.set('', 'd', '"_d')
vim.keymap.set('', 'dd', '"_dd')
vim.keymap.set('', 's', '"_s')
vim.keymap.set('', 'x', '"_x')

-- Keeps J at the start of the line
vim.keymap.set('n', 'J', 'mzJ`z')

-- Moves a page at a time keeping things centered
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Clear the search highlight
vim.keymap.set('n', '<leader><space>', vim.cmd.noh)

-- Toggles
vim.keymap.set('n', '<leader>w', ':set wrap!<CR>')
vim.keymap.set('n', '<leader>s', ':set spell!<CR>')

-- Replaces the word under the cursor
vim.keymap.set('n', '<leader>e', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Moves the selection up and down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Indents the selection, keeping it highlighted
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Fix unexpected outdent of # comment symbol
vim.keymap.set('i', '#', 'X#')

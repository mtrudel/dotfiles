set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle.vundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'benekastah/neomake'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'lifepillar/vim-solarized8'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'elixir-editors/vim-elixir'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjbach/lusty'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'mtrudel/vim-mix-format'
Plugin 'sjl/vitality.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tveskag/nvim-blame-line'

call vundle#end()
filetype plugin indent on

" Application settings
" ====================

let mapleader = ","
set nobackup
set modelines=0
set encoding=utf-8
set wildmenu
set wildmode=list:longest
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set nowrap
set textwidth=120
set linebreak
set formatoptions=r1tcq
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
hi MatchParen cterm=underline ctermbg=none ctermfg=none
set dir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set exrc
set secure
set nofoldenable 
set noswapfile

" Visual things
" =============

set number
set ruler
set hlsearch
set novb  
set shortmess=atI
set cursorline
syntax on 
set listchars=tab:▸\ ,eol:¬
set scrolloff=3
set showmode
set showcmd
set hidden
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set clipboard=unnamed

" Window bits

set title
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

set colorcolumn=80,120

set termguicolors
set background=light
colorscheme solarized8
set mouse=a

" Key mappings
" ============

noremap s "_s
noremap c "_c
noremap C "_C
noremap d "_d
noremap dd "_dd
noremap D "_D
noremap x "_x

map Q <Nop> " shut up ex mode
set pastetoggle=<leader>P 
map QQ ZQ
map WW :wa<CR>
nmap ; :

vnoremap < <gv
vnoremap > >gv

nnoremap <leader><space> :noh<cr>

map <Leader>a ggVG
map <leader>b :LustyJuggler<CR>
nmap <silent> <leader>B :ToggleBlameLine<CR>
nmap <leader>V :e ~/.vimrc<CR>
nmap <silent> <leader>w :set wrap!<CR>
nmap <leader>1 :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
nmap <leader>o :only<CR>
nmap <leader>= :MixFormat<CR>
nmap <leader>af :call RubocopAutoFix()<CR>

" File type tweaks
" ================

if has("autocmd")
  augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END

  autocmd FileType make set noexpandtab
  autocmd FileType md set nonumber
  autocmd BufNewFile,BufRead,BufEnter Rakefile,Capfile,Vagrantfile set filetype=ruby
  autocmd BufWritePre * :s/\s\+$//e
  autocmd BufWritePost * :GitGutter
  autocmd BufWritePost *.ex,*.exs :MixFormat
  autocmd StdinReadPre * let s:std_in=1
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif

" Customize plugins
" =================

let g:LustyJugglerSuppressRubyWarning = 1
set wildignore+=*.o,*.obj,.git,*.png,*.otf,build/**
let g:SuperTabDefaultCompletionType = "<c-x><c-p>"
let g:SuperTabCrMapping = 1
highlight clear SignColumn



" FZF
" ===

nnoremap <silent> <leader>t :Files<cr>
nnoremap <silent> <leader>T :GFiles<cr>
let $FZF_DEFAULT_COMMAND= 'ag -g ""'

" ack
" ===

map <leader>f :Ack 
set grepprg=ag\ --nogroup\ --nocolor
let g:ackprg = 'ag --nogroup --nocolor --column'


" Powerline / Airline
" ===================

let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1


" Neomake
" =======

" let g:neomake_verbose = 3
let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_elixir_enabled_makers = ['mix', 'credo']
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
let g:neomake_virtualtext_current_error = 0
let g:neomake_highlight_columns = 0

call neomake#configure#automake('rw')

function! RubocopAutoFix()
  exe "w"
  silent exe "!rubocop -a --only Layout % &> /dev/null"
  silent exe "e %"
  silent exe "Neomake"
endfun

" RainbowParentheses
" ==================

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
nmap <leader>r :RainbowParentheses!!<CR>

let g:mix_format_silent_errors = 1

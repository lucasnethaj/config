" Plugins: {{{
" To install vim-plug plugin manager for neovim run the following
"			Plugins are installed from remote git repository. Names without a url
"			are just installed from https://github.com/*/*.git 
func! InstallPluginManager()
	:!sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' 
endfu
com! InstallPluginManager call InstallPluginManager()

call plug#begin()
"" Syntax
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"" Utils
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'dhruvasagar/vim-table-mode' 
Plug '9mm/vim-closer'
"" Sugar
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'vim-airline/vim-airline'
" Plug 'lifepillar/gruvbox8'
Plug 'morhetz/gruvbox'
call plug#end()
" }}}
" Plugin Configuration: {{{
filetype plugin on
let g:airline_theme = 'dracula'

set pyxversion=3
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

"let g:instant_markdown_autostart = 0
let g:instant_markdown_mathjax = 1
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
let g:instant_markdown_browser = "qutebrowser"

let g:table_mode_corner='|'

let g:netrw_banner=0
let g:netrw_liststyle=3

"}}}
" Config: {{{
colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE

set number
set relativenumber
set autoread
set mouse=a
set showcmd
set ft=dosini
set shiftwidth=3
set tabstop=3 softtabstop=3
set noexpandtab
set showmatch
set autoindent
set dir=~/.local/tmp
set undofile
set incsearch
set hidden
set path=.**

func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  setlocal spell spelllang=da
endfu
com! WP call WordProcessor()

autocmd FileType markdown WP
" }}}
" Maps: {{{
let mapleader = (" ")
" Exit terminal mode with ESC
tnoremap <Esc> <C-\><C-n>

vnoremap <C-S-c> "*y :let @+=@*<CR>
map <C-A-v> "+p

map <C-s> :write<CR>
map <F1> :12Lexplore<CR>
map <leader>ft :12Lexplore<CR>
map <leader>bf :b 
map <leader>bh :Startify<CR>
map <leader>bn :bNext<CR>
map <leader>ff :find ./
map <leader>fb :Ranger<CR>
map <leader>fd :FufDir<CR>

map <leader>ss :CocSearch 

map <leader>wn :tabnew<CR>
map <leader>wc :close<CR>
map <S-Tab> :tabNext<CR>
map <leader>ws :split<CR>
map <leader>wv :vsplit<CR>
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv 
" }}}
" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:

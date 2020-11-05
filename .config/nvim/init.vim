" Plugins: {{{
" To install vim-plug plugin manager for neovim run the following
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"			Plugins are installed from remote git repository. Names without a url
"			are just installed from https://github.com/*/*.git

call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/L9' "Dependency of Fzf
Plug 'vim-scripts/FuzzyFinder'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
" Plug 'francoiscabrol/ranger.vim'
" Plug 'rbgrouleff/bclose.vim' " Dependency of ranger,vim
call plug#end()
" }}}

" Plugin Configuration: {{{
colorscheme dracula
hi Normal guibg=NONE ctermbg=NONE
let g:airline_theme='dracula'

let g:ranger_map_keys = 0

"	}}}

" Sets: {{{
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
set noswapfile
set nobackup
set undofile
set incsearch
set hidden
" }}}

" Maps: {{{
let mapleader = (" ")
" Exit terminal mode with ESC
tnoremap <Esc> <C-\><C-n>

vnoremap <C-c> "*y :let @+=@*<CR>
map <C-P> "+p

map <C-s> :write<CR>
map <F1> :NERDTreeToggle<CR>
map <leader>bf :FufBuffer<CR>
map <leader>bh :Startify<CR>
map <leader>ff :FufFile<CR>
map <leader>fb :Ranger<CR>
map <leader>fd :FufDir<CR>

map <leader>wn :tabnew<CR>
map <S-Tab> :tabNext<CR>
map <leader>ws :split<CR>
map <leader>wv :vsplit<CR>
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>


" }}}
" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:

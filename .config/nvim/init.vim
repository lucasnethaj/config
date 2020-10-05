" Plugins: {{{
" To install vim-plug plugin manager for neovim run the following
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"			Plugins are installed from remote git repository. Names without a url
"			are just installed from https://github.com/*/*.git

call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neomake/neomake'
Plug 'dense-analysis/ale'
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
call plug#end()
" }}}

" Plugin Configuration: {{{
colorscheme dracula
let g:airline_theme='dracula'

let g:ale_fixers = {
  \   'javascript': [
  \       'eslint',
  \       {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
  \   ],
  \}

let g:ale_completion_enabled = 1
let g:vcoolor_disable_mappings = 1
let g:vcoolor_map = '<S-M-c>'
let g:vcoolor_custom_picker = 'zenity --title "VimColor" --color-selection --color '
"	}}}

" Options: {{{
set number
set relativenumber
set autoread
set mouse=a
set showcmd
set ft=dosini
set shiftwidth=3
set tabstop=3
set noexpandtab
set showmatch
let mapleader = (" ")


if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

if has('automcmd')
" Only do this part when compiled with support for autocommands.  if has("autocmd") 
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
" }}}

" Maps: {{{
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-P> "+p

map <C-s> :write<CR>
map <F1> :NERDTreeToggle<CR>
map <leader>bf :FufBuffer<CR>
map <leader>bh :Startify<CR>
map <leader>ff :FufFile<CR>
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

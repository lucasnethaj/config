" PLUGINS
" To install vim-plug plugin manager for neovim run the following
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

call plug#begin()
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neomake/neomake'
Plug 'dense-analysis/ale'
Plug 'https://github.com/lambdalisue/suda.vim.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim',{'as':'dracula'}
call plug#end()

" Plugin Configuration
colorscheme dracula
let g:airline_theme='dracula'

let g:ale_fixers = {
  \   'javascript': [
  \       'eslint',
  \       {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
  \   ],
  \}

" Configuration
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

vnoremap <C-c> "*y :let @+=@*<CR>
map <C-P> "+p

map <C-s> :w<CR>
map <C-Tab> :tabNext<CR>

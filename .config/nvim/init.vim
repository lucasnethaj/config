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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" Plug 'neovim/nvim-lspconfig'
"" Utils
Plug 'tpope/vim-speeddating'
Plug 'dart-lang/dart-vim-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'dhruvasagar/vim-table-mode' 
Plug '9mm/vim-closer'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

let g:table_mode_corner='|'

let g:netrw_banner=0
let g:netrw_liststyle=3

set rtp+=~/usr/bin/fzf

"}}}
" Config: {{{
colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE

set clipboard+=unnamedplus
set number
set relativenumber
set autoread
set mouse=a
set showcmd
set ft=dosini
set shiftwidth=4
" set tabstop=3
set preserveindent 
" set copyindent noexpandtab
" set autoindent
set showmatch
set dir=~/.local/tmp
set undofile
set incsearch
set hidden
set path=.**

func! WordProcessor()
  " movement changes
	map <silent> <leader>o :!openaspdf %<cr><cr>
	map <silent> <leader>c :!compiletopdf %<cr><cr>
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  setlocal spell spelllang=da
	
	fu! Compile()
		pandoc -tpdf -o %:r.pdf %
	endfu
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

" Navigation Files & buffers
map <F1> :12Lexplore<CR>
map <leader>ft :12Lexplore<CR>
map <leader>bf :b 
map <leader>bh :Startify<CR>
" map <leader>ff :find ./
map <leader>ff :FZF!<CR>
map <leader>fb :Buffers!<CR>

noremap <C-A-j> :bnext<CR>
noremap <C-A-k> :bprevious<CR>
noremap <C-A-l> :tabnext<CR>
noremap <C-A-h> :tabprevious<CR>

map <leader>tu :UndotreeToggle<CR>

map <leader>ss :CocSearch 

"Windows
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

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv 

" Go-to code definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnorema <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>p

"Navigation }}}
" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:

" File: /Users/jbec/.vimrc
" Author: Jacob Benjamin Cholewa <jacob@cholewa.dk>
" Date: 28.09.2017
" Last Modified Date: 28.09.2017
" Last Modified By: Jacob Benjamin Cholewa <jacob@cholewa.dk>

" Vim-Plug {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'alpertuna/vim-header'
Plug 'tomlion/vim-solidity'
call plug#end()
" }}}
" Set definitions {{{

filetype plugin indent on
syntax on

set expandtab
set foldmethod=marker
set foldlevel=0
set cursorline
set shiftwidth=4
set tabstop=4
set splitbelow
set splitright
set mouse=a
set showmatch
set nu

" }}}
" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_solidity_checkers = ['solc']

" }}}
" NERDTree {{{
map <C-l> :NERDTreeToggle<CR>
" }}}
" Styling {{{
if has("gui_running")
	set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h14
	"colorscheme sonofobsidian
	colorscheme hybrid_reverse
	set antialias
else
	colorscheme hybrid_reverse
endif
" }}}
" Hotkeys {{{
nmap <F3> :SyntasticToggleMode<cr>
nmap <F6> :set spell spelllang=en_us<cr>:set complete+=k<cr>
" }}}
" Airline {{{
	let g:airline_powerline_fonts=1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t'
	let g:airline#extensions#syntastic#enabled = 1
	let g:airline_detect_spell=1
	" }}}
" Header {{{
let g:header_field_author = 'Jacob Benjamin Cholewa'
let g:header_field_author_email = 'jacob@cholewa.dk'
let g:header_field_filename = 1
let g:header_alignment = 0
" }}}

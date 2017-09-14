"Vundle setup {{{
"set nocompatible "Required by vundle
execute pathogen#infect()
filetype off "Required by vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Vundle packages

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'pangloss/vim-javascript'
Plugin 'xuhdev/SingleCompile'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-scala'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'leafgarland/typescript-vim'
Plugin 'MisanthropicBit/vim-analog'


call vundle#end()
" }}}
" Vim-plug setup {{{
function! DoRemote(arg)
	UpdateRemotePlugins
endfunction

call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
call plug#end()
"}}}
" Set definitions {{{
filetype plugin indent on
syntax on
set backspace=indent,eol,start
set noexpandtab
set shiftwidth=4
set tabstop=4
set hidden
set wildmenu
set showcmd
set mouse=a
set smartindent
set smarttab
set showmatch
set foldmethod=marker
set foldlevel=0
set cursorline
set guioptions-=L
set guioptions-=r
set splitbelow
set splitright
set nu
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

let g:analog#prefer_symbols = 0

" }}}
" Hotkeys {{{
"Mapping Ctrl-c to Esc for propper escape
:ino <C-C> <Esc>

" F hotkeys
nmap <F3> :SyntasticToggleMode<cr>
nmap <F6> :set spell spelllang=en_us<cr>:set complete+=k<cr>
nmap <F7> :SCCompileRunAsync<cr>
nmap <F8> :SCViewResultAsync<cr>
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

" Tab navigation hotkeys
nmap <C-h> :tabn<cr>
nmap <C-j> :tabp<cr>
nmap <C-k> :tabonly<cr>

function! RemoveFolds()
	:%s/^.*{{{.*$//g
	:%s/^.*}}}.*$//g
	:g/^$/d
endfunction
" }}}
" Syntactic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_tex_checkers=['chktex']
let g:syntastic_typescript_checkers=['tslint']
" }}}
" NERDTree {{{
" No idea what this does, but related to NEADTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-l> :NERDTreeToggle<CR>

" Start NERDTree and go to previous (last accessed) window.
" autocmd VimEnter * NERDTree | wincmd p

augroup NERDTree
	autocmd WinEnter * call s:CloseNerdTreeIfOnlyWindow()
augroup END

" Automatically close the NERDTree file explorer window
" if it is the only window left
" Credit: https://github.com/scrooloose/nerdtree/issues/21
function! s:CloseNerdTreeIfOnlyWindow()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction

" }}}
" Airline {{{

" Setting up antialising for text, nicer font and default colorsheme
if has("gui_running")
	set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h14
	"colorscheme sonofobsidian
	colorscheme hybrid_reverse
	set antialias
else
	colorscheme hybrid_reverse
endif

let g:airline_powerline_fonts=1

:set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#syntastic#enabled = 1
let g:airline_detect_spell=1
" }}}
" deoplete {{{
if has('nvim')
	let g:deoplete#enable_at_startup = 1
endif
"}}}

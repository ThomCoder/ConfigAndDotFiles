""""""""""""""""""""""""""""""""
"Vimrc
""""""""""""""""""""""""""""""""
"developed using the following as guideline
"https://github.com/linluk/my-dot-files/blob/master/vimrc
"https://github.com/amacgregor/dot-files/blob/master/vimrc

""""""""""""""""""""""""""""""""
" General Vim switches
""""""""""""""""""""""""""""""""
let mapleader =" "

set modifiable
filetype plugin on
syntax on
set number relativenumber
" Explicitly enable autocomplete as its off by default
set wildmode=longest,list,full
set nocompatible
set splitbelow splitright
set hlsearch
set scrolloff=10
set autoread

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" Shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Copy text to clipboard
" NOTE: This requires gvim, nvim or vim-X11
vnoremap <C-c> "+y
map <C-p> "+P


""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged/')

" Utility
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
	if executable("ctags") != 1
		echo "ctags not found in path"
	endif
Plug 'godlygeek/tabular'
" Plug 'jeetsukumaran/vim-buffergator'
Plug 'gilsondev/searchtasks.vim'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'

" Generic Programming Support
Plug 'Townk/vim-autoclose'
Plug 'tomtom/tcomment_vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe'

" Colortheme
Plug 'morhetz/gruvbox'
call plug#end()

""""""""""""""""""""""""""""""""
" Macros and keymaps
""""""""""""""""""""""""""""""""

" if i have wraped lines i want to go to next/previous visual line
" not next/previous physical line!
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Enable highlighting of the current line
set cursorline

" Always display the status line
set laststatus=2

" Theme and Styling
set t_Co=256
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

let g:gruvbox_italic  = 1
colorscheme gruvbox

let base16colorspace=256  " Access colors present in 256 colorspace

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
map <leader>s :SyntasticCheck \| set linebreak<CR>
map <leader>S :SyntasticToggleMode \| set linebreak<CR>

" force myself to use hjkl!
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
vnoremap <Up>    <NOP>
vnoremap <Down>  <NOP>
vnoremap <Left>  <NOP>
vnoremap <Right> <NOP>

" Shortcut for Goyo
map <leader>g :Goyo \| set linebreak<CR>

" Shortcut for Nerdtree
map <leader>n :NERDTreeFind \| set linebreak<CR>
map <leader>N :NERDTreeClose \| set linebreak<CR>

" Short cut for Tagbar
nmap <leader>t :TagbarOpenAutoClose <CR>

" SearchTasks shortcut and config
map <leader>m :SearchTasks . \| set linebreak<CR>
let g:searchtasks_list=["TODO", "FIXME", "NOTE", "HACK", "BUG"]

" Config and shortcuts for YCM
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'


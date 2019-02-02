""""""""""""""""""""""""""""""""
"Vimrc
""""""""""""""""""""""""""""""""
"developed using the following as guideline
"https://github.com/linluk/my-dot-files/blob/master/vimrc
"https://github.com/amacgregor/dot-files/blob/master/vimrc

" how to install vim plugins:
"   mkdir ~/.vim/tmp
"   mkdir ~/.vim/tmp/backup
"   mkdir ~/.vim/tmp/undo
"   mkdir ~/.vim/tmp/swap
"   mkdir ~/.vim/bundle
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"   vim
"   :PluginInstall
" done.
"

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

" vundle needs filtype plugins off
" turn them back on later
filetype plugin indent off

" =====================================
" set runtimepath for vundle
set rtp+=~/.vim/bundle/Vundle.vim

" start vundle environment
" the default is ~/.vim/bundle
call vundle#begin()

" let Vundle manage Vundle (this is required)
Plugin 'VundleVim/Vundle.vim'

" to install a plugin add it here and run :PluginInstall.
" to update the plugins run :PluginInstall! or :PluginUpdate
" to delete a plugin remove it here and run :PluginClean

" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
	if executable("ctags") != 1
		echo "ctags not found in path"
	endif
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'gilsondev/searchtasks.vim'
Plugin 'junegunn/goyo.vim'

" Generic Programming Support 
Plugin 'Townk/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'

" Colortheme

call vundle#end() "required
filetype plugin indent on

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

let base16colorspace=256  " Access colors present in 256 colorspace

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

" Vim-Supertab Configuration
let g:SuperTabDefaultCompletionType = "<c-p>"

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

" Short cut for Tagbar
map <leader>t :TagbarOpenAutoClose \| set linebreak<CR>

" SearchTasks shortcut and config
map <leader>m :SearchTasks . \| set linebreak<CR>
let g:searchtasks_list=["TODO", "FIXME", "NOTE", "HACK", "BUG"]

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
Plugin 'scrooloose/nerdtree' " TODO: Map key
Plugin 'majutsushi/tagbar' " TODO: Map key
	if executable("ctags") != 1
		echo "ctags not found in path"
	endif
Plugin 'ervandew/supertab'
Plugin 'wesQ3/vim-windowswap' " TODO: Map key
Plugin 'SirVer/ultisnips'
Plugin 'junegunn/fzf.vim'
	if executable("fzf") != 1
		echo "fzf not found in path"
	endif
Plugin 'godlygeek/tabular'
Plugin 'jeetsukumaran/vim-buffergator' " TODO: Map key
Plugin 'gilsondev/searchtasks.vim' " TODO: Map key and setup keyword list
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'tpope/vim-dispatch'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'

" Generic Programming Support 
" Plugin 'honza/vim-snippets'
Plugin 'Townk/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
" Plugin 'janko-m/vim-test'
Plugin 'maksimr/vim-jsbeautify' " Requires js-beautify (from npm); TODO: Map key
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
" Plugin 'neomake/neomake'

" Markdown / Writting
" Plugin 'reedes/vim-pencil'
" Plugin 'tpope/vim-markdown'
" Plugin 'jtratner/vim-flavored-markdown'
" Plugin 'LanguageTool'

" Git Support
" Plugin 'kablamo/vim-git-log'
" Plugin 'gregsexton/gitv'
" Plugin 'tpope/vim-fugitive'
" Plugin 'jaxbot/github-issues.vim'

Plugin 'ajh17/Spacegray.vim'

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

" use H as page down and L as page up.
noremap H <PageDown>zz
noremap L <PageUp>zz

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
colorscheme spacegray

let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

" Vim-Supertab Configuration
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Vim-UltiSnips Configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

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

function! AddCHeader() "{{{2
  let l:def = "__" . toupper(substitute(expand("%:t"), '\.', "_", "")) . "__"
  let l:header =
    \ "#ifndef " . l:def . "\n" .
    \ "#define " . l:def . "\n\n\n" .
    \ "#endif /* " . l:def . " */"
  return l:header
endfunction


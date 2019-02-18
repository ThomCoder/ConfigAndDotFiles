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
Plug 'ervandew/supertab'
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
Plug 'wesleyche/SrcExpl'

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
map <leader>N :NERDTreeClose \| set linebreak<CR>

" Short cut for Tagbar
nmap <leader>t :TagbarOpenAutoClose <CR>

" SearchTasks shortcut and config
map <leader>m :SearchTasks . \| set linebreak<CR>
let g:searchtasks_list=["TODO", "FIXME", "NOTE", "HACK", "BUG"]

" SrcExpl config and shortcuts
" The switch of the Source Explorer
nmap <F8> :SrcExplToggle<CR>
" Set the height of Source Explorer window
let g:SrcExpl_winHeight = 20
" Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100
" Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<F2>"
" Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"
" In order to avoid conflicts, the Source Explorer should know what plugins except
" itself are using buffers. And you need add their buffer names into below list
" according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]
" The color schemes used by Source Explorer. There are five color schemes
" supported for now - Red, Cyan, Green, Yellow and Magenta. Source Explorer
" will pick up one of them randomly when initialization.
let g:SrcExpl_colorSchemeList = [ "Green" ]
" Enable/Disable the local definition searching, and note that this is not
" guaranteed to work, the Source Explorer doesn't check the syntax for now.
" It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 0
" Workaround for Vim bug @https://goo.gl/TLPK4K as any plugins using autocmd for
" BufReadPre might have conflicts with Source Explorer. e.g. YCM, Syntastic etc.
let g:SrcExpl_nestedAutoCmd = 1
" Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0
" Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" create/update the tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
" Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>"
" Set "<F3>" key for displaying the previous definition in the jump list
let g:SrcExpl_prevDefKey = "<F3>"
" Set "<F4>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey = "<F4>"

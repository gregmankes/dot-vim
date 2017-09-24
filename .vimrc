" Main Stuff

" Makes sure distro does not interfere
set nocompatible

" Turn off filetype for vundle
filetype off

" Set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/nerdtree'

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'scrooloose/syntastic'

Plugin 'Shougo/neocomplete'

Plugin 'Shougo/neosnippet'

Plugin 'Shougo/neosnippet-snippets'

Plugin 'MarcWeber/vim-addon-mw-utils'

Plugin 'tomtom/tlib_vim'

Plugin 'garbas/vim-snipmate'

Plugin 'honza/vim-snippets'

call vundle#end()

" Attempt to determine the type of file based off of its name and contents
filetype plugin indent on

" To ignore plugin indent changes, instead use:
" filetype plugin on
" 
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" 
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
     let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'


" Enable syntax highlighting
syntax on

"Enable color scheme 

if has('gui_running')
    colorscheme molokai
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
    let g:nerdtree_tabs_open_on_gui_startup = 0
endif
"----------------------------------------------------------------------------
" Must have stuff

" Better command line completion
set wildmenu

" show partial commands on the last line of the screen
set showcmd

" Highlight searches, <C-L> to temporarily turn off highlighting
set hlsearch

"----------------------------------------------------------------------------

" Usability

" Case insensitive search
set ignorecase
set smartcase

" Allow Backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype specific indenting enabled,
" keep the same indent as the line you're on
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell
"  
"  And reset the terminal code for the visual bell. If visualbell is set,
"  and
"  this line is also included, vim will neither flash nor beep. If
"  visualbell
"  is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines
set cmdheight=2

" Turn on line numbers
set number

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Resource .vimrc after saving
augroup source-vimrc
    autocmd!
    autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
    autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

"------------------------------------------------------------------------------
" Mappings

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
map <C-n> :NERDTreeTabsToggle<CR>

"------------------------------------------------------------------------------
" Neocomplete

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_auto_close_preview = 1
"
call neocomplete#custom#source('_', 'sorters', ['sorter_rank'])
"
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
"For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"
"         " <C-h>, <BS>: close popup and delete backword char.
"         "inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"         inoremap <expr><C-y>  neocomplete#close_popup()
"         inoremap <expr><C-e>  neocomplete#cancel_popup()
"
"Enable snipmate compatibility
let g:neosnippet#enable_snipmate_compatibility = 1
" Set snippets directory
let g:neosnippet#snippets_directory = '~/.vim/snippets'
"


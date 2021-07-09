" reset to vim-defaults
if &compatible          " only if not set before:
  set nocompatible      " use vim-defaults instead of vi-defaults (easier, more user friendly)
endif

" display settings
set background=dark     " enable for dark terminals
set nowrap              " dont wrap lines
set scrolloff=3         " 2 lines above/below cursor when scrolling
set number              " show line numbers
set showmatch           " show matching bracket (briefly jump)
set showmode            " show mode in status bar (insert/replace/...)
set showcmd             " show typed command in status bar
set ruler               " show cursor position in status bar
set title               " show file in titlebar
set wildmenu            " completion with menu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set laststatus=2        " use 2 lines for the status bar
set matchtime=2         " show matching bracket for 0.2 seconds
set matchpairs+=<:>     " specially for html
set list
set listchars=tab:>-

" editor settings
set esckeys             " map missed escape sequences (enables keypad keys)
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters
set smartindent         " smart auto indenting
set smarttab            " smart tab handling for indenting
set magic               " change the way backslashes are used in search patterns
set bs=indent,eol,start " Allow backspacing over everything in insert mode

set tabstop=4           " number of spaces a tab counts for
set shiftwidth=4        " spaces for autoindents
set expandtab           " turn a tabs into spaces

set textwidth=132       " automatically break (comment) lines after 132 characters
"set fo-=l              " see formatoptions for details

"set fileformat=unix     " file mode is unix
set fileformats=unix,dos    " only detect unix file format, displays that ^M with dos files

" system settings
set lazyredraw          " no redraws in macros
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500
set hidden              " remember undo after quitting
set history=50          " keep 50 lines of command history
set mouse=v             " use mouse in visual mode (not normal,insert,command,help mode
set splitright          " vsplit opens on right
set updatetime=200      " delay before swp file is written (and gitgutter updates)


" color settings (if terminal/gui supports it)
if &t_Co > 2 || has("gui_running")
  syntax on          " enable colors
  set hlsearch       " highlight search (very useful!)
  set incsearch      " search incremently (search while typing)
endif

nnoremap <F6> :tabe
nnoremap <F7> :tabp<CR>
nnoremap <F8> :tabn<CR>
nnoremap <F10> :vsplit
nnoremap <F11> <C-w>h
nnoremap <F12> <C-w>l
nnoremap s "_d
nnoremap ss "_dd

autocmd Syntax fortran syn match fortranOpenMP excludenl "!\$.*$"

set t_Co=256
set colorcolumn=132
highlight ColorColumn ctermbg=darkgray

" PLUGINS
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/real/config/.vim/plugged')

Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'kien/rainbow_parentheses.vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" vim-indent-guides Settings
"hi IndentGuidesOdd  ctermbg=darkgrey
"hi IndentGuidesEven ctermbg=darkgrey
"let g:indent_guides_guide_size = 1
"let g:indent_guides_enable_on_vim_startup = 1

" indentLine Settings

" vim-airline Settings
let g:airline#extensions#tabline#enabled = 1
"let g:airline_section_z = airline#section#create_right(['%{&fo}'])
let g:airline_powerline_fonts = 1

" vim-devicons Settings
set encoding=UTF-8

" rainbow_parentheses Settings
let g:rbpt_colorpairs = [
    \ ['red',         'firebrick3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


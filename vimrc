" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather than Vi settings.  This setting must be as early as
" possible, as it has side effects
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'haya14busa/incsearch.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'https://github.com/christoomey/vim-tmux-runner'
Plugin 'christoomey/vim-run-interactive'
" Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'andviro/flake8-vim'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'

" All plugins must be added before the following line
call vundle#end()

syntax enable
let g:colarized_termtrans=1
let g:solarized_visibility="high"
let g:solarized_contrast="high"
set t_Co=256
set background=dark
colorscheme solarized
let g:airline_powerline_fonts=1

map <C-t> :NERDTreeToggle %<CR>
let g:NERDTreeWinSize    = 50     " Default NERDTree window size
let g:NERDTreeQuitOnOpen = 1      " Close NERDTree window after opening file

let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,frosted'

set backspace=2    " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile     " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler          " show the cursor position all the time
set showcmd        " display incomplete command
set laststatus=2   " always display the status line
set autowrite      " automatically :write before running commands
set autoread       " reload files changed outside of vim
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

set cursorline     " highlight the current line
set wildmenu
set wildmode=list:longest,full

" Make searching better
set gdefault       " no need to type /g at the end of search / replace
set ignorecase     " case insensitive searching (unless specified)
set smartcase      " If a search term contains an upper case letter then that is used

set hlsearch    
nnoremap <silent> <leader>, :noh<cr> " Stop highlighting after searching
set incsearch
set showmatch

set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
set textwidth=80
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitright

" Auto resize Vim splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

" Scrolling

set scrolloff=8    " Start scrolling when we're 8 lines away from the margins
set sidescrolloff=15
set sidescroll=1

" Toggle
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" Use ener to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>
"Below is to fix issues with the ABOVE mappings in quickfix window
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif

" Load up plugins
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
end

filetype plugin indent on
set guifont=Liberation\ Mono\ for\ Powerline\ 10

nnoremap <C-n> :noh<CR>


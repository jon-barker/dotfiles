" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather than Vi settings.  This setting must be as early as
" possible, as it has side effects
set nocompatible
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vundle plugins
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'https://github.com/christoomey/vim-tmux-runner'
Plugin 'christoomey/vim-run-interactive'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plugin 'davidhalter/jedi-vim'
Plugin 'fs111/pydoc.vim'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

" All plugins must be added before the following line
call vundle#end()

" tagbar
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarOpen j<CR>

" Apprentice colorscheme
syntax enable
let g:colarized_termtrans=1
set t_Co=256
set background=dark
colorscheme apprentice

" Pydoc
let g:pydoc_window_lines=0.5

" Map leader to TAB
let mapleader = "\<tab>"
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'"
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" NERDTree file browser
map <C-t> :NERDTreeToggle %<CR>
let g:NERDTreeWinSize    = 50      " Default NERDTree window size
let g:NERDTreeQuitOnOpen = 1       " Close NERDTree window after opening file
autocmd VimEnter * set winfixwidth " Fixes a resizing issue when open/close NERDTree

" PyFlake
"map <C-P> :PyFlake<CR>
"let g:PyFlakeOnWrite = 0
"let g:PyFlakeCheckers = 'pep8,mccabe,frosted'

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
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
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

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" Use enter to create new lines w/o entering insert mode
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
filetype plugin on

nnoremap <C-n> :noh<CR>
map ,t :FZF ~<CR>

" Prevent JEDI from doing suggestions on typing a .
let g:jedi#popup_on_dot = 0

set completeopt-=preview

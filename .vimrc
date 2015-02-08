set term=builtin_ansi
set backspace=indent,eol,start


set nocompatible
filetype off

" Setting up Vundle - the vim plugin manager
let installVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let installVundle=0
endif
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic' "Syntax checking
Plugin 'tpope/vim-sensible' "Sensible vim
"Plugin 'nachumk/systemverilog.vim'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe' "YouCompleteMe autocomplete
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'powerline/powerline'
Plugin 'sjl/badwolf' "Bad wolf coloring scheme
Plugin 'tomasr/molokai' "Molokai coloring scheme
Plugin 'chriskempson/base16-vim' "Base 16 coloring scheme
if installVundle == 0
    echo "Installing plugins, please ignore key map error messages"
    :PluginInstall
endif
call vundle#end()
filetype plugin indent on
set nocp

"Enable badwolf
let g:badwolf_darkgutter = 1
let g:badwolf_css_props_highlight = 1

if has("syntax")
  syntax on
endif

" Snipmate mapping
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" Settings for YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui=0

" Airline theme
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

set ignorecase
set hlsearch
nnoremap <CR> :noh<CR><CR>

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

set history=700
set clipboard=unnamedplus

set tabstop=4
set shiftwidth=4
set expandtab

"No error sounds
set novisualbell
set noerrorbells
set t_vb=
set tm=50

" Auto indent
set ai

" Smart indent
set si

" Colorscheme and syntax highlighting
syntax enable "Not really needed
set term=screen-256color
set t_Co=256
let g:badwolf_termcolors=256
set background=dark
colorscheme molokai

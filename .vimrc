set number
set nobackup
set noundofile
set noswapfile
set tabstop=2
set smartindent
set formatoptions=q
set expandtab
set shiftwidth=2

syntax on

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ` ``<LEFT>

let g:indent_guides_enable_on_vim_startup = 1

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tomasr/molokai'
NeoBundleLazy 'Shougo/neosnippet'
NeoBundleLazy 'basyura/unite-rails'
NeoBundleLazy 'taka84u9/vim-ref-ri'
NeoBundleLazy 'alpaca-tc/neorspec.vim'
NeoBundleLazy 'alpaca-tc/alpaca_tags'
NeoBundleLazy 'tsukkee/unite-tag'
NeoBundleLazy 'alpaca-tc/vim-endwise.git'
call neobundle#end()

filetype plugin indent on
NeoBundleCheck

autocmd ColorScheme * highlight Visual ctermbg=22

colorscheme molokai

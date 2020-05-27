set number
set nobackup
set noundofile
set noswapfile
set tabstop=2
set smartindent
set formatoptions=q
set expandtab
set shiftwidth=2
set backspace=indent,eol,start
syntax on

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
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'leafgarland/typescript-vim'
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

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

inoremap <silent> <CR> <C-r>=<SID>custom_cr_function()<CR>
function! s:custom_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

" GrepCount
nnoremap <expr> / _(":%s/<Cursor>/&/gn")

function! s:move_cursor_pos_mapping(str, ...)
    let left = get(a:, 1, "<Left>")
    let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
    return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction

function! _(str)
    return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction
" GrepCount

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight Visual ctermbg=DarkMagenta
autocmd ColorScheme * highlight Comment ctermfg=DarkCyan

colorscheme molokai

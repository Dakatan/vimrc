set number
set nobackup
set noundofile
set noswapfile
set tabstop=2
set smartindent
set formatoptions=q
set shiftwidth=2
set backspace=indent,eol,start
set splitbelow

let g:indent_guides_enable_on_vim_startup = 1

""" Start dein scripts
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  let g:dein#cache_directory = $HOME . '/.cache/dein'
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  let s:toml_dir  = $HOME . '/.vim/dein'
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

let g:acp_enableAtStartup = 0

""" GrepCount
nnoremap <expr> / _(":%s/<Cursor>/&/gn")
function! s:move_cursor_pos_mapping(str, ...)
  let left = get(a:, 1, "<Left>")
  let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
  return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction
function! _(str)
  return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction

""" LSP Setting
nmap <silent> gd :LspDefinition<CR>
nmap <silent> <f2> :LspRename<CR>
nmap <silent> <Leader>d :LspTypeDefinition<CR>
nmap <silent> <Leader>r :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>
let g:asyncomplete_popup_delay = 200

""" Whitespace ignore list
let g:extra_whitespace_ignored_filetypes = ['unite']

""" Winresizer Setting
let g:winresizer_start_key = '<C-T>'

""" Toggle window Setting
let g:toggle_window_size = 0
function! ToggleWindowSize()
  if g:toggle_window_size == 1
    exec "normal \<C-w>="
    let g:toggle_window_size = 0
  else
    :resize
    :vertical resize
    let g:toggle_window_size = 1
  endif
endfunction
nnoremap M :call ToggleWindowSize()<CR>

""" Complete setting
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<Left>
inoremap [<Enter> []<Left><CR><ESC><S-o>

nnoremap <silent> [b :bprev<CR>
nnoremap <silent> [n :bnext<CR>

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight Visual ctermbg=DarkMagenta
autocmd ColorScheme * highlight Comment ctermfg=DarkCyan

colorscheme molokai

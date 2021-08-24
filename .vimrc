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
set splitright
set laststatus=2

""" Language
let $LANG="en"

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

""" Grep count
nnoremap <expr> / _(":%s/<Cursor>/&/gn")
function! s:move_cursor_pos_mapping(str, ...)
  let left = get(a:, 1, "<Left>")
  let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
  return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction

function! _(str)
  return s:move_cursor_pos_mapping(a:str, "\<Left>")
endfunction

""" LSP setting
nnoremap <expr> <silent> <C-]> execute(':LspDefinition') =~ "not supported" ? "\<C-]>" : ":echo<CR>"
nnoremap <silent> td :LspDefinition<CR>
nnoremap <silent> tn :LspRename<CR>
nnoremap <silent> tt :LspTypeDefinition<CR>
nnoremap <silent> tr :LspReferences<CR>
nnoremap <silent> ti :LspImplementation<CR>
nnoremap <silent> tf :LspDocumentFormat<CR>
let g:asyncomplete_popup_delay = 200
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"
imap <Nul> <C-Space>
imap <C-Space> <Plug>(asyncomplete_force_refresh)
autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

""" Whitespace ignore list
let g:better_whitespace_filetypes_blacklist = ['git', 'unite', 'denite', 'help', 'defx', '']

""" Winresizer setting
let g:winresizer_start_key = '<C-T>'

""" Toggle window setting
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

""" Custom command
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <silent> [b :bprev<CR>
nnoremap <silent> [n :bnext<CR>
nnoremap <silent> zz :Defx<CR>
inoremap <silent> jj <ESC>

""" Defx setting
let g:defx_icons_column_length = 2
autocmd BufWritePost * call defx#redraw()
autocmd BufEnter * call defx#redraw()
call defx#custom#option('_', {
    \ 'direction': 'topleft',
    \ 'buffer_name': 'exlorer',
    \ 'show_ignored_files': 1,
    \ 'columns': 'indent:git:icons:filename:mark',
    \ 'resume': 1,
    \ })
call defx#custom#column('git', 'indicators', {
    \ 'Modified'  : '✹',
    \ 'Staged'    : '✚',
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Ignored'   : '☒',
    \ 'Deleted'   : '✖',
    \ 'Unknown'   : '?'
    \ })

""" Denite setting
nnoremap <silent> [g :Denite ghq<CR>

""" Vim test settings
let test#strategy = "vimproc"

""" Color setting
let g:airline_theme = 'papercolor'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#enabled = 1
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight Visual ctermbg=DarkMagenta
autocmd ColorScheme * highlight Comment ctermfg=DarkCyan
autocmd ColorScheme * highlight CursorColumn ctermfg=LightGreen
colorscheme molokai

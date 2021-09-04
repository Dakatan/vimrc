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
set termguicolors
set autoindent
set copyindent

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

""" Lsp setting
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"
nnoremap <expr> <C-k> lsp#scroll(-6)
nnoremap <expr> <C-j> lsp#scroll(+6)
inoremap <expr> <C-k> pumvisible() ? lsp#scroll(-6) : "\<C-k>"
inoremap <expr> <C-j> pumvisible() ? lsp#scroll(+6) : "\<C-j>"
nnoremap <expr> <silent> <C-]> execute(':LspDefinition') =~ "not supported" ? "\<C-]>" : ":echo<CR>"
nnoremap <silent> td :LspDefinition<CR>
nnoremap <silent> tn :LspRename<CR>
nnoremap <silent> tt :LspTypeDefinition<CR>
nnoremap <silent> tr :LspReferences<CR>
nnoremap <silent> ti :LspImplementation<CR>
nnoremap <silent> tf :LspDocumentFormat<CR>
nnoremap <silent> th :LspHover<CR>
nnoremap <silent> ta :LspCodeAction<CR>
nnoremap <silent> tg :LspDocumentDiagnostics<CR>
let g:asyncomplete_popup_delay = 200
imap <Nul> <C-Space>
imap <C-Space> <Plug>(asyncomplete_force_refresh)
autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))
if has('nvim')
  function! NvimSetCustomConfig(winid)
    if a:winid | call nvim_win_set_config(a:winid, {'border': 'rounded'}) | endif
  endfunction
  autocmd User lsp_float_opened call NvimSetCustomConfig(lsp#ui#vim#output#getpreviewwinid())
else
  autocmd User lsp_float_opened call popup_setoptions(lsp#ui#vim#output#getpreviewwinid(), {
    \ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
    \ })
endif

""" Whitespace setting
let g:better_whitespace_filetypes_blacklist = ['git', 'unite', 'denite', 'help', 'defx', '']

""" Winresizer setting
let g:winresizer_start_key = '<C-T>'

""" Git Messager setting
nnoremap <silent> <C-g>m :GitMessenger<CR>
nnoremap <silent> <C-g>c :GitMessengerClose<CR>

""" IndentLine setting
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

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
let test#strategy = "floaterm"
nnoremap <silent> tN :TestNearest<CR>
nnoremap <silent> tF :TestFile<CR>
nnoremap <silent> tS :TestSuite<CR>
nnoremap <silent> tL :TestLast<CR>
nnoremap <silent> tV :TestVisit<CR>

""" Floaterm settings
let g:floaterm_autoclose = 1
let g:floaterm_borderchars = "─│─│╭╮╯╰"
nnoremap <silent> fo :FloatermNew<CR>
nnoremap <silent> fp :FloatermPrev<CR>
nnoremap <silent> fn :FloatermNext<CR>
nnoremap <silent> ft :FloatermToggle<CR>
nnoremap <silent> fs :FloatermShow<CR>
nnoremap <silent> fh :FloatermHide<CR>

""" Caw settings
nmap <C-l> <Plug>(caw:zeropos:toggle)
vmap <C-l> <Plug>(caw:zeropos:toggle)

""" Custom command
nnoremap <silent> [b :bprev<CR>
nnoremap <silent> [n :bnext<CR>
nnoremap <silent> zz :Defx<CR>
nnoremap <silent> [w <C-w>
inoremap <silent> <C-i><C-i> <Esc>
vnoremap <silent> <C-i><C-i> <Esc>
tnoremap <silent> <C-i><C-i> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>

""" Custom toggle window setting
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

""" Custom change directory function
command! -nargs=? -complete=dir -bang CD call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
  if a:directory == ''
    lcd %:p:h
  else
    execute 'lcd' . a:directory
  endif
  if a:bang == ''
    pwd
  endif
endfunction

""" Custom change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>

""" Custom grep count
nnoremap <expr> / CustomGrep(":%s/<Cursor>/&/gn")
function! s:MoveCursorPosMapping(str, ...)
  let left = get(a:, 1, "<Left>")
  let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
  return substitute(a:str, '<Cursor>', '', '') . lefts
endfunction
function! CustomGrep(str)
  return s:MoveCursorPosMapping(a:str, "\<Left>")
endfunction

""" Treesitter setting
lua <<LUA
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
  },
}
LUA

""" Airline setting
let g:airline_theme = 'papercolor'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#denite#enabled = 1

""" Style setting
autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
autocmd ColorScheme * highlight LineNr ctermbg=none guibg=none
autocmd ColorScheme * highlight Visual ctermbg=DarkMagenta guibg=DarkMagenta
autocmd ColorScheme * highlight Comment ctermfg=DarkCyan guifg=DarkCyan
autocmd ColorScheme * highlight CursorColumn ctermfg=LightGreen guifg=LightGreen
autocmd ColorScheme * highlight Comment ctermfg=Gray guifg=Gray
autocmd ColorScheme * highlight FloatBorder ctermbg=none guibg=none
autocmd ColorScheme * highlight NormalFloat ctermbg=none guibg=none
autocmd ColorScheme * highlight Pmenu ctermbg=none guibg=none ctermfg=39 guifg=#E6FFE9
autocmd ColorScheme * highlight PmenuSbar ctermbg=none guibg=none
autocmd ColorScheme * highlight FloatermBorder ctermbg=none ctermfg=White guibg=none guifg=White
colorscheme molokai

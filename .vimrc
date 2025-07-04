let $VIM_HOME = fnamemodify(expand("$MYVIMRC"), ":p:h")

" Default settings
if !has('nvim')
    source $VIMRUNTIME/defaults.vim
endif

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" Appearance
set number
set cursorline
set lazyredraw
set showmatch
set matchtime=1
set display=lastline
set breakindent
set showbreak=>
set breakindentopt=shift:4,sbr
set nowrap
if has('emoji')
    set emoji
endif
set showtabline=2
if has('gui_running')
    set guifont=SFMono\ Nerd\ Font:h12
endif
set fillchars+=vert:\│
if v:version >= 802
    set fillchars+=eob:\ 
endif

" Mouse
set mouse=nvi

" Clipboard
set clipboard=unnamed,unnamedplus
if (!has('nvim') && !has('clipboard_working'))
    " In the event that the clipboard isn't working, it's quite likely that
    " the + and * registers will not be distinct from the unnamed register. In
    " this case, a:event.regname will always be '' (empty string). However, it
    " can be the case that `has('clipboard_working')` is false, yet `+` is
    " still distinct, so we want to check them all.
    let s:VimOSCYankPostRegisters = ['', '+', '*']
    function! s:VimOSCYankPostCallback(event)
        if (a:event.operator == 'y' || a:event.operator == 'd') && index(s:VimOSCYankPostRegisters, a:event.regname) != -1
            call OSCYankRegister(a:event.regname)
        endif
    endfunction
    augroup VimOSCYankPost
        autocmd!
        autocmd TextYankPost * call s:VimOSCYankPostCallback(v:event)
    augroup END
endif

" Searching
set hlsearch
set shortmess-=S
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

" Undo
if has('persistent_undo')
    set undofile
    set undodir=$VIM_HOME/.vim/undo
endif

" autoread
set autoread
augroup vimrc-checktime
    autocmd!
    autocmd CursorMoved * checktime
augroup END

" Window Navigation
nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer
set hidden  " allows to move between buffers without saving the current one

" HEX editor
augroup BinaryXXD
    autocmd!
    autocmd BufReadPre  *.bin let &binary =1
    autocmd BufReadPost * if &binary | silent %!xxd -g 1
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &binary | %!xxd -r | endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END

" indentLine
let g:indentLine_char = '│'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:vim_json_conceal = 0
let g:markdown_syntax_conceal = 0

" vim-code-dark
if has('termguicolors') && ($TERM =~ ".*256col.*" || $TERM == "alacritty")
    set termguicolors

    let g:codedark_modern=1
    colorscheme codedark
else
    set t_Co=256
    set t_ut=
    colorscheme codedark
endif

" Fern
let g:fern#renderer = "nerdfont"
let g:fern#default_hidden = 1
let g:fern#disable_default_mappings = 1
if executable('git')
    packadd fern-git-status.vim
endif

function! s:init_fern() abort
    setlocal nonumber
    let b:indentLine_enabled = 0
    let b:indentLine_leadingSpaceEnabled = 0

    " Define NERDTree like mappings
    nmap <buffer> o <Plug>(fern-action-open:edit)
    nmap <buffer> go <Plug>(fern-action-open:edit)<C-w>p
    nmap <buffer> t <Plug>(fern-action-open:tabedit)
    nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
    nmap <buffer> i <Plug>(fern-action-open:split)
    nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p
    nmap <buffer> s <Plug>(fern-action-open:vsplit)
    nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p
    nmap <buffer> ma <Plug>(fern-action-new-path)
    nmap <buffer> P gg
    nmap <buffer> C <Plug>(fern-action-enter)
    nmap <buffer> u <Plug>(fern-action-leave)
    nmap <buffer> r <Plug>(fern-action-reload)
    nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>
    nmap <buffer> cd <Plug>(fern-action-cd)
    nmap <buffer> CD gg<Plug>(fern-action-cd)<C-o>
    nmap <buffer> I <Plug>(fern-action-hidden-toggle)
    nmap <buffer> q :<C-u>quit<CR>
    nmap <buffer> D <Plug>(fern-action-remove)
    nmap <buffer> l <Plug>(fern-action-open-or-expand)
    nmap <buffer> h <Plug>(fern-action-collapse)
endfunction

augroup fern-custom
    autocmd! *
    autocmd FileType fern call s:init_fern()
augroup END

augroup my-fern-startup
    autocmd! *
    autocmd VimEnter * ++nested Fern . -drawer -stay
augroup END

" glyph-palette
augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
augroup END

" rainbow
let g:rainbow_active = 1

" swift.vim
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

" tcomment_vim
autocmd FileType prototxt call tcomment#type#Define('prototxt', '# %s')

" lightline
set laststatus=2
nmap <silent> <C-j> <Plug>lightline#bufferline#go_previous()
nmap <silent> <C-k> <Plug>lightline#bufferline#go_next()
nmap <silent> <leader>w <Plug>lightline#bufferline#go_previous():bd #<cr>

function LightlineBufferlineFilter(buffer)
      return getbufvar(a:buffer, '&buftype') !=# 'terminal'
endfunction

let g:lightline#bufferline#buffer_filter = "LightlineBufferlineFilter"
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#clickable = 1
let g:lightline#lsp#indicator_checking = "\uf110"
" let g:lightline#lsp#indicator_warning = "\uf071"
" let g:lightline#lsp#indicator_error = "\uf05e"
" let g:lightline#lsp#indicator_information = "\uf05a"
" let g:lightline#lsp#indicator_hint = "\uf0e5"
let g:lightline#lsp#indicator_ok = "\uf00c"
let g:lightline = {
    \ 'colorscheme': 'codedark',
    \ 'active': {
    \     'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified'], ['lsp_diag_count', 'lsp_diag_checking', 'lsp_diag_ok'], ['lsp_status_error', 'lsp_status_warning']],
    \ },
    \ 'tabline': {
    \     'left': [['buffers']],
    \     'right': [['close']]
    \ },
    \ 'component_expand': {
    \     'buffers': 'lightline#bufferline#buffers',
    \     'lsp_status_error': 'lightline#lsp#status_error',
    \     'lsp_status_warning': 'lightline#lsp#status_warning',
    \     'lsp_diag_checking': 'lightline#lsp#checking',
    \     'lsp_diag_ok': 'lightline#lsp#ok'
    \ },
    \ 'component_type': {
    \     'buffers': 'tabsel',
    \     'lsp_status_error': 'error',
    \     'lsp_status_warning': 'warning',
    \     'lsp_diag_checking': 'ok',
    \     'lsp_diag_ok': 'ok'
    \ },
    \ 'component_raw': {
    \     'buffers': 1
    \ },
    \ 'component_function': {
    \     'gitbranch': 'FugitiveHead',
    \     'lsp_diag_count': 'lightline#lsp#count'
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
    \ 'mode_map': {
    \     'n': 'N',
    \     'i': 'I',
    \     'R': 'R',
    \     'v': 'V',
    \     'V': 'VL',
    \     "\<C-v>": 'VB',
    \     'c': 'C',
    \     's': 'S',
    \     'S': 'SL',
    \     "\<C-s>": 'SB',
    \     't': 'T',
    \ }
    \ }

" vim-lsp
if executable('pyright-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyright',
        \ 'cmd': {server_info->['pyright-langserver', '--stdio']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('rust-analyzer')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'allowlist': ['rust'],
        \ })
endif

if executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'allowlist': ['swift'],
        \ })
endif

if executable('package-swift-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'package-swift-lsp',
        \ 'cmd': {server_info->['package-swift-lsp']},
        \ 'allowlist': ['swift'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go,*.swift call execute('LspDocumentFormatSync')

    " I want to use this, but disable it because of its performance
    " set foldmethod=expr
    "   \ foldexpr=lsp#ui#vim#folding#foldexpr()
    "   \ foldtext=lsp#ui#vim#folding#foldtext()

    let g:lsp_inlay_hints_enabled = 1
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" vim-gitgutter
if executable('rg')
    let g:gitgutter_grep = 'rg'
endif
set updatetime=100

" yaifa
let g:yaifa_tabstop = 4

" Optional plugins
autocmd FileType html,markdown packadd emmet-vim
autocmd FileType python packadd vim-python-pep8-indent
if executable('git')
    packadd vim-fugitive
    packadd vim-gitgutter
endif

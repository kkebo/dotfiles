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
if has('emoji')
    set emoji
endif
set showtabline=2
if has('gui_running')
    set guifont=SFMono\ Nerd\ Font:h12
endif

" Clipboard
set clipboard=unnamed,unnamedplus

" Searching
set hlsearch
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
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move cursor by display lines
noremap j gj
noremap k gk

" Buffer
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

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
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" material.vim or minimalist
if has('termguicolors')
    set termguicolors

    " tmux 24-bit color
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    let g:material_theme_style = 'dark'
    set background=dark
    colorscheme material
else
    set t_Co=256
    syntax on
    colorscheme minimalist
endif

" Fern
let g:fern#renderer = "nerdfont"
let g:fern#default_hidden = 1
let g:fern#disable_default_mappings = 1
nnoremap <leader>w :bp<cr>:bd #<cr>
if executable('git')
    packadd fern-git-status.vim
endif

function! s:init_fern() abort
    setlocal nonumber
    setlocal nowrap

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

" rainbow
let g:rainbow_active = 1

" swift.vim
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

" tcomment_vim
autocmd FileType prototxt call tcomment#type#Define('prototxt', '# %s')

" lightline
set laststatus=2

let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \     'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']]
    \ },
    \ 'tabline': {
    \     'left': [['buffers']],
    \     'right': [['close']]
    \ },
    \ 'component_expand': {
    \     'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \     'buffers': 'tabsel'
    \ },
    \ 'component_function': {
    \     'gitbranch': 'FugitiveHead'
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
if executable('jedi-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'jedi-language-server',
        \ 'cmd': {server_info->['jedi-language-server']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('rust-analyzer')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rust-analyzer',
        \ 'cmd': {server_info->['rust-analyzer']},
        \ 'whitelist': ['rust'],
        \ })
endif

if executable('xcrun')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['xcrun', 'sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
elseif executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> <f2> <plug>(lsp-rename)
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
autocmd FileType html packadd emmet-vim
autocmd FileType python packadd vim-python-pep8-indent
if executable('git')
    packadd vim-fugitive
    packadd vim-gitgutter
endif
packadd lightline.vim
packadd lightline-bufferline

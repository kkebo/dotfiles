let $VIM_HOME = fnamemodify(expand("$MYVIMRC"), ":p:h")
if has('ios') || has('mac')
    let lightweight = 0
else
    let uname_r = system('uname -r')
    if uname_r =~ '-ish\n$'
        " For iSH
        let lightweight = 1
    else
        let lightweight = 0
    endif
endif

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
    set guifont=SFMono\ Regular\ Nerd\ Font\ Complete.otf:h12
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

" material.vim
if has('termguicolors')
    set termguicolors
endif

" tmux 24-bit color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:material_theme_style = 'dark'
set background=dark
colorscheme material

" nerdtree
if !lightweight
    let g:NERDTreeShowHidden = 1

    autocmd vimenter * NERDTree
    autocmd VimEnter * wincmd p
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    nnoremap <leader>w :bp<cr>:bd #<cr>
endif

" rainbow
let g:rainbow_active = 1

" swift.vim
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

" tcomment_vim
autocmd FileType prototxt call tcomment#type#Define('prototxt', '# %s')

" vim-airline
if !lightweight
    set laststatus=2
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    let g:airline_skip_empty_sections = 1
endif

" vim-lsp
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
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

" Optional plugins
autocmd FileType html packadd emmet-vim
autocmd FileType python packadd vim-python-pep8-indent
if executable('git')
    packadd vim-fugitive
    packadd vim-gitgutter
endif
if !lightweight
    packadd vim-airline
    packadd nerdtree
    if executable('git')
        packadd nerdtree-git-plugin
    endif
endif

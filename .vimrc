if has('ios')
    " iVim
    " Pathogen
    let s:pathogen_dir = expand('~/bundle')
    let g:rc_dir = expand('~/.vim')

    execute pathogen#infect('~/bundle/{}')

    if globpath(s:pathogen_dir, 'indentLine', 1) !=# ''
        exec 'source ' . g:rc_dir . '/indentLine.vim'
    endif
    if globpath(s:pathogen_dir, 'material.vim', 1) !=# ''
        exec 'source ' . g:rc_dir . '/material_vim.vim'
    endif
    if globpath(s:pathogen_dir, 'nerdtree', 1) !=# ''
        exec 'source ' . g:rc_dir . '/nerdtree.vim'
    endif
    if globpath(s:pathogen_dir, 'rainbow', 1) !=# ''
        exec 'source ' . g:rc_dir . '/rainbow.vim'
    endif
    if globpath(s:pathogen_dir, 'swift.vim', 1) !=# ''
        exec 'source ' . g:rc_dir . '/swift_vim.vim'
    endif
    if globpath(s:pathogen_dir, 'tcomment_vim', 1) !=# ''
        exec 'source ' . g:rc_dir . '/tcomment_vim.vim'
    endif
    if globpath(s:pathogen_dir, 'vim-airline', 1) !=# ''
        exec 'source ' . g:rc_dir . '/vim-airline.vim'
    endif

    " Default settings
    set nocompatible
    filetype plugin indent on
    syntax on
    set showcmd
    set wildmenu
    set incsearch
    set backspace=indent,eol,start
else
    " dein.vim
    let s:dein_dir = expand('~/.cache/dein')
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
    let g:rc_dir = expand('~/.vim')

    " Install dein.vim if it is not downloaded
    if &runtimepath !~# '/dein.vim'
        if !isdirectory(s:dein_repo_dir)
            execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
        endif
        execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
    endif

    if dein#load_state(s:dein_dir)
        call dein#begin(s:dein_dir)

        let s:toml      = g:rc_dir . '/dein.toml'
        let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

        call dein#load_toml(s:toml,      {'lazy': 0})
        call dein#load_toml(s:lazy_toml, {'lazy': 1})

        call dein#end()
        call dein#save_state()
    endif

    if dein#check_install(['vimproc.vim'])
        call dein#install(['vimproc.vim'])
    endif

    if dein#check_install()
        call dein#install()
    endif

    " Default settings
    if !has('nvim')
        source $VIMRUNTIME/defaults.vim
    endif
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
    set undodir=$HOME/.vim/undo
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

" Python
if has('mac')
    if executable('/usr/local/bin/python3')
        let $PYTHONPATH .= system('/usr/local/bin/python3 -c "import sys; print(\":\".join(sys.path))"')
    endif
elseif has('unix')
    if executable('/usr/bin/python3')
        let $PYTHONPATH .= system('/usr/bin/python3 -c "import sys; print(\":\".join(sys.path))"')
    endif
endif

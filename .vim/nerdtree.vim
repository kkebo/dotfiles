" nerdtree

let g:NERDTreeShowHidden = 1

autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <leader>w :bp<cr>:bd #<cr>

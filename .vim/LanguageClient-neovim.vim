" LanguageClient-neovim

set hidden
set signcolumn=yes

let g:LanguageClient_serverCommands = {}
if executable('rustup')
    let g:LanguageClient_serverCommands['rust'] = [expand('rustup'), 'run', 'nightly', 'rls']
endif
if executable('pyls')
    let g:LanguageClient_serverCommands['python'] = [expand('pyls')]
endif
if executable('clangd')
    let g:LanguageClient_serverCommands['c'] = [expand('clangd')]
    let g:LanguageClient_serverCommands['cpp'] = [expand('clangd')]
elseif has('mac') && executable('/usr/local/opt/llvm/bin/clangd')
    let g:LanguageClient_serverCommands['c'] = ['/usr/local/opt/llvm/bin/clangd']
    let g:LanguageClient_serverCommands['cpp'] = ['/usr/local/opt/llvm/bin/clangd']
endif

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <F3> :call LanguageClient_textDocument_references()<CR>
nnoremap <F5> :call LanguageClient_contextMenu()<CR>

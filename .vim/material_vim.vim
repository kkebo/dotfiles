" material.vim

if has('termguicolors')
    set termguicolors
endif

if !has('ios')
    " tmux 24-bit color
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:material_theme_style = 'dark'
set background=dark
colorscheme material

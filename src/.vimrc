set t_Co=256
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set encoding=utf-8
syntax on

let g:vim_json_syntax_conceal = 0

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'

Plug 'vim-syntastic/syntastic'

Plug 'Valloric/YouCompleteMe'

Plug 'Lokaltog/vim-distinguished'

Plug 'easymotion/vim-easymotion'

Plug 'ternjs/tern_for_vim'

Plug 'pangloss/vim-javascript'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'Raimondi/delimitMate'

Plug 'tpope/vim-sensible' 

Plug 'elzr/vim-json'


call plug#end()

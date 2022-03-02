call plug#begin("~/.config/nvim/plugged")
Plug 'github/copilot.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'sainnhe/gruvbox-material'
call plug#end() 

syntax enable
set number " show line numbers
set wrap
set encoding+="UTF-8"
set clipboard+="unnamedplus"
set tabstop=2
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab
set undodir=~/.nvim/undodir          " set a undodir
set formatoptions-=ro
" set termguicolors
" set cursorline
" set ruler
" set showtabline=2

set guicursor=i:block

set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1

colorscheme gruvbox-material

" Use a line cursor within insert mode and a block cursor everywhere else.
"
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps  1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[1 q"
let &t_EI = "\e[1 q"

if &term =~ "screen."
    let &t_ti.="\eP\e[1 q\e\\"
    let &t_SI.="\eP\e[1 q\e\\"
    let &t_EI.="\eP\e[1 q\e\\"
    let &t_te.="\eP\e[1 q\e\\"
else
    let &t_ti.="\<Esc>[1 q"
    let &t_SI.="\<Esc>[1 q"
    let &t_EI.="\<Esc>[1 q"
    let &t_te.="\<Esc>[1 q"
endif

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal formatoptions-=ro
augroup END

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-rooter'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
" Plug 'jiangmiao/auto-pairs'

Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
" Plug 'sainnhe/gruvbox-material'
Plug 'tomasiser/vim-code-dark'
Plug 'sheerun/vim-polyglot'

Plug 'psliwka/vim-smoothie'
Plug 'editorconfig/editorconfig-vim'

Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'

Plug 'christoomey/vim-tmux-navigator'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'chr4/nginx.vim'

call plug#end()

let mapleader = ' '

syntax on
filetype indent plugin on
set expandtab
set tabstop=2
set shiftwidth=2
set ai
set autoindent
set smartindent
set number
set hlsearch
set ruler
set wrap
set go+=a
highlight Comment ctermfg=green

set clipboard=unnamedplus
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set whichwrap+=<,>,[,],h,l
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                   " The encoding written to file
set cmdheight=1                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set incsearch
set hlsearch
set path+=**
set wildmenu
set undodir=.undo/,~/.undo/,/tmp//
set undofile
set cursorline
set paste
if has('termguicolors')
  set termguicolors
endif
set background=dark
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_foreground = 'material'
" colorscheme gruvbox-material
colorscheme codedark

" let g:airline_theme = 'gruvbox_material'
let g:airline_theme = 'codedark'

nmap <silent> <S-L> :bnext<CR>
nmap <silent> <S-H> :bprevious<CR>

" resize windows w/ ctrl&arrow keys
nnoremap <silent> <C-Down>    :resize -1<CR>
nnoremap <silent> <C-Up>  :resize +1<CR>
nnoremap <silent> <C-Right>  :vertical resize -2<CR>
nnoremap <silent> <C-Left> :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jk <C-c>
inoremap kj <C-c>
inoremap kk <C-c>
inoremap jj <C-c>

vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

nnoremap <silent> <Leader>c :bd<CR>
nnoremap <silent> <Leader>w :w<CR>

" Commentary
nnoremap <silent> <Leader>/ :Commentary<CR>
vnoremap <silent> <Leader>/ :Commentary<CR>

" FZF
let g:fzf_command_prefix = 'Fzf'
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

nnoremap <silent> <C-p> :FzfFiles<CR>
nnoremap <silent> <Leader>b :FzfBuffers<CR>
nnoremap <silent> <Leader>f :FzfRg<CR>
nnoremap <silent> <Leader>' :FzfMarks<CR>
nnoremap <silent> <Leader>h :FzfHistory<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Space not working in normal mode
nnoremap <silent> <Space>h :noh<CR>

" Copy to X CLIPBOARD
map <silent> <leader>cc :w !xsel -i -b<CR>
map <silent> <leader>cp :w !xsel -i -p<CR>
map <silent> <leader>cs :w !xsel -i -s<CR>
" Paste from X CLIPBOARD
map <silent> <leader>pp :r!xsel -p<CR>
map <silent> <leader>ps :r!xsel -s<CR>
map <silent> <leader>pb :r!xsel -b<CR>

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" NERDTree
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden=1

" Undotree
nnoremap <F5> :UndotreeToggle<CR>

if has("persistent_undo")
   let target_path = expand('~/.undodir')

   " create the directory and any parent directories
   " if the location does not exist.
   if !isdirectory(target_path)
     call mkdir(target_path, "p", 0700)
   endif

   let &undodir=target_path
   set undofile
endif

let g:airline_powerline_fonts = 1

let g:user_emmet_mode='a'    "enable all function in all mode.

let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."\t<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\" />\n"
\              ."\t<title>Document</title>\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

autocmd FileType python set softtabstop=2
autocmd FileType python set tabstop=2
autocmd FileType python set autoindent
autocmd FileType python set expandtab
autocmd FileType python set smartindent
autocmd FileType python set shiftwidth=2

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

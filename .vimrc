
" Start plugins section
call plug#begin('~/.vim/plugged')

Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-signify'
Plug 'farmergreg/vim-lastplace'

" Initialize plugin system
call plug#end()

set smartindent
set nowrap

let g:airline_powerline_fonts=1
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:airline_theme='deus'

" Disable arrows keys
noremap <Up> :echo 'Use K!'<cr>
noremap <Down> :echo 'Use J!'<cr>
noremap <Left> :echo 'Use H!'<cr>
noremap <Right> :echo 'Use L!'<cr>

map <C-n> :NERDTreeToggle<CR>

" toggle invisible characters
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none
set showbreak=↪




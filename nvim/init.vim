"by default sets syntax to be on
syntax on

"relative number gang
set relativenumber
let mapleader = ","

"removes extra insert line at the bottom for lightline
set noshowmode

"personal remappings
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>o :e 
nnoremap <C-p> :Files<CR>
nnoremap <Leader>O :bd<CR>
nnoremap <Leader>' :bn<CR>
nnoremap <Leader>" :bp<CR>
nnoremap <leader>dt :put=strftime('@@%Y-%m-%d')<CR>
nnoremap oo o<Esc>j
nnoremap OO O<Esc>k

"backup
set backupdir=/tmp
set backup

"allows undos to be done through file exits
set undofile
"security thing?
set nomodeline

" These two clipboard functions only yank and put to primary X11 clipboard
" yank too system clipboard
nnoremap <leader>y "*y
"Put from system clipboard
nnoremap <leader>p "*p
"removes annoying highlights from searching and replacing
nnoremap <leader>nh :noh<CR>	


call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
"Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
call plug#end()
"colorscheme gruvbox

let g:coc_global_extensions = [
      \'coc-python',
      \'coc-pyright']

"coc remappings
"Allows for tab autocomplete, gd to go to definition and different highlights
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

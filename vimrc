" SHORTCUTS
" F5			- Run python
" F6			- NERDTree
" F7			- Remove Trailing white spaces
" F8			- Tagbar
" F9			- Autopep
" F10			- Shellcheck
" F12			- Terminal 
" Alt + J/K 	- Move line up and down
" AA <Esc>A 	- Edit the end of line
" II <Esc>I		- Edit the beginning of line
" OO <Esc>O		- Add line under line
" SS <Esc>S		- Edit the test of line
" CC <Esc>C		- Remove the rest of line
" UU <Esc>u		- Undo change
" PP <Esc>pi	- Paste 

syntax enable
set number
set ts=4
set autoindent
set shiftwidth=4
set encoding=utf-8
set clipboard=unnamed
set cursorline
set showmatch
set spell spelllang=en_us
let python_highlight_all = 1
call plug#begin()
	Plug 'preservim/nerdtree'
	Plug 'sickill/vim-monokai'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-fugitive'
	Plug 'voldikss/vim-floaterm'
	Plug 'frazrepo/vim-rainbow'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tell-k/vim-autopep8'
	Plug 'preservim/tagbar'
	Plug 'dense-analysis/ale'

call plug#end()

" Airline settings
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

colorscheme monokai

" Floaterm
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Rainbow settings
let g:rainbow_active = 1

" Autopep
autocmd FileType python noremap <buffer> <F9> :call Autopep8()<CR>

" Airline
let g:airline_theme='wombat'

" NERDTree
filetype plugin indent on
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-h>
nmap <F6> :NERDTreeToggle<CR>

" Removing all white spaces
nnoremap <F7> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Move line up/down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Move selected lines up/down
xnoremap <silent> <M-k> :<C-u>silent! exe "'<,'>move-2"<CR>gv=gv
xnoremap <silent> <M-j> :<C-u>silent! exe "'<,'>move'>+"<CR>gv=gv

" Run python code with F9
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Comment code with # and -#
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

" Paste system clipboard with Ctrl + p
inoremap <C-p> : <ESC>"+gPi
vnoremap <C-p> : d"+gP<ESC>
cnoremap <C-p> : <C-r>+

" Copy to system clipboard with Ctr + c
vnoremap <C-y> "+y
nnoremap <C-y> "+yy
inoremap <C-y> <ESC>"+yyi

" Linting for python
let g:ale_enabled = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_linters = {'python': ['pylint']}

" Run shellcheck
nnoremap <silent> <F10> :!shellcheck % <CR>


" Simple line modification in insert mode
inoremap II <Esc>I
inoremap AA <Esc>A
inoremap OO <Esc>O
inoremap SS <Esc>S
inoremap CC <Esc>C
inoremap UU <Esc>u
inoremap PP <Esc>pi
inoremap DD <Esc>ddi

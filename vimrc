" initialize vim by call to vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" productivity
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" visualization
Plugin 'rdavison/Libertine'
Plugin 'Yggdroot/indentLine'

" vcs
Plugin 'tpope/vim-fugitive'

" autocomplete
Plugin 'Shougo/deoplete.nvim'
"Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'

" languages
    " rust
    Plugin 'rust-lang/rust.vim'
    Plugin 'racer-rust/vim-racer'
    Plugin 'sebastianmarkow/deoplete-rust'
    " go
    Plugin 'fatih/vim-go'
call vundle#end()


"""""""""""""""""""""""""""""""""""""""
" G E N E R A L         C O N F I G S "
"""""""""""""""""""""""""""""""""""""""
" other configurations
filetype plugin indent on         " vundle stuff
set nu                            " show line number
syntax on                         " use different syntax options on different files
set tabstop=4                     " set tab to 4
set shiftwidth=4                  " set tab width to 4
set expandtab                     " set space as tab
colorscheme libertine             " set colorscheme to libertine
autocmd InsertEnter * set cul     " set cul on insert mode
autocmd InsertLeave * set nocul   " set nocul on normal mode
set timeoutlen=1000 ttimeoutlen=0 " set delay on insert/normal mode to 0
set textwidth=0                   " unlimited word wrap
set encoding=utf8                 " show glyphs
set guifont=DroidSansMono\ Nerd\ Font\ 13 " set vim font
set guicursor+=n-v-c:blinkon1             " set cursor blink on
autocmd VimEnter * NoMatchParen   " disable parens-matching
if !has('nvim')
    set ttymouse=xterm2
endif

" remap keyboard
map <C-g> :so %<CR>                           " reload vimrc
map <C-t> :NERDTreeToggle<CR>                 " toggle NERDTree with ctrl-t
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-v> <C-w>v
nnoremap <C-s> <C-w>s
nnoremap <C-left> :vertical resize -5<cr>
nnoremap <C-down> :resize -5<cr>
nnoremap <C-up> :resize +5<cr>
nnoremap <C-right> :vertical resize +5<cr>


"""""""""""""""""""""""""""""""""""""""
" V I S U A L           C O N F I G S "
"""""""""""""""""""""""""""""""""""""""
" NERDTree configurations
autocmd VimEnter * NERDTree       " start NERDTree on start
autocmd VimEnter * wincmd p       " focus the file, not NERDTree when open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" DOESN'T WORK WITH NEOVIM
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMapOpenSplit = 's'
let NERDTreeMapPreviewSplit = 'gs'
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeMapPreviewVSplit = 'gv'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Airline configuration
let g:airline_powerline_fonts = 1  " enable powerline fonts for airline
let g:airline#extensions#tabline#enabled = 1  " enable tabline

" IndnetLine configurations
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239


"""""""""""""""""""""""""""""""""""""""
" C O D E         A U T O C O M P L E "
"""""""""""""""""""""""""""""""""""""""
" Deoplete configuration
let g:deoplete#enable_at_startup = 1  " enable deoplete


"""""""""""""""""""""""""""""""""""""""
" L A N G U A G E       C O N F I G S "
"""""""""""""""""""""""""""""""""""""""
" ALE settings
let g:ale_linters = {'rust': ['rls']}
let g:ale_rust_rls_executable = 'rls'
let g:ale_rust_rls_toolchain = 'beta'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay = 100
" Rust

" Rust settings
set hidden
let g:racer_cmd = '/home/amuro/.cargo/bin/racer'
let g:racer_experimental_completer = 1

" Go settings
au FileType go set noexpandtab      " disable tabs as space when doing go dev
au FileType go set shiftwidth=4     " set shift width (>> or <<) to 4 spaces
au FileType go set softtabstop=4    " set tabstop to 4 in insert- mode
au FileType go set tabstop=4        " same as above
" code highlighting under Go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1           " highlight other ids in the same context
let g:go_fmt_command = "goimports"  " auto import deps

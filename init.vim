"""""""""""""""""""""""""""
" Basic Settings
"""""""""""""""""""""""""""
" copy indent from current line when starting a new line
set autoindent
" turn filetype detection, indent scripts and filetype plugins on
filetype plugin indent on
" syntax highlighting
syntax enable
" vim will try to use colors that look good on a dark background
set background=dark
" number of colors vim can use
"set t_Co=256
" number of colors solarized colorscheme can use
"let g:solarized_termcolors=256
" use solarized as colorscheme
colorscheme solarized
" display line number relatively to the current one
set rnu
" highlight the current line and column
set cursorline
set cursorcolumn
" <tab> inserts spaces instead of tabs
set expandtab
" set softtabstop=0
" size of <tab> measured in spaces 
set tabstop=4
" size of an indent, 4 spaces to match <tab>
set shiftwidth=4
" enable mouse
set mouse=a
" automatically wrap text as close to 100 characters
set textwidth=100

"""""""""""""""""""""""""""
" Auto commands
"""""""""""""""""""""""""""
" remove blank characters at the end of every line when saving file, need to be disabled for some
" filetypes like markdown or latex where trailing spaces are important
autocmd FileType c,cpp,java,python,javascript autocmd BufWritePre <buffer> %s/\s\+$//e

"""""""""""""""""""""""""""
" Basic Mappings
"""""""""""""""""""""""""""
let mapleader=","

map <C-T> :tabnew<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>
map <C-B> :tab all<CR>


"""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""
call plug#begin()

" Deoplete for autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Python completion integrated in deoplete
Plug 'zchee/deoplete-jedi', { 'for': ['python'] }
" Javascript completion integrated in deoplete
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
" File explorer
Plug 'scrooloose/nerdtree'
" File finder
Plug 'kien/ctrlp.vim'
" Quickly comment one or more lines
Plug 'https://github.com/scrooloose/nerdcommenter.git'
" See git additions/removal/updates not comitted yet
Plug 'airblade/vim-gitgutter'
" Used to select pattern with multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Go to character
Plug 'easymotion/vim-easymotion'
" Syntax checker
Plug 'scrooloose/syntastic'
" Syntax checker to be used with syntastic for python
Plug 'nvie/vim-flake8'
" Solarized colorscheme
Plug 'altercation/vim-colors-solarized'
" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Python related
Plug 'vim-scripts/indentpython.vim'
" Async execution library used by many plugins
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Used to grep patterns across files
Plug 'https://github.com/Shougo/unite.vim.git'
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" display available markers
Plug 'kshenoy/vim-signature'

"Plug 'git@github.com:Valloric/YouCompleteMe.git'

call plug#end()


"""""""""""""""""""""""""""
" Deoplete
"""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"


"""""""""""""""""""""""""""
" Unite
"""""""""""""""""""""""""""
call unite#custom#source('file_rec/async', 'ignore_pattern', 'node_modules/')
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file,file/new,buffer,file_rec/async,line', 'matchers', 'matcher_fuzzy')

" use ag silversearcher for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command= 'ag --nocolor --nogroup --hidden -g ""'
endif

" find a file matching pattern
nnoremap <C-F> :Unite grep:.<CR>
" find pattern inside current buffer
nnoremap <C-k> :<C-u>Unite -buffer-name=search -start-insert line<cr>


"""""""""""""""""""""""""""
" YouCompleteMe (not used anymore, replaced partly by deoplete)
"""""""""""""""""""""""""""
"let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"""""""""""""""""""""""""""
" Easymotion
"""""""""""""""""""""""""""
map <Leader> <Plug>(easymotion-prefix)


"""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction

" toggle file explorer visibility
map <C-A> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'


"""""""""""""""""""""""""""
" Ultisnips
"""""""""""""""""""""""""""
" apply snippet
let g:UltiSnipsExpandTrigger="<c-g>"
" jump to next/previous text to edit
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""
" default setting of 'laststatus' is for the statusline to not appear until a split is created,
" set to 2 to appear all the time
set laststatus=2
" use powerline font (need manual install)
let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""
" Javascript
"""""""""""""""""""""""""""
" execute jshint when file is saved
let jshint2_save = 1


"""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""
let python_highlight_all = 1
nmap <silent> <C-m> <Plug>(pydocstring)

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugins')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " File browser
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ervandew/supertab' " Smart tab key
  Plug 'bling/vim-airline' " Nice status line
  Plug 'altercation/vim-colors-solarized' " Theme
  Plug 'scrooloose/nerdcommenter'
  Plug 'w0rp/ale' " Syntax checking
  Plug 'airblade/vim-gitgutter' " Git status display
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file search in shell
  Plug 'junegunn/fzf.vim' " Fuzzy file search in vim
call plug#end()

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

filetype plugin indent on

syntax on

" Remove a character because terminator is not compatible with guicursor
set guicursor=

" Ruler
if exists('+colorcolumn')
  " add rulerson lines 80 and 100
  set colorcolumn=88,100
endif

" Basic settings
set showmatch
set number

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if put ag it is transformed to Ag
cnoreabbrev ag Ag

" if we are inside a git directory only search the git files
fun! FzfOmniFiles()
    let is_git = system('git status')
    if v:shell_error
        :Files
    else
        :GitFiles --others --exclude-standard --cached
    endif
endfun
map <c-p> :call FzfOmniFiles()<cr>

let g:rg_command = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" -g "!{.git}/*" '

command! -bang -nargs=* Ag call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_python_mypy_options = '--follow-imports normal --ignore-missing-imports'

nnoremap <leader>f :ALEFix<cr>

let g:ale_fixers = {
\   'python':['black', 'yapf', 'isort'],
\}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <leader>gd :YcmCompleter GoToDeclaration<cr>
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" make YCM use the python version of the virtualenv to do completions
" let g:ycm_python_binary_path = 'python'
" let g:ycm_log_level = "debug"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree 
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-m> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" Close NERDTree automatically when the last file is closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Remove trailing whitespace from certain files
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> :%s/\s\+$//e

" Vim-Airline

let g:airline_left_sep='|'
let g:airline_right_sep='|'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#empty_message = 'no-git'
let g:airline_theme='dark'

" Theme
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commands
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" run the file through black
nnoremap <leader>b :!black -l 100 %<CR>

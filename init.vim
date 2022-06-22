" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugins')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " File browser
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ervandew/supertab' " Smart tab key
  Plug 'bling/vim-airline' " Nice status line
  Plug 'altercation/vim-colors-solarized' " Theme
  Plug 'scrooloose/nerdcommenter'
"  Plug 'dense-analysis/ale' " Syntax checking
  Plug 'airblade/vim-gitgutter' " Git status display
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy file search in shell
  Plug 'junegunn/fzf.vim' " Fuzzy file search in vim
  Plug 'Yggdroot/indentLine' " Showing indetatioin
  Plug 'tpope/vim-fugitive'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  Plug 'davidhalter/jedi-vim'
"  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

let mapleader = ","

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
" let g:ale_completion_enabled = 1
" let g:ale_python_mypy_options = '--follow-imports normal --ignore-missing-imports'
" let g:ale_completion_autoimport = 1

" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'python':['black', 'isort'],
" \}

" let g:ale_sign_error = '◉'
" let g:ale_sign_warning = '◉'
" highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500 guibg=#F5F5F5
" highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#ED6237 guibg=#F5F5F5

" let g:ale_warn_about_trailing_whitespace = 0
" let g:ale_maximum_file_size = 1024 * 1024
" let g:ale_code_actions_enabled = 1
" let g:ale_set_balloons_legacy_echo = 1
" let g:ale_c_parse_compile_commands = 1
" let g:ale_lsp_suggestions = 0

" Options for different linters.
" let g:ale_typescript_tslint_ignore_empty_files = 1
" let g:ale_lint_on_text_changed = 'normal'
" let g:ale_lint_on_insert_leave = 1
" let g:ale_set_balloons = has('gui_running') ? 'hover' : 0

" map <C-d> :ALEGoToDefinition<CR>
" nnoremap <leader>f :ALEFix<cr>

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
" DeoPlete
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi Completions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-m> :NERDTreeToggle<CR>
map <C-s> :NERDTreeFind<CR>
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
" Indentation
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"set list
"set listchars=tab:▸\
set list lcs=tab:\|\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commands
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" run the file through black
nnoremap <leader>b :!black -l 100 %<CR>
" reload the current file if disk changes after default user inactivity
set autoread
au CursorHold * checktime

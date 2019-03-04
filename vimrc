filetype indent on
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme night-owl
set number
set relativenumber
let mapleader=","
set shortmess+=A
set laststatus=0
set noshowmode
set hidden
set history=500
set nowrap
set nobackup
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set backspace=2
set encoding=utf-8
set wildmenu
set ignorecase
set splitbelow
set splitright
set expandtab
set autoread
set timeout ttimeout timeoutlen=200
set smartindent
set scrolloff=5
set autoindent
set autowriteall
set hlsearch
set showmatch
set noerrorbells visualbell t_vb=
set rtp+=/usr/local/opt/fzf

"map <leader>p :FZF<CR>
"map <C-p> :FZF<CR>
nnoremap <leader>p :FilesMru --tiebreak=index<cr>
map <C-p> :FilesMru --tiebreak=index<CR>

map <leader>s :source $MYVIMRC<CR>
map <leader>ev :e $MYVIMRC<CR>

autocmd BufWritePre * :%s/\s\+$//e
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W

nnoremap <silent><leader>f :call PhpCsFixerFixFile()<CR>
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'left': '~40%' }

let $FZF_DEFAULT_COMMAND = 'ag --skip-vcs-ignores -g ""'

let g:fzf_filemru_bufwrite = 1
let g:fzf_filemru_git_ls = 1
let g:fzf_filemru_ignore_submodule = 1

"This runs the full PHPUnit suite.
nnoremap ,t :!phpunit<cr>

"This runs the test method under the cursor.
nmap ,tm ?function

nmap <leader>e :MRU<CR>

nmap <leader>w :bd<CR>

nmap ;w :w<CR>

nmap <C-]> g<C-]>

imap jj <Esc>

" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Change echo message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Set cs_fixer for php files, use linter for vue files.
let g:ale_fixers = {'php': ['php_cs_fixer']}
let g:ale_linter_aliases = {
\   'vue': ['vue', 'javascript'],
\   'jsx': ['css', 'javascript']
\}

let g:ale_linters = {
\   'vue': ['eslint', 'vls'],
\   'javascript': ['eslint'],
\   'jsx': ['stylelint', 'eslint']
\}
" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1



let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }



function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>q <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>q :call PhpExpandClass()<CR>

imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
let g:UltiSnipsSnippetsDir="~/.config/nvim/snippets/"

let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'startify', 'man', 'rogue']

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'yegappan/mru'
Plug 'w0rp/ale'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
Plug 'haishanh/night-owl.vim'
Plug 'maximbaz/lightline-ale'
Plug 'SirVer/ultisnips'

"Snipmate dependencies
Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()


"Tips
" If there are Syntastic errors on the page, do :Errors to read the list.
" ltag methodName and then lopen to view all symbols.

"regenerate tags with
" ctags -R --PHP-kinds=cfi --regex-php="/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i"
" gc will comment out the selection.



"-------------Tips and Reminders--------------"
" - Press 'zz' to instantly center the line where the cursor is located.
" - Press 'ctrl ]' to where the method was defined.
" - Press 'ctrl ^' to previous edit location.
" - Press 'ctrl d' to skip down a page.
" - Press 'ctrl u' to skip up a page.
" - Press 'cs <whatevertag> to change specific tag.
" - Press 'ds <whatevertag> to delete specific tag.
" - Press 'dst' to delete the surrounding tag.
" - Press 'cst' to change the surrounding tag.
" - Press 'selected visually, press shift S to add tag to item.

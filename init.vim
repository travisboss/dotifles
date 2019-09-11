"Vim Plug
call plug#begin('~/.config/nvim/plugged')
   "auto close
   Plug 'alvan/vim-closetag'
   "blamer
   Plug 'APZelos/blamer.nvim'
   "coc.nvim
   Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
   "dirvish
   Plug 'justinmk/vim-dirvish'
   "editorconfig
   Plug 'editorconfig/editorconfig-vim'
   "fzy
   Plug 'travisboss/neovim-fuzzy'
   "lightline
   Plug 'itchyny/lightline.vim'
   Plug 'mengelbrecht/lightline-bufferline'
   "nerdtree
   Plug 'scrooloose/nerdtree'
   Plug 'scrooloose/nerdcommenter'
   "sneak
   Plug 'justinmk/vim-sneak'
  "theme
   Plug 'travisboss/vim-janah-dark'
  "tpope suite
   Plug 'tpope/vim-fugitive'
   Plug 'tpope/vim-repeat'
   Plug 'tpope/vim-surround'
  "vim-polygot"
   Plug 'sheerun/vim-polyglot'
call plug#end()






"neovim defaults
if !has('nvim')
  set nocompatible
  syntax on

  set autoindent
  set autoread
  set backspace=indent,eol,start
  set belloff=all
  set complete-=i
  set display=lastline
  set formatoptions=tcqj
  set history=10000
  set incsearch
  set laststatus=2
  set ruler
  set sessionoptions-=options
  set showcmd
  set sidescroll=1
  set smarttab
  set ttimeoutlen=50
  set ttyfast
  set viminfo+=!
  set wildmenu
endif


"------------myStandards-------------"
set autowriteall        "auto write the file when switching buffers.
set clipboard^=unnamedplus "share system clipboard
set cursorline          "highlight line under cursor. It helps with navigation
set expandtab           "insert spaces when TAB is pressed.
set formatoptions+=o    "continue comment marker in new lines.
set history=500         "set how many lines of history VIM should remember
set ignorecase          "make searching case insensitive
set iskeyword+=-        "use dash as word separator
let mapleader = ','     "the default is \, but a comma is much better.

"move between buffers with tab and shift-tab
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

"auto center on matched string
noremap n nzz
noremap N Nzz

set nojoinspaces        "prevents inserting two spaces after punctuation on a join (J)
set nomodeline          "jon't parse modelines
set noshowmode          "do not show status in tab line
set noswapfile          "remove swap
set nowrap              "no wrap
set number              "show the line numbers on the left side.
set path+=.,**          "set path
set relativenumber      "relative numbers!
set showmatch           "show matching brackets.
set shiftwidth=2        "1 tab == 2 spaces
set smartcase           "unless the query has capital letters.
set showtabline=2       "always show tab line
set tabstop=2           "1 tab == 2 spaces
set wildmode=longest,full "for autocompletion, complete as much as you can






"-------------Colorscheme--------------"
if (has("termguicolors"))
    set termguicolors
endif

"colorscheme edits to make my eyes not hurt
augroup themeColors
  autocmd!
  autocmd ColorScheme * highlight Normal guibg=00000
  autocmd ColorScheme * highlight CursorLineNr guifg=fffff
  autocmd ColorScheme * highlight SignColumn guibg=00000
  autocmd ColorScheme * highlight LineNr guifg=000000 guibg=00000
augroup END

"colorscheme
colorscheme janah






"-------------Split Management--------------"
" More natural splits
set splitbelow          "horizontal split below current.
set splitright          "vertical split to right of current.

if !&scrolloff
   set scrolloff=3      "show next 3 lines while scrolling.
endif
if !&sidescrolloff
   set sidescrolloff=5  "show next 5 columns while side-scrolling.
endif

set nostartofline       "do not jump to first character with page commands.
set list                "show problematic characters.

"also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=white guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

"get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg

"open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
set splitbelow          "Make splits default to below...
set splitright          "And to the right. This feels more natural.

"we'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"resize windows with <,>,=
if bufwinnr(1)
  map > <C-W>5>
  map < <C-W>5<
  map = <C-W>=
endif






"-------------Mappings--------------"
"make it easy to edit the Vimrc file.
nmap <Leader>ev :e $MYVIMRC<cr>
"fast saves.
nmap <leader>ww :w!<cr>
"fast saves and quits
nmap <leader>qq :wq!<cr>
"easy escaping to normal mode
imap kj <esc>
inoremap <C-c> <esc>
"add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>
"open terminal window
nmap <leader>t :ter<cr>
"remove mapping of up down left right keys
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>
"sort styles tags
nmap <leader>sv vi{ <bar> :sort<cr>





"-------------Plugins--------------"
"/
"/autoclose tags
"/
let g:closetag_filenames = '*.html'
"shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>>'






"/
"/blamer
"/
let g:blamer_enabled = 1
let g:blamer_date_format = '%m/%d/%y'
let g:blamer_delay = 500






"/
"/coc
"/
command! -nargs=0 Prettier :CocCommand prettier.formatFile
"if hidden is not set, TextEdit might fail.
set hidden
"some servers have issues with backup files, see #649
set nobackup
set nowritebackup
"you will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300






"/
"/editorconfig
"/
let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']






"/
"/fzy
"/
nmap <C-p> :FuzzyOpen<cr>
nmap <C-b> :FuzzyGrep<cr>






"/
"/lightline
"/
let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ] ],
  \   'right': [ [ 'percent', 'lineinfo' ],
  \              [ 'gitbranch', 'readonly', 'modified' ] ],
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \ },
  \ }

let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#show_number  = 0
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['none']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

"give transparent background to match theme
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle






"/
"/nerdtree
"/
let NERDTreeHijackNetrw = 1
nnoremap <leader>p :NERDTreeToggle<CR>
nnoremap <silent> <leader>v :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 35
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
"use compacyntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'




"/
"/sneek
"/
map f <Plug>Sneak_s
map F <Plug>Sneak_S





"-------------Auto-Commands--------------"
"automatically source the Vimrc file on save.
augroup autosourcing
autocmd!
autocmd BufWritePost ~/.config/nvim/init.vim source %
augroup END

"automatically change the current directory
autocmd BufEnter * silent! lcd %:p:h

"auto reload if file was changed somewhere else (for autoread)
au CursorHold * checktime

"add MRU when start vim
function! NoFile()
    if @% == ""
        belowright 12new +setl\ buftype=nofile
        set nowrap
        set conceallevel=2
        call matchadd('Conceal', '^\zs.*\ze\/.*\/.*\/', 10, 99, {'conceal': '…'})
        0put =v:oldfiles
        execute 'g/^/m0'
        execute 'normal! G'
        nnoremap <buffer> <CR> :call OpenMRUFile()<CR>
    endif
endfunction

function! OpenMRUFile()
    let l:file = getline('.')
    bd
    execute 'e' l:file
endfunction

autocmd VimEnter * call NoFile()





"-------------Notes and other stuff----------------"
"cs"' to replace " with '
"cs'<q> to change ' to <q></q>
"to remove ds"
"add tag around a word ysiw<em>
"- Press 'zz' to instantly center the line where the cursor is located.

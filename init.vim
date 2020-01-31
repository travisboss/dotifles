" vim plug
call plug#begin('~/.config/nvim/plugged')
   "coc
   Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
   "lightline
   Plug 'itchyny/lightline.vim'
   Plug 'mengelbrecht/lightline-bufferline'
   "nerdtree
   Plug 'scrooloose/nerdcommenter'
   "sneak
   Plug 'justinmk/vim-dirvish'
   Plug 'justinmk/vim-sneak'
   "theme
   Plug 'travisboss/vim-janah-dark'
   Plug 'haishanh/night-owl.vim'
   "tpope suite
   Plug 'tpope/vim-surround'
   Plug 'tpope/vim-repeat'
   Plug 'tpope/vim-vinegar'
   "vim-polyglot
   Plug 'sheerun/vim-polyglot'
   "startify
   Plug 'mhinz/vim-startify'
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
set autowriteall        "Auto write the file when switching buffers.
set clipboard^=unnamedplus "use shared system clipboard
set cursorline          "Highlight line under cursor. It helps with navigation
set expandtab           "Insert spaces when TAB is pressed.
set formatoptions+=o    "Continue comment marker in new lines.
set history=500         "Set how many lines of history nvim should remember
set ignorecase          "Make searching case insensitive
set iskeyword+=-        "Use dash as word separator
let mapleader = ','     "The default is \, but a comma is much better.

"Move between buffers with tab and shift-tab
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

"Auto center on matched string
noremap n nzz
noremap N Nzz

set nojoinspaces        "prevents inserting two spaces after punctuation on a join (J)
set nomodeline          "don't parse modelines
set noshowmode          "don't show mode
set noswapfile          "remove swap
set nowrap              "no wrapping please, just a box
set number              "Show the line numbers on the left side.
set path+=.,**           "mah path
set relativenumber      "relative numbers!
set showmatch           "show matching brackets.
set shiftwidth=2        "1 tab == 2 spaces
set smartcase           "unless the query has capital letters.
set showtabline=2
set tabstop=2           "1 tab == 2 spaces
set wildmode=longest,full "For autocompletion, complete as much as you can




"-------------Colorscheme--------------"
"set term gui colors if exist
if (has("termguicolors"))
    set termguicolors
endif

"colorscheme edits to make my eyes not hurt
"augroup themeColors
"  autocmd!
"  autocmd ColorScheme * highlight Normal guibg=00000
"  autocmd ColorScheme * highlight CursorLineNr guifg=fffff
"  autocmd ColorScheme * highlight SignColumn guibg=00000
"  autocmd ColorScheme * highlight LineNr guifg=000000 guibg=00000
"augroup END

"colorscheme
colorscheme janah






"-------------Split Management--------------"
" More natural splits
set splitbelow          "horizontal split below current.
set splitright          "vertical split to right of current.

if !&scrolloff
   set scrolloff=3       "show next 3 lines while scrolling.
endif
if !&sidescrolloff
   set sidescrolloff=5   "show next 5 columns while side-scrolling.
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
set splitbelow          "Make splits default to below...
set splitright          "And to the right. This feels more natural.

"we'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"reize windows with plus and minus and window management a lot easier
if bufwinnr(1)
  map > <C-W>5>
  map < <C-W>5<
  map = <C-W>=
endif






"-------------Mappings--------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :e $MYVIMRC<cr>
"Fast saves.
nmap <leader>ww :w!<cr>
"Fast saves and quits
nmap <leader>qq :wq!<cr>
"Easy escaping to normal mode
imap kj <esc>
inoremap <C-c> <esc>
"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>
"Open terminal window
nmap <leader>t :te zsh<cr>
"Remove mapping of up down left right keys
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>
"Sort styles tags
nmap <leader>sv vi{ <bar> :sort<cr>





"-------------Plugins--------------"
"/
"/ coc
"/
command! -nargs=0 Prettier :call CocActionAsync('runCommand', 'prettier.formatFile')
nmap <leader>f :Prettier<CR>
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction






"/
"/ netrw
"/
nmap <leader>p :Vexplore<cr>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'




"/
"/lightline
"/
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction' ] ],
      \   'right': [ [  'percent', 'lineinfo' ],
      \              [ 'gitbranch'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \ },
      \ }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['none']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.visual.middle = s:palette.normal.middle
let s:palette.insert.middle = s:palette.normal.middle
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle





"sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S





"Startify
let g:startify_custom_header = []







"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.vim source %
augroup END
" Automatically change the current directory
autocmd BufEnter * silent! lcd %:p:h
"Auto reload if file was changed somewhere else (for autoread)
au CursorHold * checktime






 "-------------Notes and other stuff----------------"
 " cs"' to replace " with '
 " cs'<q> to change ' to <q></q>
 " to remove ds"
 " change a word ysiw<em>
 " type :bp to see previous buffers
 " type :ls to see list of buffers

" Vim Plug
call plug#begin('~/.config/nvim/plugged')
 "airline
 Plug 'vim-airline/vim-airline'
 "ale
 Plug 'w0rp/ale'
 "autoswap
 Plug 'gioele/vim-autoswap'
"deoplete
Plug 'Shougo/deoplete.nvim'
 "nerdtree
 Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'ryanoasis/vim-devicons'
 Plug 'scrooloose/nerdcommenter'
 "startify
 Plug 'mhinz/vim-startify'
"supertab
Plug 'ervandew/supertab'
 "theme
 Plug 'morhetz/gruvbox'
 "tpope suite
 Plug 'tpope/vim-vinegar'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-repeat'
 "typescript
 Plug 'leafgarland/typescript-vim'
 "vim-color
 Plug 'ap/vim-css-color'
 Plug 'shmargum/vim-sass-colors'
 "vue
 Plug 'posva/vim-vue'

call plug#end()



set path+=.,**
set clipboard^=unnamedplus
set backspace=indent,eol,start  "Make backspace behave like every other editor.
let mapleader = ','     "The default is \, but a comma is much better.
set showmatch           " Show matching brackets.
set number relativenumber  " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.
set autowriteall        " Auto write the file when switching buffers.
set complete=.,w,b,u    " Set our desired autocompletion matching.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
   set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
   set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.
" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.
" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=white guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
" Change from : to ;
nnoremap ; :
" Move between buffers with tab and shift-tab
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>






"-------------Visuals--------------"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
filetype plugin indent on
syntax on
set background=dark
colorscheme gruvbox
let g:gruvbox_italic = 1
let g:gruvbox_contrast = 'medium'
set wrap
" do not display the current mode
set noshowmode

"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg

"Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>





"-------------Search--------------"
set hlsearch			    				   	"Highlight all matched terms.
set incsearch				    				"Incrementally highlight, as we type.





"-------------Split Management--------------"
set splitbelow 					    			"Make splits default to below...
set splitright						    		"And to the right. This feels more natural.
"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
"Auto-remoe trailing spaces.
autocmd BufWritePre *.php :%s/\s\+$//e






"-------------Mappings--------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :e $MYVIMRC<cr>
nmap <Leader>es :e ~/.config/nvim/snippets/
"Fast saves.
nmap <leader>ww :w!<cr>
"Fast saves and quits
nmap <leader>qq :wq!<cr>
"Easy escaping to normal mode
imap kj <esc>
"Down is really the next line.
nnoremap j gj
nnoremap k gk
"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>
"Edit todo list for project.
nmap ,todo :e todo.txt<cr>
"Open terminal window
nmap <leader>t :ter<cr>
"Remove mapping of up down left right keys
nmap <Up> <Nop>
nmap <Down> <Nop>
nmap <Left> <Nop>
nmap <Right> <Nop>
"Some fixes for common typos have saved me a surprising amount of time
command WQ wq
command Wq wq
command WA wa
command Wa wa
command W w
command Q q
command Qa qa
command QA qa
command Bd bd
"Sort styles tags
nmap <leader>sv vi{ <bar> :sort<cr>





"-------------Plugins--------------"
"/
"/ ale
"/
nmap <leader>f :ALEFix<cr>
nmap <leader>wf :w <bar> :ALEFix<cr>
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_sign_error = '💔'
let g:ale_sign_warning = '💡'
let g:ale_linters_explicit = 1
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'jsx': ['eslint'],
    \ 'php': ['phpcs'],
    \ 'rust': ['cargo'],
    \ 'typescript': ['tslint'],
    \ 'vue': ['eslint']
    \ }
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'html': ['prettier'],
    \ 'javascript': ['eslint'],
    \ 'jsx': ['eslint'],
    \ 'rust': ['rustfmt'],
    \ 'scss': ['prettier'],
    \ 'typescript': ['tslint'],
    \ 'vue': ['eslint']
    \ }



"/
"/ deoplete
"/
let g:deoplete#enable_at_startup = 1
" Use ALE as completion sources for all code.
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})




"/
"/ typescript-vim
"/
let g:typescript_indent_disable = 1



"/
"/ nerdtree
"/
let NERDTreeHijackNetrw = 1
nnoremap <leader>p :NERDTreeToggle<CR>
nnoremap <silent> <leader>v :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 25
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1




"/
"/vim-airline
"/
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_section_x = ''                         "Remove filetype
let g:airline_section_y = ''                         "Remove unicode
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#ale#enabled = 1




"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost .config/nvim/init.vim source %
augroup END
" Automatically change the current directory
autocmd BufEnter * silent! lcd %:p:h
"Sort PHP use statements
vmap <Leader>Su ! awk '{ print length(), $0\| "sort -n \| cut -d\\ -f2-"extends}'<cr>
" Change syntax highlighting to html for vue files
autocmd BufRead,BufNewFile *.vue setfiletype html
"Auto create skeleton files
autocmd BufNewFile * silent! 0r $HOME/.config/nvim/skeletons/%:e.tpl



 "-------------Notes and other stuff----------------"
 " If I hit % inside of Vinegar I can create a new file
 " If I hit d I can create a new directory.
 " If I hit D I can delete the directory or file.
 " Emmet key is Control Z comma
 " gcc to commnet out a line
 " gcap to comment out a paragraph
 " cs"' to replace " with '
 " cs'<q> to change ' to <q></q>
 " to remove ds"
 " change a word ysiw<em>


" Vim Plug
call plug#begin('~/.config/nvim/plugged')
 Plug 'w0rp/ale'
 Plug 'sheerun/vim-polyglot'
 Plug '/usr/local/opt/fzf'
 Plug 'junegunn/fzf.vim'
 Plug 'tpope/vim-vinegar'
 Plug 'gioele/vim-autoswap'
 Plug 'morhetz/gruvbox'
 Plug 'garbas/vim-snipmate'
 Plug 'MarcWeber/vim-addon-mw-utils'
 Plug 'tomtom/tlib_vim'
 Plug 'tpope/vim-surround'
 Plug 'ervandew/supertab'
 Plug 'mattn/emmet-vim'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-repeat'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'mhinz/vim-startify'
 Plug 'ludovicchabant/vim-gutentags'
 Plug 'posva/vim-vue'
 call plug#end()






set backspace=indent,eol,start  "Make backspace behave like every other editor.
let mapleader = ','     "The default is \, but a comma is much better.
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set relativenumber
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.
set autowriteall        " Auto write the file when switching buffers.
set complete=.,w,b,u    " Set our desired autocompletion matching.
set grepprg=rg\ --vimgrep
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
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
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
set termguicolors
syntax enable
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast = 'dark'
set tags=tags
set wrap

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
nmap <leader>w :w!<cr>

"Easy escaping to normal model
imap jj <esc>

"Auto change directory to match current file, cd.
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"Down is really the next line.
nnoremap j gj
nnoremap k gk

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Create/edit file in the current directory
nmap :ed :edit %:p:h/

"Edit todo list for project.
nmap ,todo :e todo.txt<cr>





"/
"/FZF
"/
nnoremap <leader>p :Files<cr>
nnoremap <leader>1 :Files ~/Sites/<cr>
nnoremap <leader>2 :Files ~/Code/<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Rg<cr>


" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'left': '~25%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'





"-------------Plugins--------------"
"/
"/ ALE
"/
" Disable linting while typing
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=0
let g:ale_list_window_size = 5
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_fixers = {'javascript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'], 'css': ['prettier'], 'php': ['phpcbf','php_cs_fixer']}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {'php': ['php',' phpcs'], 'javascript': ['eslint']}
let g:ale_linter_aliases = {'jsx': ['css', 'javascript'],}
" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}





"/
"/gutentags
"/
let g:gutentags_cache_dir = '~/.config/nvim/tags'




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
let g:airline_section_y=''                         "Remove unicode information.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#ale#enabled = 1







"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .config/nvim/init.vim source %
augroup END

"Sort PHP use statements
vmap <Leader>Su ! awk '{ print length(), $0\| "sort -n \| cut -d\\ -f2-"extends}'<cr>

" Change syntax highlighting to html for vue files
" autocmd BufRead,BufNewFile *.vue setfiletype html


"Apply coding standards with phpcsfixer
command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
map <c-s> <esc>:w<cr>:Silent php-cs-fixer fix %:p --level=PSR2<cr>

 " Notes and other stuff
 " If I hit % inside of Vinegar I can create a new file
 " If I hit d I can create a new directory.
 " If I hit D I can delete the directory or file.

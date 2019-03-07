" Vim Plug
 call plug#begin('~/.config/nvim/plugged')
 Plug 'neomake/neomake'
 Plug 'sheerun/vim-polyglot'
 Plug '/usr/local/opt/fzf'
 Plug 'junegunn/fzf.vim'
 Plug 'tpope/vim-vinegar'
 Plug 'gioele/vim-autoswap'
 Plug 'haishanh/night-owl.vim'
 Plug 'garbas/vim-snipmate'
 Plug 'MarcWeber/vim-addon-mw-utils'
 Plug 'tomtom/tlib_vim'
 Plug 'tpope/vim-surround'
 Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
 Plug 'ncm2/ncm2'
 Plug 'roxma/nvim-yarp'
 Plug 'phpactor/ncm2-phpactor'
 Plug 'ervandew/supertab'
 Plug 'mattn/emmet-vim'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-repeat'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
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

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
" Change from : to ;
nnoremap ; :
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

"-------------Visuals--------------"
set termguicolors
syntax enable
set background=dark
colorscheme night-owl
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

"Resize vsplit.
nmap <C-v> :vertical resize +5<cr>
nmap 50 <c-w>=


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
"/ phpactor
"/
"Completion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set ofu=syntaxcomplete#Complete
autocmd FileType php setlocal omnifunc=phpactor#Complete
let g:phpactorOmniError = v:true
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" PHPActor config
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>






"/
"/ neomake
"/
" Neomake config
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)



"/
"/ php-namespace
"/
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>




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




"/
"/ php-cs-fixer
"/
let g:php_cs_fixer_rules = "@PSR2"


"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .config/nvim/init.vim source %
augroup END

"Sort PHP use statements
vmap <Leader>Su ! awk '{ print length(), $0\| "sort -n \| cut -d\\ -f2-"extends}'<cr>

" Change syntax highlighting to html for vue files
autocmd BufRead,BufNewFile *.vue setfiletype html

" Auto fix on save php-cs-fixer
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()


 " Notes and other stuff
 " If I hit % inside of Vinegar I can create a new file
 " If I hit d I can create a new directory.
 " If I hit D I can delete the directory or file.

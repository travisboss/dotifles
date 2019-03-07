syntax enable
set backspace=indent,eol,start  "Make backspace behave like every other editor.
let mapleader = ','     "The default is \, but a comma is much better.
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
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
if (has("termguicolors"))
 set termguicolors
endif
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
nmap <Leader>ev :tabedit $VIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/

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

"-------------Plugins--------------"
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
"/ fzf
"/
" Remap Files search
nnoremap <leader>p :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>t :Tags<cr>
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'up': '~40%' }
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)





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




" Vim Plug
call plug#begin('~/.vim/plugged')
 Plug 'VundleVim/Vundle.vim'
 Plug 'tpope/vim-vinegar'
 Plug 'stephpy/vim-php-cs-fixer'
 Plug 'gioele/vim-autoswap'
 Plug 'haishanh/night-owl.vim'
 Plug 'garbas/vim-snipmate'
 Plug 'MarcWeber/vim-addon-mw-utils'
 Plug 'tomtom/tlib_vim'
 Plug 'tpope/vim-surround'
 Plug 'StanAngeloff/php.vim'
 Plug 'arnaud-lb/vim-php-namespace'
 Plug 'ervandew/supertab'
 Plug '/usr/local/opt/fzf'
 Plug 'junegunn/fzf.vim'
 Plug 'pbogut/fzf-mru.vim'
 Plug 'mattn/emmet-vim'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-repeat'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 call plug#end()


 " Notes and other stuff
 " If I hit % inside of Vinegar I can create a new file
 " If I hit d I can create a new directory.
 " If I hit D I can delete the directory or file.

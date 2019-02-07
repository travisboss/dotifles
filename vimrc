so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                          "Make backspace behave like every other editor.
let mapleader = ',' 				    		    	"The default is \, but a comma is much better.
set number	                							"Let's activate line numbers.
set relativenumber                                      "Turn on relative numbering
set noerrorbells visualbell t_vb=   					"No damn bells!
set autowriteall                        				"Automatically write the file when switching buffers.
set complete=,w,b,u                     				"Set our desired autocomplete matching.
set tabstop=4
set smarttab
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent
set copyindent
set ignorecase
set smartcase
set visualbell
set shell=/bin/zsh
nmap <Leader>t :terminal<cr>


"-------------Visuals--------------"
colorscheme night-owl
set guioptions-=e
set t_CO=256						           		"Use 256 colors. This is useful for Terminal Vim.
set linespace=15   						            "Macvim-specific line-height.
set guioptions-=l                                   "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R
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
nmap <Leader>ev :tabedit $MYVIMRC<cr>
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

"Make NERDTree easier to toggle.
nmap <C-b> :NERDTreeToggle<cr>

nmap <C-p> :CtrlP<cr>
nmap <C-R> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>

"Create/edit file in the current directory
nmap :ed :edit %:p:h/

"Open Bookmarked Projects in NERDTree
nmap <Leader>nd :NERDTree 

"Edit todo list for project.
nmap ,todo :e todo.txt<cr>

"-------------Plugins--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/
"/NERDTree
"/
let NERDTReeHijackNetrw = 0

"/
"/Greplace.vim
"/
set grepprg=ag								"We want to use Ag search

let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/vim-airline
"/
let g:airline#extensions#tabline#enabled = 1       "vim-airline taking over tabs
let g:airline_powerline_fonts = 1                  "Enable powerline fonts.
let g:airline_highlighting_cache = 1               "Cache highlighting.
let g:airline#extensions#tabline#enabled = 1       "Display buffers.
let g:airline_detect_paste=1                       "Detect paste.
let g:airline#extensions#whitespace#enabled = 0    "Do not detect whitespace.
let g:airline_section_y=''                         "Remove unicode information.

"/
"/vim-airline-themes
"/

" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 2

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'true'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'always'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
let g:prettier#config#parser = 'flow'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'

" css|strict|ignore
let g:prettier#config#html_whitespace_sensitivity = 'css'



"-------------Laravel-Specific--------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>v :CtrlP<cr>resources/views/<cr>

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

"Sort PHP use statements
vmap <Leader>Su ! awk '{ print length(), $0\| "sort -n \| cut -d\\ -f2-"extends}'<cr>


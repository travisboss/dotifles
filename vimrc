so ~/.vim/plugins.vim
set rtp+=/usr/local/opt/fzf

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
if (has("termguicolors"))
 set termguicolors
endif
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
nmap <Leader>ev :tabedit ~/.vimrc<cr>
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
"/vim-airline
"/
let g:airline#extensions#tabline#enabled = 1       "vim-airline taking over tabs
let g:airline_powerline_fonts = 1                  "Enable powerline fonts.
let g:airline_highlighting_cache = 1               "Cache highlighting.
let g:airline#extensions#whitespace#enabled = 0    "Do not detect whitespace.
let g:airline_section_y=''                         "Remove unicode information.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0






"/
"/FZF
"/
" Open files
nmap <leader>p :Files~<cr>
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'left': '~40%' }
" [tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')




"/
"/ ack
"/
" Use Ag if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif





"/
"/ php-cs-fixer
"/
" Fix PHP on save
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_config_file = '~/.config/nvim/.php_cs'

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" Call php_cs_fixer
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

" Change syntax highlighting to html for vue files
autocmd BufRead,BufNewFile *.vue setfiletype html

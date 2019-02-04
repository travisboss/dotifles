so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	"The default is \, but a comma is much better.
set nonumber								"Let's activate line numbers.
set noerrorbells visualbell t_vb=					"No damn bells!
set autowriteall                        				"Automatically write the file when switching buffers.
set complete=,w,b,u                     				"Set our desired autocomplete matching.
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4


"-------------Visuals--------------"
colorscheme night-owl
set guioptions-=T
set t_CO=256								"Use 256 colors. This is useful for Terminal Vim.
set linespace=15   						        "Macvim-specific line-height.
set guioptions-=l                                                       "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R

"We will fake left column padding.
hi LineNr guibg=bg
set foldcolumn=2
hi foldcloumn guibg=bg

"Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg
"-------------Search--------------"
set hlsearch								"Highlight all matched terms.
set incsearch								"Incrementally highlight, as we type.

"-------------Split Management--------------"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"-------------Mappings--------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle.
nmap <C-x> :NERDTreeToggle<cr>

nmap <C-p> :CtrlP<cr>
nmap <C-R> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>




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
"/vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"                   " options: --level (default:symfony)
let g:php_cs_fixer_config = "default"               "Default configuration path
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>


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

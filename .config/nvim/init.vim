call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'buoto/gotests-vim'
Plug 'rust-lang/rust.vim'
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

set autoread
set backspace=indent,eol,start
set colorcolumn=250
set expandtab
set exrc
set encoding=utf-8
set hidden
set history=1000
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set nobackup
set nocompatible
set noswapfile
set nowb
set number
set pastetoggle=<F2>
set scrolloff=20
set secure
set shiftwidth=4
set shiftround
set shortmess+=I
set showcmd
set showmode
"new splits will be at the bottom or to the right side of the screen
set splitbelow
set splitright
set tabstop=4
set ttyfast
"time waited for key press(es) to complete. It makes for a faster key response
set ttimeout
set ttimeoutlen=50
set wildmenu
set wildmode=list:longest,full
set visualbell

"Code folding
set foldmethod=syntax
set foldlevel=1
set foldnestmax=1

filetype plugin on
syntax on

"let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="hard"
colorscheme gruvbox

""" Statusline bits
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%t\                                "File+path
set statusline+=%3*\ %y\                                  "FileType
set statusline+=%4*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%5*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%6*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%7*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ %m%r%w\                             "Modified? Readonly? Top/bot.
"""
let g:deoplete#enable_at_startup = 1
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }

""" BEGIN GOLANG

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_gopls_gofumpt=1

let g:go_fmt_command="gopls"
"let g:go_fmt_command = "goimports" " Goimports is slow with modules, when module not found

" By default syntax-highlighting for Functions, Methods and Structs is disabled
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1

" Auto-space Go files
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" vim-go mappings
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>d <Plug>(go-def)

" Go implements (interfaces under cursor)
au FileType go nmap <Leader>s <Plug>(go-implements)
" Go show type info under cursor
au FileType go nmap <Leader>i <Plug>(go-info)
" Go rename
au FileType go nmap <Leader>e <Plug>(go-rename)
" Go vet
au FileType go nmap <Leader>v <Plug>(go-vet)
" Godoc under cursor
au FileType go nmap <Leader>k <Plug>(go-doc)

""" END GOLANG

""""" Bugfixes and oddities below
" Fix weird JSON quotation issue
let g:vim_json_syntax_conceal = 0

" Only do this part when compiled with support for autocommands
if has("autocmd")
	" Enable file type detection
	filetype on

	" Wrap text in markdown
	au BufRead,BufNewFile *.md setlocal textwidth=80

	" Syntax of these languages is fussy over tabs Vs spaces
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

	" Customisations based on house-style (arbitrary)
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

	" Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" \cd change working directory to current location of file
map <leader>cd :cd %:p:h<CR>

" Rust
let g:rustfmt_autosave = 1

" Toggle indent guides for copy/paste
"map <silent> <F8> :IndentLinesToggle<CR>

" Disable mouse automatic mode
set mouse-=a

" Enable line numbers toggle
noremap <leader>n :set invnumber<CR>
"inoremap <leader>n <C-O>:set invnumber<CR>

" Enable Ripgrep formatting for vim
let g:rg_command = 'rg --vimgrep -S'

""" BEGIN CPP
map <C-K> :pyf /usr/share/clang/clang-format.py<cr>

function! Formatonsave()
	let l:formatdiff = 1
	pyf /usr/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

if executable('clangd')
	augroup lsp_clangd
		autocmd!
		autocmd User lsp_setup call lsp#register_server({
					\ 'name': 'clangd',
					\ 'cmd': {server_info->['clangd']},
					\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
					\ })
		autocmd FileType c setlocal omnifunc=lsp#complete
		autocmd FileType cpp setlocal omnifunc=lsp#complete
		autocmd FileType objc setlocal omnifunc=lsp#complete
		autocmd FileType objcpp setlocal omnifunc=lsp#complete
	augroup end
endif

""" END CPP

""" ToggleBackground
function! Switch_background()
    if &background == "light"
        set background=dark
    else
        set background=light
    endif
endfunction
noremap <leader>l :call Switch_background()<CR>

" checks that vim-plug is installed and installs it if not
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" make sure to install vim-plug for these
call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/viminspector'

" visual
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/lightline.vim'



call plug#end()

" enable builtin matchit pack to extend % functionality
packadd! matchit

" Basic rc
set nocompatible
set showtabline=2
set laststatus=2
set path+=**
set wildmenu
set showcmd
set expandtab
set sts=4
set tabstop=4
set shiftwidth=4
set number
set norelativenumber
set hlsearch
set noic
set ruler
set autoindent
set mouse=v
syntax on
filetype on
filetype indent on
filetype plugin on

set undofile
set undodir=~/.vim/undo
set undolevels=10000

" ignore various lib dirs
set wildignore+=**/dist-newstyle/**
set wildignore+=**/node_modules/**
set wildignore+=**/dist/**

" quick dir switch
nnoremap <leader>cd :cd %:p:h<CR>

" jellybeans config
highlight Comment cterm=italic
let g:jellybeans_use_term_italics = 1
colo jellybeans

" lightline coc integration
let g:lightline = 
\ {
\   'active': {
\       'left': [ [ 'mode', 'paste' ],
\                 [ 'cocstatus', 'readonly', 'filename', 'modified', 'relativepath' ] ]
\   },
\   'component_function': {
\       'cocstatus': 'coc#status'
\   }
\ }
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" airline config
" loved this, but it didn't play well with coc.nvim
" let g:airline#extensions#coc#enabled = 0
" let g:airline_section_x = '%-0.20{getcwd()}'
" let g:airline_section_y = '%{strftime("%b %d %X")}'

" vim-javascript config
" interesting...
let g:javascript_plugin_flow = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
set conceallevel=1

" javascript-libraries-syntax config
let g:used_javascript_libs = 'jquery,angular,react'

" vim-go
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1


" vim-terraform
let g:terraform_align=1

" CoC
let g:coc_global_extension = ['coc-tsserver', 'coc-json', 'coc-git']
nmap <silent> gl <Plug>(coc-definition)
nmap <silent> gh :call CocAction('doHover')<CR>
nmap <silent> ga <Plug>(coc-codeaction)
nmap <silent> gi <Plug>(coc-implementation)
" see https://github.com/neoclide/coc.nvim#example-vim-configuration
hi! CocErrorSign guifg=#ffbb99



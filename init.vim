
call plug#begin('~/.vim/plugged')
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-sensible'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

set background=dark
set go=a
set nohlsearch
set clipboard+=unnamedplus
set nocompatible
set mouse=a
syntax on
"" Enable normal mode keys in russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" basics
    "" tabs
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set encoding=utf-8
    "" more usable regular search 
    set incsearch
    filetype plugin on
    syntax enable
    set ruler
    set relativenumber number
    "" autocomplete
    set wildmenu
    set wildmode=longest,list
    set hlsearch
    "" path search 
    set path+=**

    " Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o 


    " sudo write to files demanding root permision
    cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

    " airline config
    let g:airline_section_b = ''
    let g:airline_section_x = ''
    let g:airline_section_y = ''
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

    " syntastic
    set statusline+=%f
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_c_checkers=['make', 'splint', 'gcc']
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_warning_symbol = '⚠️'

    "Ctrlp matcher
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

    " Indents highlight
    hi IndentGuidesOdd  guibg=#0E1026 ctermbg=235
    hi IndentGuidesEven guibg=#343438 ctermbg=237
    let g:indent_guides_space_guides = 1
    let g:indent_guides_enable_on_vim_startup = 1

    " Speed
    let g:airline_highlighting_cache=1
    set ttyfast
    set lazyredraw
    "YouCompleteMe
    let g:ycm_python_binary_path = 'python3'
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
    " Buffers
    set hidden 
    
    " New empty buffer
    nmap <leader>T :enew<cr>

    " Next buffer
    nmap <leader>l :bprevious<CR>

    " Previous buffer   
    nmap <leader>h :bprevious<CR>

    " Close current buffer & go to previous one
    nmap <leader>bq :bp <BAR> bd #<CR>

    " Show all buffers and their status
    nmap <leader>bl :ls<CR>

    " Ignores 
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
      \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
    \}
    " control. It also supports works with .svn, .hg, .bzr.
    let g:ctrlp_working_path_mode = 'r'
    " Use a leader instead of the actual named binding
    nmap <leader>p :CtrlP<cr>

    " Easy bindings for its various modes
    nmap <leader>bb :CtrlPBuffer<cr>
    nmap <leader>bm :CtrlPMixed<cr>
    nmap <leader>bs :CtrlPMRU<cr>

   " Use the right side of the screen
    let g:buffergator_viewport_split_policy = 'R'

    " I want my own keymappings...
    let g:buffergator_suppress_keymaps = 1

    " Looper buffers
    "let g:buffergator_mru_cycle_loop = 1

    " Go to the previous buffer open
    nmap <leader>jj :BuffergatorMruCyclePrev<cr>

    " Go to the next buffer open
    nmap <leader>kk :BuffergatorMruCycleNext<cr>

    " View the entire list of buffers open
    nmap <leader>bl :BuffergatorOpen<cr>

    " Shared bindings from Solution #1 from earlier
    nmap <leader>T :enew<cr>
    nmap <leader>bq :bp <BAR> bd #<cr> 


call plug#begin('~/.vim/plugged')
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'crusoexia/vim-dracula'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-sensible'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'Shirk/vim-gas'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

colorscheme dracula
set background=dark
set go=a
set nohlsearch
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE
set clipboard+=unnamedplus
set nocompatible
set mouse=a
syntax on
"" Enable normal mode keys in russian layout
set langmap=–§–ò–°–í–£–ê–ü–†–®–û–õ–î–¨–¢–©–ó–ô–ö–´–ï–ì–ú–¶–ß–ù–Ø;ABCDEFGHIJKLMNOPQRSTUVWXYZ,—Ñ–∏—Å–≤—É–∞–ø—Ä—à–æ–ª–¥—å—Ç—â–∑–π–∫—ã–µ–≥–º—Ü—á–Ω—è;abcdefghijklmnopqrstuvwxyz
" basics
    "" tabs
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set encoding=utf-8
    "" more usable regular search 
        filetype plugin on
    syntax enable
    set ruler
    set relativenumber number
    "" autocomplete
    set wildmenu
    set wildmode=longest,list
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

    " Previous buffer   
    nmap <leader>h :bprevious<CR>

    " Next buffer
    nmap <leader>l :bnext<CR>


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

    au! BufRead,BufNewFile *.markdown set filetype=mkd
    au! BufRead,BufNewFile *.md       set filetype=mkd

    " ale
    let b:ale_linters = ['eslint']

    set omnifunc=ale#completion#OmniFunc

" CoC
" set tagfunc=CocTagFunc
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" dict

if has('unix')
    set dictionary+=/usr/share/dict/words
else
    set dictionary+=~/AppData/Local/nvim/words
endif

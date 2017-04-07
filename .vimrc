set t_Co=256
set background=dark
color tender
syntax enable
match ErrorMsg '\s\+$'
set number
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set backspace=2
set hlsearch
set nowrap
set mouse=a
" set clipboard=unnamedplus
nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" JSX
let g:jsx_ext_required = 0
" Tern
let g:tern_map_keys = 1
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
autocmd FileType javascript setlocal omnifunc=tern#Complete
set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin indent on

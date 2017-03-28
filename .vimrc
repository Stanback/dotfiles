color apprentice
syntax enable
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

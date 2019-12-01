" indent using spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
" splitbelow and right
set splitbelow splitright
" make path recursive
set path=**
" Set the default shell
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif
set foldmethod=indent
set nofoldenable

syntax on
filetype plugin indent on
" Relative line numbers
:set number relativenumber
:augroup numbertoggle
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Number of lines between cursor and scroll
set scrolloff=4

set hidden

""" AUTOCOMMANDS
autocmd! BufLeave,BufHidden ~/.config/nvim/init.vim :so ~/.config/nvim/init.vim
" clear trailling whitespace
autocmd! BufWritePre * %s/\s\+$//e
autocmd! BufNewFile,BufRead *.spell set syntax=sh

autocmd BufEnter *.sh    inoremap ,bb #!/bin/sh<Esc>o
autocmd BufEnter *.spell inoremap ,bb #!/bin/sh<Esc>o

autocmd! BufEnter *.js set shiftwidth=2

autocmd! TermEnter * setlocal nonumber
autocmd! TermEnter * setlocal norelativenumber
autocmd! TermEnter * autocmd! numbertoggle

highlight ColorColumn ctermbg=Black
set colorcolumn=101
highlight Normal ctermbg=None

set undodir=~/.cache/vimundo
set undofile

iabbrev ture true
iabbrev stirng string
iabbrev Stirng String
iabbrev tho though
autocmd! FileType c iabbrev use #include <
autocmd! FileType cpp iabbrev use #include <
autocmd! FileType rust iabbrev if if<++> {<++>},,
autocmd! FileType c iabbrev if if (<++>) {<++>},,

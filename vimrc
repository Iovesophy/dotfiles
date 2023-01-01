"vim-plug Start.  https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
" python https://vimawesome.com/plugin/python-mode
Plug 'klen/python-mode'
call plug#end()
" vim-plug Fin.
" init.vim quick setting
nnoremap <Space>.
            \   :<C-u>edit $MYVIMRC<CR>
" init.vim quick setting
" env settings
set shiftwidth=4
set tabstop=4
set expandtab
set clipboard+=unnamed " clipboard enable
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
set cursorline
set cursorcolumn
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
set title
set nofoldenable
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
nnoremap j gj
nnoremap k gk
syntax enable
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" env settings
" for yaml tab space
set expandtab smarttab
augroup yaml-tab
    autocmd!
    autocmd BufRead,BufNewFile *.yml,*.yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup end

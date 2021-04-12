"vim-plug Start.  https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'lambdalisue/gina.vim'
call plug#end()
" vim-plug Fin.
nnoremap <Space>.
            \   :<C-u>edit $MYVIMRC<CR>
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
nnoremap j gj
nnoremap k gk
syntax enable
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" env settings

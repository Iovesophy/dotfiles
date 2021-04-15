"vim-plug Start.  https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
" ruby https://vimawesome.com/plugin/vim-ruby
Plug 'vim-ruby/vim-ruby'
" python https://vimawesome.com/plugin/python-mode
Plug 'klen/python-mode'
" C#
Plug 'OmniSharp/omnisharp-vim'
" markdown
Plug 'plasticboy/vim-markdown'
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'
Plug 'lambdalisue/gina.vim'
call plug#end()
" vim-plug Fin.
" esc
noremap <C-f> <esc>
noremap! <C-f> <esc>
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
nnoremap j gj
nnoremap k gk
syntax enable
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" env settings
" kannokanno/previm
autocmd BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'
nnoremap <silent> <C-p> :PrevimOpen<CR>
" tyru/open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

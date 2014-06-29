execute pathogen#infect()

if has("unix")
    let home="~/"
endif

set noswapfile

autocmd!

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
set history=10000
set ignorecase
set scrolloff=5
set bs=2
set shortmess=a
set tabstop=8
set shiftwidth=2
set noshowcmd
set nobackup
set hlsearch
set incsearch
set smarttab
set expandtab
set wildmode=longest:list
set wmnu
set nu
set sb
set spr
set notitle
:noh
set wildignore=*.o,*.class,*.so,*.so.*,*.a,*.tar,*.tgz,*.gz,*.tbz2,*.rpm,*.zip,*.ZIP,*.gif,*.GIF,*.jpeg,*.jpg,*.JPEG,*.JPG,*.mp3,*.MP3,*.mpg,*.MPG,*.avi,*.AVI,*.asf,*.ASF,*.ogg,*.OGG,*.aux,*.log,*.bbl,*.blg,*.brf,*.cb,*.ind,*.idx,*.ilg,*.inx,*.ps,*.dvi,*.pdf,*.toc,*.bak,*.png
set ruler
set laststatus=2
set nowrap
set nomodeline
set viminfo='1000,f1,\"500,:1000,%,n~/.viminfo
set pastetoggle=<F10>
set updatetime=1000
set completeopt=menu,preview,longest
set switchbuf+=useopen

autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
autocmd InsertLeave * let &l:foldmethod=w:last_fdm

" *** SPECIAL KEY HANDLING
" Map the special currency symbol (see ~/.bashrc) to <S-CR>
imap ¤ <S-CR>
" ***

nnoremap <silent> <C-n>	:noh<CR>

nnoremap <silent> ,1		:call common_jumplist#PushLocation()<CR>1<C-w>w
nnoremap <silent> ,2		:call common_jumplist#PushLocation()<CR>2<C-w>w
nnoremap <silent> ,3		:call common_jumplist#PushLocation()<CR>3<C-w>w
nnoremap <silent> ,4		:call common_jumplist#PushLocation()<CR>4<C-w>w
nnoremap <silent> ,5		:call common_jumplist#PushLocation()<CR>5<C-w>w
nnoremap <silent> ,6		:call common_jumplist#PushLocation()<CR>6<C-w>w
nnoremap <silent> ,7		:call common_jumplist#PushLocation()<CR>7<C-w>w
nnoremap <silent> ,8		:call common_jumplist#PushLocation()<CR>8<C-w>w
nnoremap <silent> ,9		:call common_jumplist#PushLocation()<CR>9<C-w>w

inoremap ^] ^X^]
inoremap ^F ^X^F
inoremap ^D ^X^D
inoremap ^L ^X^L

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nmap ,e :e <C-R>=expand("%:p:h") . "/" <CR>
nmap ,sp :sp <C-R>=expand("%:p:h") . "/" <CR>
nmap ,r :r <C-R>=expand("%:p:h") . "/" <CR>

" *** SPELLING ***
inoremap <F7> <C-\><C-O>:setlocal spelllang=en_gb spell! spell?<CR>
map <F7> :setlocal spell! spelllang=en_gb<CR>
hi SpellBad term=reverse ctermfg=white ctermbg=darkred guifg=#ffffff guibg=#7f0000 gui=underline
hi SpellCap term=reverse ctermfg=white ctermbg=darkblue guifg=#ffffff guibg=#7f007f
hi SpellRare term=reverse ctermfg=white ctermbg=darkyellow guifg=#ffffff guibg=#00007f gui=underline
hi SpellLocal term=reverse ctermfg=black ctermbg=darkgreen guifg=#ffffff guibg=#7f0000 gui=underline
" ***

" *** COLOURS ***
colorscheme sahara
hi MatchParen ctermbg=241
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" ***

" *** GIT
nnoremap ,gD :diffoff!<cr>:execute "bdelete fugitive://*".expand("%:p:t")<cr>
" ***

" *** Airline
let g:airline_theme='bubblegum'
let g:airline#extensions#whitespace#checks=[]
let g:airline#extensions#tagbar#enabled = 1
" ***

" *** Ctrlp
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](([^\/]+\/)*node_modules|([^\/]+\/)*bower_components|([^\/]+\/)*vendor/bundle|([^\/]+\/)*tmp/cache/assets)$|_site'
  \ }
let g:ctrlp_working_path_mode=''
" ***

let g:ackprg="ack-grep -H --nocolor --nogroup --column --ignore-dir=node_modules --ignore-dir=bower_components"


" *** Strip trailing white space
autocmd BufWritePre * call StripTrailingWhite()
function! StripTrailingWhite()
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction
" ***

" *** DEBUG
" tell me which syntax highlighting rule applies to symbol under cursor
" map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" *** Autoclose qf window when window closes
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END
" ***

" *** Tagbar
nmap <F8> :TagbarToggle<CR>
hi TagbarHighlight term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
" ***

" *** IndentGuides
let g:indent_guides_default_mapping=0
" ***

" Always make quickfix window split right across the very bottom
autocmd FileType qf wincmd J


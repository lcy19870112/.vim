execute pathogen#infect()

if has("unix")
    let home="~/"
endif

set noswapfile

autocmd!

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby

" ** PLUGIN ** variables
"set iskeyword+=:
set history=5000

set autowriteall
set ignorecase

" I want to be able to see the text at the
" bottom of the screen
set scrolloff=5

" " ?
set bs=2

" " those annoying Hit enter to continue messages
set shortmess=a

" " normal settings
set tabstop=8
set shiftwidth=2

autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal ts=3
autocmd FileType go setlocal sw=3
autocmd FileType go let g:indent_guides_enable_on_vim_startup = 0
autocmd FileType go hi IndentGuidesOdd  ctermbg=NONE
autocmd FileType go hi IndentGuidesEven  ctermbg=NONE
" show command in status line
set noshowcmd

" we don't want those bloody backup files
set nobackup

" highligh our search
set hlsearch

" While typing a search pattern, show
" immediately where the so far
" typed pattern matches
set incsearch

" at beginning of line, Tab inserts spaces
" according to shiftwidth. See :help sta
" This needs to be off for makefiles
set smarttab
set expandtab

" on what characters vi should break (with
" set wrap in particular)
"set brk=" I!*-+;:,./?"

" basically get the file / option / etc
" completion to act like the shell
set wildmode=longest:list

" effectively a shell window for file /
" option / etc completion
set wmnu

" turn on line numbers
set nu

" always split below for :split command
set sb " split below

" like above, split to the right and not the
" left
set spr

" let the terminal set the title and not vi
set notitle

" turn off search highlighting for initial load
" of file
:noh

" **************    MAPS    *****************

" turn of highlighting (not syntax) post search
nnoremap <silent> <C-n>	:noh<CR>

" maps to move between split windows
nnoremap <silent> ,1		:call common_jumplist#PushLocation()<CR>1<C-w>w
nnoremap <silent> ,2		:call common_jumplist#PushLocation()<CR>2<C-w>w
nnoremap <silent> ,3		:call common_jumplist#PushLocation()<CR>3<C-w>w
nnoremap <silent> ,4		:call common_jumplist#PushLocation()<CR>4<C-w>w
nnoremap <silent> ,5		:call common_jumplist#PushLocation()<CR>5<C-w>w
nnoremap <silent> ,6		:call common_jumplist#PushLocation()<CR>6<C-w>w
nnoremap <silent> ,7		:call common_jumplist#PushLocation()<CR>7<C-w>w
nnoremap <silent> ,8		:call common_jumplist#PushLocation()<CR>8<C-w>w
nnoremap <silent> ,9		:call common_jumplist#PushLocation()<CR>9<C-w>w

" it is annoying skipping past many lines when wrap is on
" nnoremap j gj
" nnoremap k gk
" vnoremap j gj
" vnoremap k gk
" nnoremap <Down> gj
" nnoremap <Up> gk
" vnoremap <Down> gj
" vnoremap <Up> gk
" inoremap <Down> <C-o>gj
" inoremap <Up> <C-o>gk

" bindings useful for completion
inoremap ^] ^X^]
inoremap ^F ^X^F
inoremap ^D ^X^D
inoremap ^L ^X^L

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" when searching for files, we ignore all the
" following (taken from bash completion)
set wildignore=*.o,*.class,*.so,*.so.*,*.a,*.tar,*.tgz,*.gz,*.tbz2,*.rpm,*.zip,*.ZIP,*.gif,*.GIF,*.jpeg,*.jpg,*.JPEG,*.JPG,*.mp3,*.MP3,*.mpg,*.MPG,*.avi,*.AVI,*.asf,*.ASF,*.ogg,*.OGG,*.aux,*.log,*.bbl,*.blg,*.brf,*.cb,*.ind,*.idx,*.ilg,*.inx,*.ps,*.dvi,*.pdf,*.toc,*.bak,*.png

" not sure I need this anymore
set ruler

" every window always has a statusline
set laststatus=2

" jump to matching bracket on insertion
" (handy when working on code)
" set showmatch

" never wrap (except for help and tip
" of the day)
set nowrap

" neat little script to reverse a block, range of file
"command! -nargs=0 -bar -range=% Reverse
                        "\ <line2>ka<bar>
                        "\ <line1>,<line2>g/^/m'a

" open file in same directory for deeply nested dirs
nmap ,e :e <C-R>=expand("%:p:h") . "/" <CR>
nmap ,sp :sp <C-R>=expand("%:p:h") . "/" <CR>
nmap ,r :r <C-R>=expand("%:p:h") . "/" <CR>
"nmap <Leader>t :CtrlP<CR>


" apparently there is still a bug that allows an unsuspecting
" user to open a worm file....
set nomodeline

" highlighting of certain stuff
"highlight StatusLine cterm=bold ctermbg=Blue ctermfg=White
"highlight StatusLineNC cterm=NONE ctermbg=DarkGrey ctermfg=Grey

" to restore cursor position in a file
set viminfo='1000,f1,\"500,:1000,%,n~/.viminfo

func Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789abcdef'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc

command -nargs=0 GotoDir execute "cd " . expand("%:p:h")
"au BufEnter * silent GotoDir

augroup ruby
  set omnifunc=rubycomplete#Complete
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_classes_in_global = 1
  let g:rubycomplete_include_object = 1
  let g:rubycomplete_include_objectspace = 1

  set foldmethod=syntax
  set foldlevelstart=99
  map <F6> :SyntasticCheck rubocop<CR>
augroup END

" paste toggle
set pastetoggle=<F10>

" spelling toggle
inoremap <F7> <C-\><C-O>:setlocal spelllang=en_gb spell! spell?<CR>
map <F7> :setlocal spell! spelllang=en_gb<CR>

hi SpellBad term=reverse ctermfg=white ctermbg=darkred guifg=#ffffff guibg=#7f0000 gui=underline
hi SpellCap term=reverse ctermfg=white ctermbg=darkblue guifg=#ffffff guibg=#7f007f
hi SpellRare term=reverse ctermfg=white ctermbg=darkyellow guifg=#ffffff guibg=#00007f gui=underline
hi SpellLocal term=reverse ctermfg=black ctermbg=darkgreen guifg=#ffffff guibg=#7f0000 gui=underline

" Map the special currency symbol (see ~/.bashrc) to <S-CR>
imap ¤ <S-CR>

colorscheme sahara

hi MatchParen ctermbg=241

nnoremap ,gD :diffoff!<cr>:execute "bdelete fugitive://*".expand("%:p:t")<cr>

let g:airline_theme='bubblegum'
let g:airline#extensions#whitespace#checks=[]

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=1
hi IndentGuidesOdd  ctermbg=NONE
hi IndentGuidesEven  ctermbg=241

autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
autocmd InsertLeave * let &l:foldmethod=w:last_fdm

let g:ctrlp_map = '<Leader>t'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](([^\/]+\/)*node_modules|([^\/]+\/)*bower_components|([^\/]+\/)*vendor/bundle|([^\/]+\/)*tmp/cache/assets)$|_site'
  \ }
let g:ctrlp_working_path_mode=''

let g:ackprg="ack-grep -H --nocolor --nogroup --column --ignore-dir=node_modules --ignore-dir=bower_components"

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd BufWritePre * call StripTrailingWhite()

function! StripTrailingWhite()
    let l:winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(l:winview)
endfunction

let g:syntastic_enable_signs=1
let g:syntastic_mode_map = { 'mode': 'passive'  }
map <F5> :SyntasticCheck<CR>:Errors<CR>

" tell me which syntax highlighting rule applies to symbol under cursor
" map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:airline#extensions#tagbar#enabled = 1
let g:godef_same_file_in_same_window = 1
set updatetime=1000

set completeopt=menu,preview,longest

hi TagbarHighlight term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
autocmd FileType go nested :TagbarOpen
set switchbuf+=useopen


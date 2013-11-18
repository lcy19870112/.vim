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
map <C-n>	:noh<CR>

" maps to move between split windows
map ,1		1<C-w>w
map ,2		2<C-w>w
map ,3		3<C-w>w
map ,4		4<C-w>w
map ,5		5<C-w>w
map ,6		6<C-w>w
map ,7		7<C-w>w
map ,8		8<C-w>w
map ,9		9<C-w>w

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

" hi MatchParen ctermbg=lightblue guibg=lightblue

colorscheme sahara

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
  \ 'dir':  '\v[\/](([^\/]+\/)*node_modules|([^\/]+\/)*bower_components|([^\/]+\/)*vendor/bundle|([^\/]+\/)*tmp/cache/assets)$'
  \ }
let g:ctrlp_working_path_mode=''

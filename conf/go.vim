" *** General
au FileType go setlocal noexpandtab
au FileType go setlocal ts=3
au FileType go setlocal sw=3
let g:indent_guides_enable_on_vim_startup = 0
" :IndentGuidesDisable

" *** vim-gocode
let g:go_gocode_bin="~/gostuff/bin/gocode"
let g:go_goimports_bin="~/gostuff/bin/goimports"
let g:go_godef_bin="~/gostuff/bin/godef"
let g:go_oracle_bin="~/gostuff/bin/oracle"
let g:go_gotags_bin="~/gostuff/bin/gotags"
let g:go_golint_bin="~/gostuff/bin/golint"
let g:go_errcheck_bin="~/gostuff/bin/errcheck"
" ***

func! GoFmtImap()
  let lines_before = line('$')
  let cur_pos = getpos('.')
  :GoFmt
  let lines_after = line('$')
  let line_diff = max([0,cur_pos[1] + lines_after - lines_before])
  let cur_pos[1] = line_diff
  call setpos('.', cur_pos)
endfunc

func! GoImportImap()
  let lines_before = line('$')
  let cur_pos = getpos('.')
  let pkg = input('GoImport ')
  execute ':GoImport ' . pkg
  let lines_after = line('$')
  let line_diff = max([0,cur_pos[1] + lines_after - lines_before])
  let cur_pos[1] = line_diff
  call setpos('.', cur_pos)
endfunc

" imap <C-i> <C-\><C-O>:silent! call GoImportImap()<CR>
au FileType go imap <C-f> <C-\><C-O>:silent! call GoFmtImap()<CR>
au FileType go nmap <Leader>gd <Plug>(go-doc-split)

au BufEnter,FileType go :TagbarOpen

" ***
" GoDef
au FileType go let g:godef_same_file_in_same_window = 1
" ***

" ***
" tag bar
au FileType go let g:tagbar_type_go = {
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
" ***

" ***
" GoDoc
function! FixWindows()
  let cur_win = winnr()
  let cur_cur = getcurpos()
  call tagbar#CloseWindow()
  exec "wincmd ="
  call tagbar#OpenWindow()
  for i in range(1,winnr('$'))
    " we want the quickfix window right at the bottom
    if getbufvar(winbufnr(i), '&filetype') == "godoc"
      exec i."wincmd w"
      resize 10
    endif
  endfor
  exec cur_win."wincmd w"
  call setpos(".", cur_cur)
endfunc

nmap <C-g> :call FixWindows()<CR>
au FileType godoc resize 10


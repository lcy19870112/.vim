setlocal noexpandtab
setlocal ts=3
setlocal sw=3
let g:indent_guides_enable_on_vim_startup = 0
hi IndentGuidesOdd  ctermbg=NONE
hi IndentGuidesEven  ctermbg=NONE

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
imap <C-f> <C-\><C-O>:silent! call GoFmtImap()<CR>

:TagbarOpen

" ************************************
" GoDef
" ************************************
let g:godef_same_file_in_same_window = 1

" ************************************
" Unsed
" ************************************
" let g:tagbar_type_go = {
"     \ 'ctagstype' : 'go',
"     \ 'kinds'     : [
"         \ 'p:package',
"         \ 'i:imports:1',
"         \ 'c:constants',
"         \ 'v:variables',
"         \ 't:types',
"         \ 'n:interfaces',
"         \ 'w:fields',
"         \ 'e:embedded',
"         \ 'm:methods',
"         \ 'r:constructor',
"         \ 'f:functions'
"     \ ],
"     \ 'sro' : '.',
"     \ 'kind2scope' : {
"         \ 't' : 'ctype',
"         \ 'n' : 'ntype'
"     \ },
"     \ 'scope2kind' : {
"         \ 'ctype' : 't',
"         \ 'ntype' : 'n'
"     \ },
"     \ 'ctagsbin'  : 'gotags',
"     \ 'ctagsargs' : '-sort -silent'
" \ }

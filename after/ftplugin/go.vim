
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

imap <C-i> <C-\><C-O>:silent! call GoImportImap()<CR>
imap <C-f> <C-\><C-O>:silent! call GoFmtImap()<CR>

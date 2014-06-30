compiler ruby

if !exists( "*EndToken" )
  function EndToken()
    let current_line = getline( '.' )
    let braces_at_end = '{\s*|\(,\|\s\|\w*|\s*\)\?$'
    if match( current_line, braces_at_end ) >= 0
      return '}'
    else
      return 'end'
    endif
  endfunction
endif

imap <S-CR> <ESC>:execute 'normal o' . EndToken()<CR>O

set omnifunc=rubycomplete#Complete
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1

set foldmethod=syntax
set foldlevelstart=99
map <F6> :SyntasticCheck rubocop<CR>

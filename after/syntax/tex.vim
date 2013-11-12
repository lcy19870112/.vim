" Change syntaxframe to your new math group's name
" \begin{syntaxframe}...\end{syntaxframe}
syn cluster texMathZones add=texMathZoneLOCAL1
syn cluster texMathZones add=texMathZoneLOCAL2
syn region texMathZoneLOCAL1 start="\\begin\s*{\s*DefineSyntax\s*}" end="\\end\s*{\s*DefineSyntax\s*}" keepend contains=@texMathZoneGroup
if !exists("tex_no_math")
    syn sync match texSyncMathZoneLOCAL grouphere texMathZoneLOCAL1 "\\begin\s*{\s*DefineSyntax\*\s*}"
    syn sync match texSyncMathZoneLOCAL groupthere NONE "\\end\s*{\s*DefineSyntax\*\s*}"
endif
hi link texMathZoneLOCAL1 texMath 
syn region texMathZoneLOCAL2 start="\\begin\s*{\s*DefineIdentifiers\s*}" end="\\end\s*{\s*DefineIdentifiers\s*}" keepend contains=@texMathZoneGroup
if !exists("tex_no_math")
    syn sync match texSyncMathZoneLOCAL grouphere texMathZoneLOCAL2 "\\begin\s*{\s*DefineIdentifiers\*\s*}"
    syn sync match texSyncMathZoneLOCAL groupthere NONE "\\end\s*{\s*DefineIdentifiers\*\s*}"
endif
hi link texMathZoneLOCAL2 texMath 

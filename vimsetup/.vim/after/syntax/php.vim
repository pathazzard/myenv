" spell checking in comments
if exists("php_parent_error_open")
    syn region  phpComment  start="/\*" end="\*/" contained contains=@Spell,phpTodo
else
    syn region  phpComment  start="/\*" end="\*/" contained contains=@Spell,phpTodo extend
endif
syn match phpComment  "#.\{-}\(?>\|$\)\@="  contained contains=@Spell,phpTodo
syn match phpComment  "//.\{-}\(?>\|$\)\@=" contained contains=@Spell,phpTodo

syn match phpCamelCase '\<[A-Z][a-z]\{-1,}\(\u\U\{-}\)\{-1,}\>' containedin=phpComment contains=@NoSpell transparent contained

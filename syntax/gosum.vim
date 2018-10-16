" gomod.vim: Vim syntax file for go.mod file
"
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syntax case match

" highlight versions:
"  * vX.Y.Z/go.mod
"  * vX.0.0-yyyyymmddhhmmss-abcdefabcdef/go.mod
"  * vX.Y.Z-pre.0.yyyymmddhhmmss-abcdefabcdef/go.mod
"  * vX.Y.(Z+1)-0.yyyymmddhhss-abcdefabcdef/go.mod
"  * +incompatible suffix when X > 1
" match vX.Y.Z and their prereleases
syntax match gosumVersion "v\d\+\.\d\+\.\d\+\%(-\%(\w\+\.\)\+0\.\d\{14}-\x\+\)\?/go.mod"
" match target when most recent version before the target is X.Y.Z
syntax match gosumVersion "v\d\+\.\d\+\.[1-9]\{1}\d*\%(-0\.\%(\d\{14}-\x\+\)\)\?/go.mod"
" match target without a major version before the commit (e.g.  vX.0.0-yyyymmddhhmmss-abcdefabcdef)
syntax match gosumVersion "v\d\+\.0\.0-\d\{14\}-\x\+/go.mod"

" match vX.Y.Z and their prereleases for X>1
syntax match gosumVersion "v[2-9]\{1}\d\?\.\d\+\.\d\+\%(-\%(\w\+\.\)\+0\.\d\{14\}-\x\+\)\?\%(+incompatible\>\)\?/go.mod"
" match target when most recent version before the target is X.Y.Z for X>1
syntax match gosumVersion "v[2-9]\{1}\d\?\.\d\+\.[1-9]\{1}\d*\%(-0\.\%(\d\{14\}-\x\+\)\)\?\%(+incompatible\>\)\?/go.mod"
" match target without a major version before the commit (e.g.  vX.0.0-yyyymmddhhmmss-abcdefabcdef) for X>1
syntax match gosumVersion "v[2-9]\{1}\d\?\.0\.0-\d\{14\}-\x\+\%(+incompatible\>\)\?/go.mod"

highlight default link gosumVersion Identifier

syntax match gosumChecksum "h1:[A-Za-z0-9+=]{1,50}|=[^=]|={3,}$"
highlight default link gosumChecksum Special

let b:current_syntax = "gosum"

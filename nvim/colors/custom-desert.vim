" Vim color file

if version > 580
  " no guarantees for version 5.8 and below, but this makes it stop
  " complaining
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif
let g:colors_name="desert"

" color terminal definitions
hi SpecialKey ctermfg=darkgreen
hi NonText cterm=bold ctermfg=darkblue
hi Directory ctermfg=darkcyan
hi ErrorMsg cterm=bold ctermfg=7 ctermbg=1
hi IncSearch cterm=NONE ctermfg=yellow ctermbg=green
hi Search cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg ctermfg=darkgreen
hi ModeMsg cterm=NONE ctermfg=brown
hi LineNr ctermfg=3
hi Question ctermfg=green
hi StatusLine cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit cterm=reverse
hi Title ctermfg=5
hi Visual cterm=reverse
hi WarningMsg ctermfg=1
hi WildMenu ctermfg=0 ctermbg=3
hi Folded ctermfg=darkgrey ctermbg=NONE
hi FoldColumn ctermfg=darkgrey ctermbg=NONE
hi DiffAdd ctermbg=4
hi DiffChange ctermbg=5
hi DiffDelete cterm=bold ctermfg=4 ctermbg=6
hi DiffText cterm=bold ctermbg=1
hi Comment ctermfg=darkcyan
hi Constant ctermfg=brown
hi Special ctermfg=5
hi Identifier ctermfg=6
hi Statement ctermfg=3
hi PreProc ctermfg=5
hi Type  ctermfg=2
hi Underlined cterm=underline ctermfg=5
hi Ignore cterm=bold ctermfg=7
hi Ignore ctermfg=darkgrey
hi Error cterm=bold ctermfg=7 ctermbg=1

" Treesitter
hi link TSConstructor Normal
"vim: sw=4

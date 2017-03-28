"   _____ ______   ________  ________   ________  ________  ___      ___ ___  ________
"  |\   _ \  _   \|\   __  \|\   ___  \|\   __  \|\   __  \|\  \    /  /|\  \|\   __  \
"  \ \  \\\__\ \  \ \  \|\  \ \  \\ \  \ \  \|\  \ \  \|\  \ \  \  /  / | \  \ \  \|\  \
"   \ \  \\|__| \  \ \  \\\  \ \  \\ \  \ \   _  _\ \  \\\  \ \  \/  / / \ \  \ \   __  \
"    \ \  \    \ \  \ \  \\\  \ \  \\ \  \ \  \\  \\ \  \\\  \ \    / /   \ \  \ \  \ \  \
"     \ \__\    \ \__\ \_______\ \__\\ \__\ \__\\ _\\ \_______\ \__/ /     \ \__\ \__\ \__\
"      \|__|     \|__|\|_______|\|__| \|__|\|__|\|__|\|_______|\|__|/       \|__|\|__|\|__|


" A Vim colorscheme
" Author:       Alessandro Yorba
" Script URL:   https://github.com/AlessandroYorba/Monrovia
" License:      MIT


" Copyright (c) 2017 Alessandro Yorba
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

"=================================================================================
" MONROVIA TERMINAL COLORS:
"=================================================================================
"     Foreground    #e6e5e5             |      Selection     #7fb1b9             |
"     Background    #252a2f             |      Selected Text #252a2f             |
"     CursorColor   #FFFFFF             |                                        |
"     Bold          #e6e5e5             |                                        |
"     Links         #CB2656             |                                        |
"=================================================================================
" ANSI COLORS:
"=================================================================================
"---------------------------------------|-----------------------------------------
"     NORMAL        Hex          xterm  |      BRIGHT        Hex          xterm  |
"---------------------------------------|-----------------------------------------
"     Black         #252a2f      0      |      brBlack       #586069      8      |
"     Red           #8c3432      1      |      brRed         #8c3432      9      |
"     Green         #006686      2      |      brGreen       #006686      10     |
"     Yellow        #7c94a3      3      |      brYellow      #7c94a3      11     |
"     Blue          #9b5d75      4      |      brBlue        #9b5d75      12     |
"     Magenta       #c24d43      5      |      brMagenta     #c24d43      13     |
"     Cyan          #c7b6a3      6      |      brCyan        #c7b6a3      14     |
"     White         #e6e5e5      7      |      brWhite       #e6e5e5      15     |
"---------------------------------------|-----------------------------------------
"=================================================================================
" SETUP:
"=================================================================================

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="monrovia"

if !exists("g:monrovia_Midnight")
    let g:monrovia_Midnight = 0
endif


"=======================================================================================================================
" COMMON MONROVIA HIGHLIGHTING:
"=======================================================================================================================
highlight! Normal                   guifg=#e6e5e5  guibg=#252a2f  gui=NONE       ctermfg=7     ctermbg=0     cterm=NONE
highlight! LineNr                   guifg=#586069  guibg=NONE     gui=NONE       ctermfg=8     ctermbg=NONE  cterm=NONE
highlight! TabLine                  guifg=NONE     guibg=NONE     gui=NONE       ctermfg=NONE  ctermbg=NONE  cterm=NONE 
highlight! TabLineSel               guifg=#252a2f  guibg=#7c94a3  gui=NONE       ctermfg=0     ctermbg=3     cterm=NONE
highlight! TabLineFill              guifg=#586069  guibg=NONE     gui=underline  ctermfg=8     ctermbg=NONE  cterm=underline
highlight! CursorLine               guifg=NONE     guibg=#22262b  gui=NONE       ctermfg=NONE  ctermbg=0     cterm=NONE
highlight! CursorColumn             guifg=NONE     guibg=#252a2f  gui=NONE       ctermfg=NONE  ctermbg=0     cterm=NONE
highlight! StatusLine               guifg=#e6e5e5  guibg=#586069  gui=NONE       ctermfg=7     ctermbg=8     cterm=NONE
highlight! StatusLineNC             guifg=#252a2f  guibg=#586069  gui=NONE       ctermfg=0     ctermbg=8     cterm=NONE
highlight! VertSplit                guifg=#586069  guibg=NONE     gui=NONE       ctermfg=8     ctermbg=0     cterm=NONE
highlight! Visual                   guifg=#7c94a3  guibg=NONE     gui=reverse    ctermfg=3     ctermbg=NONE  cterm=reverse
highlight! PmenuSbar                guifg=#586069  guibg=#375268  gui=NONE       ctermfg=8     ctermbg=8     cterm=NONE
highlight! Comment                  guifg=#586069  guibg=NONE     gui=NONE       ctermfg=8     ctermbg=NONE  cterm=NONE
highlight! SpecialComment           guifg=#586069  guibg=NONE     gui=reverse    ctermfg=8     ctermbg=NONE  cterm=reverse
highlight! Function                 guifg=#006686  guibg=NONE     gui=NONE       ctermfg=2     ctermbg=NONE  cterm=NONE
highlight! Error                    guifg=#8c3432  guibg=NONE     gui=reverse    ctermfg=1     ctermbg=NONE  cterm=reverse
highlight! SpellBad                 guifg=#8c3432  guibg=NONE     gui=undercurl  ctermfg=1     ctermbg=NONE  cterm=undercurl
highlight! SpellLocal               guifg=#006686  guibg=NONE     gui=undercurl  ctermfg=2     ctermbg=NONE  cterm=undercurl
highlight! SpellCap                 guifg=#7c94a3  guibg=NONE     gui=undercurl  ctermfg=3     ctermbg=NONE  cterm=undercurl
highlight! PreProc                  guifg=#c24d43  guibg=NONE     gui=NONE       ctermfg=5     ctermbg=NONE  cterm=NONE
highlight! Type                     guifg=#7c94a3  guibg=NONE     gui=NONE       ctermfg=3     ctermbg=NONE  cterm=NONE
highlight! Constant                 guifg=#9b5d75  guibg=NONE     gui=NONE       ctermfg=4     ctermbg=NONE  cterm=NONE
highlight! String                   guifg=#c7b6a3  guibg=NONE     gui=NONE       ctermfg=6     ctermbg=NONE  cterm=NONE
highlight! Search                   guifg=#9b5d75  guibg=NONE     gui=reverse    ctermfg=4     ctermbg=NONE  cterm=reverse
highlight! DiffAdd                  guifg=#e6e5e5  guibg=NONE     gui=reverse    ctermfg=7     ctermbg=NONE  cterm=reverse
highlight! DiffChange               guifg=#c24d43  guibg=NONE     gui=reverse    ctermfg=5     ctermbg=NONE  cterm=reverse
highlight! MatchParen               guifg=#252a2f  guibg=#9b5d75  gui=NONE       ctermfg=0     ctermbg=4     cterm=NONE
highlight! SpecialKey               guifg=#c7b6a3  guibg=NONE     gui=NONE       ctermfg=6     ctermbg=0     cterm=NONE
highlight! Todo                     guifg=#006686  guibg=NONE     gui=reverse    ctermfg=2     ctermbg=NONE  cterm=reverse

highlight! link DiffDelete          Error
highlight! link ErrorMsg            Error
highlight! link WildMenu            Visual
highlight! link ModeMsg             Visual
highlight! link StorageClass        Normal
highlight! link htmlItalic          Normal
highlight! link SignColumn          String
highlight! link MoreMsg             String
highlight! link markdownLinkText    String
highlight! link WarningMsg          String
highlight! link Title               PreProc
highlight! link Number              PreProc
highlight! link FoldColumn          PreProc
highlight! link phpVarSelector      PreProc
highlight! link Directory           PreProc
highlight! link Identifier          Function
highlight! link Statement           Function
highlight! link Special             Type
highlight! link Operator            Normal
highlight! link markdownUrl         SpecialKey
highlight! link Underlined          SpecialKey
highlight! link Question            SpecialKey
highlight! link Pmenu               StatusLineNC
highlight! link TabLine             StatusLineNC
highlight! link VimCommentTitle     SpecialComment
highlight! link Folded              LineNr
highlight! link NonText             Comment
highlight! link DiffText            DiffAdd
highlight! link PmenuThumb          PmenuSbar
highlight! link ColorColumn         CursorLine
highlight! link CursorLineNr        TabLineSel
highlight! link PmenuSel            StatusLine
highlight! link SpellRare           SpellLocal

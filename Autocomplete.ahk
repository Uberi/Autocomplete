#NoEnv

#Warn All
#Warn LocalSameAsGlobal, Off

SetBatchLines, -1

WordListFile := A_ScriptDir . "\WordList.txt" ;path of the wordlist file
MaxResults := 100 ;maximum number of results to display
OffsetX := 0 ;offset in caret position in X axis
OffsetY := 20 ;offset from caret position in Y axis
BoxHeight := 165 ;height of the suggestions box in pixels
ShowLength := 3 ;minimum length of word before showing suggestions
CorrectCase := True ;whether or not to fix uppercase or lowercase to match the suggestion
IgnorePattern := "i)Firefox|Chrome" ;regular expression for titles of windows to avoid autocompleting in when active

NormKeyList := "a`nb`nc`nd`ne`nf`ng`nh`ni`nj`nk`nl`nm`nn`no`np`nq`nr`ns`nt`nu`nv`nw`nx`ny`nz" ;list of key names separated by `n that make up words in upper and lower case variants
NumberKeyList := "1`n2`n3`n4`n5`n6`n7`n8`n9`n0" ;list of key names separated by `n that make up words as well as their numpad equivalents
OtherKeyList := "'`n-" ;list of key names separated by `n that make up words
ResetKeyList := "Esc`nSpace`nHome`nPGUP`nPGDN`nEnd`nLeft`nRight`nRButton`nMButton`n,`n.`n/`n[`n]`n;`n\`n=`n```n"""  ;list of key names separated by `n that cause suggestions to reset
TriggerKeyList := "Tab`nEnter" ;list of key names separated by `n that trigger completion

SetTitleMatchMode, RegEx
CoordMode, Caret
SetKeyDelay, 0
SendMode, Input

;obtain desktop size across all monitors
SysGet, ScreenWidth, 78
SysGet, ScreenHeight, 79

FileRead, WordList, %WordListFile%
PrepareWordList(WordList)

Gui, Font, s10, Courier New
Gui, Add, ListBox, x0 y0 h%BoxHeight% 0x100 vMatched gCompleteWord AltSubmit
Gui, -Caption +ToolWindow +AlwaysOnTop +LastFound
hWindow := WinExist()
Gui, Show, h%BoxHeight% Hide, AutoComplete

Gosub, ResetWord

SetHotkeys(NormKeyList,NumberKeyList,OtherKeyList,ResetKeyList,TriggerKeyList)
Return

PrepareWordList(ByRef WordList)
{
    If InStr(WordList,"`r")
        StringReplace, WordList, WordList, `r,, All
    While, InStr(WordList,"`n`n")
        StringReplace, WordList, WordList, `n`n, `n, All
}

GuiClose:
ExitApp

SetHotkeys(NormKeyList,NumberKeyList,OtherKeyList,ResetKeyList,TriggerKeyList)
{
    Loop, Parse, NormKeyList, `n
    {
        Hotkey, ~%A_LoopField%, Key, UseErrorLevel
        Hotkey, ~+%A_LoopField%, ShiftedKey, UseErrorLevel
    }

    Loop, Parse, NumberKeyList, `n
    {
        Hotkey, ~%A_LoopField%, Key, UseErrorLevel
        Hotkey, ~Numpad%A_LoopField%, NumpadKey, UseErrorLevel
    }

    Loop, Parse, OtherKeyList, `n
        Hotkey, ~%A_LoopField%, Key, UseErrorLevel

    Loop, Parse, ResetKeyList, `n
        Hotkey, ~*%A_LoopField%, ResetWord, UseErrorLevel

    Hotkey, IfWinExist, AutoComplete ahk_class AutoHotkeyGUI
    Loop, Parse, TriggerKeyList, `n
        Hotkey, %A_LoopField%, CompleteWord, UseErrorLevel
}

#IfWinExist AutoComplete ahk_class AutoHotkeyGUI

~LButton::
MouseGetPos,,, Temp1
If (Temp1 != hWindow)
    Gosub, ResetWord
Return

Up::
GuiControlGet, Temp1,, Matched
GuiControl, Choose, Matched, % Temp1 - 1
Return

Down::
GuiControlGet, Temp1,, Matched
GuiControl, Choose, Matched, % Temp1 + 1
Return

#IfWinExist

~BackSpace::
CurrentWord := SubStr(CurrentWord,1,-1)
Gosub, Suggest
Return

Key:
If WinActive(IgnorePattern)
    Return
CurrentWord .= SubStr(A_ThisHotkey,2)
Gosub, Suggest
Return

ShiftedKey:
If WinActive(IgnorePattern)
    Return
Char := SubStr(A_ThisHotkey,3)
StringUpper, Char, Char
CurrentWord .= Char
Gosub, Suggest
Return

NumpadKey:
If WinActive(IgnorePattern)
    Return
CurrentWord .= SubStr(A_ThisHotkey,8)
Gosub, Suggest
Return

ResetWord:
CurrentWord := ""
Gui, Hide
Return

Suggest:
Critical

;check word length against minimum length
If StrLen(CurrentWord) < ShowLength
{
    Gui, Hide
    Return
}

;search for words beginning with a given prefix
MaxWidth := 150
MatchList := ""
Position := 1

Pattern := RegExReplace(CurrentWord,"S).","$0.*")

Pattern := RegExReplace(Pattern,"S)[a" . Chr(224) . Chr(226) . "]","[a" . Chr(224) . Chr(226) . "]")
Pattern := RegExReplace(Pattern,"S)[c" . Chr(231) . "]","[c" . Chr(231) . "]")
Pattern := RegExReplace(Pattern,"S)[e" . Chr(233) . Chr(232) . Chr(234) . Chr(235) . "]","[e" . Chr(233) . Chr(232) . Chr(234) . Chr(235) . "]")
Pattern := RegExReplace(Pattern,"S)[i" . Chr(238) . Chr(239) . "]","[i" . Chr(238) . Chr(239) . "]")
Pattern := RegExReplace(Pattern,"S)[o" . Chr(244) . "]","[o" . Chr(244) . "]")
Pattern := RegExReplace(Pattern,"S)[u" . Chr(251) . Chr(249) . "]","[u" . Chr(251) . Chr(249) . "]")

Pattern := "`nimS)^" . Pattern ;subsequence matching pattern

While, (Position := RegExMatch(WordList,Pattern,Word,Position)) && A_Index <= MaxResults
{
    Position += StrLen(Word)
    StringReplace, Word, Word, %A_Tab%, %A_Space%%A_Space%%A_Space%%A_Space%, All
    MatchList .= Word . "|"
    Width := TextWidth(Word)
    If (Width > MaxWidth)
        MaxWidth := Width
}
MatchList := SubStr(MatchList,1,-1)
MaxWidth += 30

Sort, MatchList, FRankResults D|

;check for a lack of matches
If (MatchList = "")
{
    Gui, Hide
    Return
}

;update the interface
GuiControl,, Matched, |%MatchList%
GuiControl, Choose, Matched, 1
GuiControl, Move, Matched, w%MaxWidth%
PosX := A_CaretX + OffsetX
If PosX + MaxWidth > ScreenWidth ;past right side of the screen
    PosX := ScreenWidth - MaxWidth
PosY := A_CaretY + OffsetY
If PosY + BoxHeight > ScreenHeight ;past bottom of the screen
    PosY := ScreenHeight - BoxHeight
Gui, Show, x%PosX% y%PosY% w%MaxWidth% NoActivate
Return

RankResults(Entry1,Entry2,Offset)
{
    Return, Score(Entry2,0) - Score(Entry1,Offset)
}

Score(Entry,Offset)
{
    global CurrentWord
    Score := 100

    Length := StrLen(CurrentWord)

    ;determine prefixing
    Position := 1
    While, Position <= Length && SubStr(CurrentWord,Position,1) = SubStr(Entry,Position,1)
        Position ++
    Score *= Position ** 3

    ;determine number of superfluous characters
    RegExMatch(Entry,"`nmS)^" . SubStr(RegExReplace(CurrentWord,"S).","$0.*"),1,-2),Word)
    Score *= (1 + StrLen(Word) - Length) ** -2

    ;determine the offset (for wordlists sorted by frequency)
    Score *= (Offset + 1) ** 0.8

    ;determine the total length
    Score *= StrLen(Entry) ** -0.5

    Return, Score
}

CompleteWord:
Critical

;only trigger word completion on non-interface event or double click on matched list
If (A_GuiEvent != "" && A_GuiEvent != "DoubleClick")
    Return

;retrieve the word that was selected
GuiControlGet, Index,, Matched
TempList := "|" . MatchList . "|"
Position := InStr(TempList,"|",0,1,Index) + 1
Word := SubStr(TempList,Position,InStr(TempList,"|",0,Position) - Position)

Gui, Hide

If CorrectCase
{
    Position := 1
    Loop, Parse, CurrentWord
    {
        Position := InStr(Word,A_LoopField,False,Position)
        If A_LoopField Is Upper
        {
            Char := SubStr(Word,Position,1)
            StringUpper, Char, Char
            Word := SubStr(Word,1,Position - 1) . Char . SubStr(Word,Position + 1)
        }
    }
}

;send the word
Send, % "{BS " . StrLen(CurrentWord) . "}" ;clear the typed word
SendRaw, %Word%

Gosub, ResetWord
Return

TextWidth(String)
{
    static Typeface := "Arial"
    static Size := 10
    static hDC, hFont := 0, Extent
    If !hFont
    {
        UPtr := A_PtrSize ? "UPtr" : "UInt"
        hDC := DllCall("GetDC",UPtr,0,UPtr)
        Height := -DllCall("MulDiv","Int",Size,"Int",DllCall("GetDeviceCaps","UPtr",hDC,"Int",90),"Int",72)
        hFont := DllCall("CreateFont","Int",Height,"Int",0,"Int",0,"Int",0,"Int",400,"UInt",False,"UInt",False,"UInt",False,"UInt",0,"UInt",0,"UInt",0,"UInt",0,"UInt",0,"Str",Typeface)
        hOriginalFont := DllCall("SelectObject",UPtr,hDC,UPtr,hFont,UPtr)
        VarSetCapacity(Extent,8)
    }
    DllCall("GetTextExtentPoint32",UPtr,hDC,"Str",String,"Int",StrLen(String),UPtr,&Extent)
    ;DllCall("SelectObject",UPtr,hDC,UPtr,hOriginalFont,UPtr)
    ;DllCall("DeleteObject",UPtr,hFont)
    ;DllCall("ReleaseDC",UPtr,0,UPtr,hDC)
    Return, NumGet(Extent,0,"UInt")
}
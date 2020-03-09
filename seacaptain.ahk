;--------------;
;--SeaCaptain--;
;--------------;

#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
SetCapslockState, AlwaysOff
Menu, Tray, Icon, icon.ico
Menu, Tray, Tip, SeaCaptain v1.5
#include *i %A_ScriptDir%\lib\tile.ahk

LWin & r::
Reload
return 

;--Windows, Sizing and Movement--;

;kill window
LWin & q::
SendInput, !{F4}
return 

LWin & rbutton::
WinGetActiveTitle, Title
If MouseIsOver(Title)
{ 
WinClose, A
}
return 

; MinMax
LWin & f::
WinGet, OutputVar, MinMax, A
if OutputVar = 0
{
WinMaximize, A
}
else
{
 WinRestore, A
}
return

; Minimize All
#If MouseIsOver("ahk_class Shell_TrayWnd")
	MButton::
	Send, #d
	return 
#If

; Up
LAlt & Up::
WinGetPos, , , x, y, A
y -= 100
WinMove, A, , , , %x%, %y%
return 

LWin & Up::
WinGetPos, x, y, , , A
y -= 100
WinMove, A,, %x%, %y% 
return 

; Down
LAlt & Down::
WinGetPos, , , x, y, A
y += 100
WinMove, A, , , , %x%, %y%
return 

LWin & Down::
WinGetPos, x, y, , , A
y += 100
WinMove, A,, %x%, %y% 
return 

; Left
LAlt & Left::
WinGetPos, , , x, y, A
x -= 100
WinMove, A, , , , %x%, %y%
return 

LWin & Left::
WinGetPos, x, y, , , A
x -= 100
WinMove, A,, %x%, %y% 
return 

; Right
LAlt & Right::
WinGetPos, , , x, y, A
x += 100
WinMove, A, , , , %x%, %y%
return 

LWin & Right::
WinGetPos, x, y, , , A
x += 100
WinMove, A,, %x%, %y% 
return 

; Centre Window
LWin & c::
WinExist("A")
WinGetPos,,, sizeX, sizeY
WinMove, (A_ScreenWidth/2)-(sizeX/2), (A_ScreenHeight/2)-(sizeY/2)
return 

;--SeaMenu--;
#If MouseIsOver("ahk_class Progman") or MouseIsOver("ahk_class WorkerW")
mbutton::
Run, %A_ScriptDir%\lib\seamenu.ahk
return 
#If 

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
return 

#include %A_ScriptDir%\lib\seamenu.ahk
#include *i %A_ScriptDir%\lib\easy.ahk
#include *i %A_ScriptDir%\lib\term.ahk

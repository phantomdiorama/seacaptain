;--------------;
;--SeaCaptain--;
;--------------;

TaskBar := 32
gap := 24

#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
Menu, Tray, Icon, icon.ico
Menu, Tray, Tip, SeaCaptain v2.0
SetCapsLockState, AlwaysOff

#include %A_ScriptDir%\lib\tile.ahk 

Capslock & r::
Reload
return 

;--Windows, Sizing and Movement--;

;kill window
Capslock & q::
SendInput, !{F4}
return 

Capslock & rbutton::
WinGetActiveTitle, Title
If MouseIsOver(Title)
{ 
WinClose, A
}
return 

; MinMax
Capslock & f::
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
Capslock & Up::
If GetKeyState("Shift", "P")
{
    WinGetPos, , , x, y, A
    y -= 100
    WinMove, A, , , , %x%, %y%
    return 
}
else
{
    WinGetPos, x, y, , , A
    y -= 100
    WinMove, A,, %x%, %y% 
    return 
}

; Down
Capslock & Down::
If GetKeyState("Shift", "P")
{
    WinGetPos, , , x, y, A
    y += 100
    WinMove, A, , , , %x%, %y%
    return 
}
Else
{
    WinGetPos, x, y, , , A
    y += 100
    WinMove, A,, %x%, %y% 
    return 
}

; Left
Capslock & Left::
If GetKeyState("Shift", "P")
{
    WinGetPos, , , x, y, A
    x -= 100
    WinMove, A, , , , %x%, %y%
    return 
}
Else
{
    WinGetPos, x, y, , , A
    x -= 100
    WinMove, A,, %x%, %y% 
    return 
}

; Right
Capslock & Right::
If GetKeyState("Shift", "P")
{
    WinGetPos, , , x, y, A
    x += 100
    WinMove, A, , , , %x%, %y%
    return 
}
Else
{
    WinGetPos, x, y, , , A
    x += 100
    WinMove, A,, %x%, %y% 
    return 
}

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
#include %A_ScriptDir%\lib\easy.ahk
#include *i %A_ScriptDir%\lib\term.ahk
;#include *i %A_ScriptDir%\lib\notitle.ahk

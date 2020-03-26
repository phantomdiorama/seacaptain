;--------------;
;--SeaCaptain--;
;--------------;

; Use WindowSpy to find out taskbar height. 
; On 1920x1080 it defaults to "32". Use "0" for none.
TaskBar := 32

;Gap size. Use "0" for none.
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

;Window chooser
CapsLock & Tab::
SendInput, ^!{Tab}
return 

;kill window
Capslock & x::
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
Capslock & w::
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
Capslock & s::
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
Capslock & a::
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
Capslock & d::
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

;--------------;
;--SeaCaptain--;
;--------------;

#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
SetCapsLockState, AlwaysOff
Menu, Tray, Icon, icon.ico
#include *i %A_ScriptDir%\lib\tile.ahk

CapsLock & r::
Reload
return 

;--Windows, Sizing and Movement--;

;kill window

Capslock & q::
SendInput, !{F4}
return 

CapsLock & rbutton::
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

; Up
CapsLock & Up::
if GetKeyState("Shift")
{
    WinGetPos, , , x, y, A
    y -= 100
    WinMove, A, , , , %x%, %y%
}
else {
    WinGetPos, x, y, , , A
    y -= 100
    WinMove, A,, %x%, %y% 
}
return 

; Down
CapsLock & Down::
if GetKeyState("Shift")
{
    WinGetPos, , , x, y, A
    y += 100
    WinMove, A, , , , %x%, %y%
}
else 
{
    WinGetPos, x, y, , , A
    y += 100
    WinMove, A,, %x%, %y% 
}
return 

; Left
CapsLock & Left::
if GetKeyState("Shift")
{
    WinGetPos, , , x, y, A
    x -= 100
    WinMove, A, , , , %x%, %y%
}
else
{
    WinGetPos, x, y, , , A
    x -= 100
    WinMove, A,, %x%, %y% 
} 
return 

; Right
CapsLock & Right::
if GetKeyState("Shift")
{
    WinGetPos, , , x, y, A
    x += 100
    WinMove, A, , , , %x%, %y%
}
else
{
    WinGetPos, x, y, , , A
    x += 100
    WinMove, A,, %x%, %y% 
}
return 

;--Centre Window--;
CapsLock & c::
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

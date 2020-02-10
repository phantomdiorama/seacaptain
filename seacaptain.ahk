#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
SetCapsLockState, AlwaysOff
Menu, Tray, Icon, icon.ico

;==================
; Includes
;==================

#include *i %A_ScriptDir%\lib\mintty.ahk
#include *i %A_ScriptDir%\lib\mediakeys.ahk
#include *i %A_ScriptDir%\lib\fzf_menu.ahk
#include *i %A_ScriptDir%\lib\fzf_explorer.ahk

;==================
; Hotkeys
;==================

;open new terminal
Capslock & a::
Run, "C:\Program Files\Git\git-bash.exe" --cd-to-home
return 

;open browser
Capslock & w::
Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
return 

;open email
Capslock & e::
Run, "C:\Program Files\Windows Live\Mail\wlmail.exe"
return 

;====================
; Windows, Sizing and Movement
;====================

;kill window
Capslock & q::
SendInput, !{F4}
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

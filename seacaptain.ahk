#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
SetCapsLockState, AlwaysOff
Menu, Tray, Icon, icon.ico

;============
; Variables
;============
gap := 6
TaskBar := 40

TaskHeight := A_ScreenHeight - TaskBar
TileWidth := (A_ScreenWidth / 2) - 12
TileHeight := (TaskHeight / 2) - 12
FullTileHeight := (TaskHeight - 12)

RightTilePos := (A_ScreenWidth / 2) + 6
BottomTilePos := (TaskHeight / 2) + 6

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


;====================
; Windows Tiling
;====================



;Left
CapsLock & Numpad7::
WinMove, A,,%gap%,%gap%, %TileWidth%, %TileHeight%, 
return 

CapsLock & Numpad4::
WinMove, A,,%gap%,%gap%, %TileWidth%, %FullTileHeight%, 
return 

CapsLock & Numpad1::
WinMove, A,,%gap%,%BottomTilePos%, %TileWidth%, %TileHeight%, 
return 

;Right
CapsLock & Numpad9::
WinMove, A,,%RightTilePos%,%gap%, %TileWidth%, %TileHeight%, 
return 

CapsLock & Numpad6::
WinMove, A,,%RightTilePos%,%gap%, %TileWidth%, %FullTileHeight%, 
return 

CapsLock & Numpad3::
WinMove, A,,%RightTilePos%,%BottomTilePos%, %TileWidth%, %TileHeight%, 
return 

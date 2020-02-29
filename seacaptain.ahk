﻿;--------------;
;--SeaCaptain--;
;--------------;

gap := 24
TaskBar := 32

;----do not edit beyond here------;

FullGap := gap * 2
TaskHeight := A_ScreenHeight - TaskBar 
TileWidth := (A_ScreenWidth / 2) - FullGap 
TileHeight := (TaskHeight / 2) - FullGap 
FullTileHeight := (TaskHeight - FullGap)
RightTilePos := (A_ScreenWidth / 2) + gap
BottomTilePos := (TaskHeight / 2) + gap


VERSION := 1.0

#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
SetCapsLockState, AlwaysOff
Menu, Tray, Icon, icon.ico
Menu, Tray, Tip, SeaCaptain %VERSION%

#include seamenu.ahk
#include *i %A_ScriptDir%\lib\Easy Window Dragging .ahk

;--Terminal--;

;open new terminal
Capslock & a::
Run, "C:\Program Files\Git\git-bash.exe" --cd-to-home
return 

;open new terminal at folder
#If WinActive("ahk_class CabinetWClass")
Capslock & a::
WinGetTitle, Title, A
Run  C:\Program Files\Git\git-bash.exe --cd="%Title%"
return 
#If 

;--Windows, Sizing and Movement--;

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

;--Windows Tiling--;

;Left
CapsLock & ,::
WinMove, A,,%gap%,%gap%, %TileWidth%, %FullTileHeight%, 
return 

;Right
CapsLock & .::
WinMove, A,,%RightTilePos%,%gap%, %TileWidth%, %FullTileHeight%, 
return 


;Left Top
CapsLock & RAlt::
WinMove, A,,%gap%,%gap%, %TileWidth%, %TileHeight%, 
return 

;Right Top
CapsLock & RWin::
WinMove, A,,%RightTilePos%,%gap%, %TileWidth%, %TileHeight%, 
return 

;Left Bottom
CapsLock & AppsKey::
WinMove, A,,%gap%,%BottomTilePos%, %TileWidth%, %TileHeight%, 
return 

;Right Bottom
CapsLock & RCtrl::
WinMove, A,,%RightTilePos%,%BottomTilePos%, %TileWidth%, %TileHeight%, 
return 

;--Centre Window--;

CapsLock & c::
WinExist("A")
WinGetPos,,, sizeX, sizeY
WinMove, (A_ScreenWidth/2)-(sizeX/2), (A_ScreenHeight/2)-(sizeY/2)
return 

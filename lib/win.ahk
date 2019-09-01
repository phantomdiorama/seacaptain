#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

;====================
; Splitting (buggy)
;====================

; Vertical
CapsLock & v::
SendInput, #{Left}
Click, 1400, 800 
SendInput, #{Right}
return 

; Horizontal
; CapsLock & h
; SendInput, #{Left}
; Click, 1400, 200 
; SendInput, #{Right}return 
; WinMove,A,,     0, 0, 1920, 500
; Click, 400, 800
; ; Sleep 1000
; WinMove,A,,     0, 500, 1920, 540
;return 

;====================
; Sizing and Movement
;====================

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

;==================
; Win Select
;==================

Capslock & w::

Input key, I L1

ifEqual key,1
SendInput, #1

IfEqual key,2
SendInput, #2

IfEqual key,3
SendInput, #3

IfEqual key,4
SendInput, #4

IfEqual key,5
SendInput, #5

IfEqual key,6
SendInput, #6

IfEqual key,7
SendInput, #7

IfEqual key,8
SendInput, #8

IfEqual key,9
SendInput, #9

IfEqual key,0
SendInput, #0

return 
#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
SetCapsLockState, AlwaysOff
Menu, Tray, Icon, icon.ico

;==================
; Includes
;==================return

#include *i %A_ScriptDir%\lib\win.ahk
#include *i %A_ScriptDir%\lib\mintty.ahk
#include *i %A_ScriptDir%\lib\mediakeys.ahk

;==================
; Hotkeys
;==================

;kill window
Capslock & q::
SendInput, !{F4}
return 

;kill all windows
Capslock & k::
MsgBox, 4,, Close all windows?
IfMsgBox Yes
{
    GroupAdd, AllWindows
    WinClose ahk_group AllWindows
}
else
{
    return 
}
return 

; open application launcher
Capslock & d::
Run, %A_ScriptDir%\lib\dmenu.ahk
return 

;open new terminal
Capslock & a::
Run, "C:\Program Files\Git\git-bash.exe" --cd-to-home
return 

;open browser
Capslock & s::
Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
return 

;open email
Capslock & m::
Run, "C:\Program Files\Windows Live\Mail\wlmail.exe"
return 

;file manager
Capslock & e::
Run, explorer
return 
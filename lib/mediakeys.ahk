#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
DetectHiddenWindows, On

#If WinExist("ahk_class {97E27FAA-C0B3-4b8e-A693-ED7881E99FC1}") ;Foobar2K
!Wheelup::ControlSend, ahk_parent, ^{Up}
!WheelDown::ControlSend, ahk_parent, ^{Down}
return
#If 

#If WinExist("ahk_class iTunes")
!Wheelup::ControlSend, ahk_parent, ^{Up}
!WheelDown::ControlSend, ahk_parent, ^{Down}
return
#If 

#If WinExist("ahk_class MediaPlayerClassicW") ;MPC-HC
!Wheelup::SendMessage,0x0111,907,,,ahk_class MediaPlayerClassicW
!WheelDown::SendMessage,0x0111,908,,,ahk_class MediaPlayerClassicW
#If 
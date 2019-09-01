#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force

Gui, Font, s12, Consolas
Gui, Color, 1B1918
Gui, Add, ListView, -Hdr -E0x200 cD5911A Background1B1918, Name

Loop, %A_ScriptDir%\shortcuts\*.*
    LV_Add("", A_LoopFileName)
    
;lv_modifycol(1, 275)

Gui, Add, Button, Hidden Default, OK
Gui -Caption
Gui, Show, w330 h105 xCenter yCenter
return

ButtonOK:
GuiControlGet, FocusedControl, FocusV
Mvar := LV_GetNext(0, "Focused")
LV_GetText(OutputVar, Mvar)
Run shortcuts\%OutputVar%
ExitApp

Esc::
GuiClose:
ExitApp 
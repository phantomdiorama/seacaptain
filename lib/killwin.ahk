#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

MsgBox, 4,, Close all windows?
IfMsgBox Yes
Run, nircmd.exe win close alltopnodesktop
else
ExitApp 
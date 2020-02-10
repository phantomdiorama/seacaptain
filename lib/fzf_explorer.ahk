#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

#IfWinActive ahk_class CabinetWClass
Capslock & s::
WinGetTitle, Title, A
Run cmd /K cd %Title% & fzf --bind "enter:execute(START "{}" "{}")+accept+execute(%A_ScriptDir%\lib\kill_cmd.ahk)"
return 
#If 
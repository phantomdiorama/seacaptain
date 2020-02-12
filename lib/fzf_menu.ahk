#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

Capslock & d::
Run cmd /K cd %A_ScriptDir%\lib\shortcuts & fzf --bind "enter:execute(START "{}" "{}")+accept+execute(%A_ScriptDir%\lib\kill_cmd.ahk)"
return 
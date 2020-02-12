#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

;Bash Here
#If WinActive("ahk_class CabinetWClass")
Capslock & a::
WinGetTitle, Title, A
Run  C:\Program Files\Git\git-bash.exe --cd="%Title%"
#If 

;Mintty
#If WinActive("ahk_class mintty")
^v::
SendInput, {Shift}+{Insert}
return 
#If 
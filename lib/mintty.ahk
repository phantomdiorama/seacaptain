#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

;Bash Here
#IfWinActive ahk_class CabinetWClass
Capslock & a::
WinGetTitle, Title, A
Run  C:\Program Files\Git\git-bash.exe --cd="%Title%"
#If 

;Mintty
#IfWinActive ahk_class mintty
^v::
SendInput, {Shift}+{Insert}
return 
#If 
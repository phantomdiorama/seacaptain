LWin & Space::
Run, wt
return 

;open new terminal at folder
#If WinActive("ahk_class CabinetWClass")
LWin & Space::
WinGetTitle, Title, A
Run  wt.exe -d %Title%
return 
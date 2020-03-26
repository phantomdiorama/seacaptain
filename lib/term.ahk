`::
Run, wt
return 

;open new terminal at folder
#If WinActive("ahk_class CabinetWClass")
`::
WinGetTitle, Title, A
Run  wt.exe -d %Title%
return 
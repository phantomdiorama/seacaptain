#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

Loop Files, %A_ScriptDir%\menu\*.lnk 
{
	MenuString := A_LoopFileName
	word_array := StrSplit(MenuString, ".")
	var:= word_array[1]
	Menu, SeaMenu, Add, %Var%, MenuHandler
}
Menu, SeaMenu, Add 
Menu, System, Add, Add menu item, FolderHandler
Menu, System, Add, Control Panel, ControlHandler
Menu, System, Add, Recycle Bin, RecycleHandler
Menu, SeaMenu, Add, System, :System
Menu, SeaMenu, show
return 

MenuHandler:
run %A_ScriptDir%\menu\%A_ThisMenuItem%.lnk
return 

FolderHandler:
run %A_ScriptDir%\menu 
return 

ControlHandler:
run control panel
return 

RecycleHandler:
run recycle bin  
return 

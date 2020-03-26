; #NoEnv
; #Warn
; SendMode Input
; SetWorkingDir %A_ScriptDir%

Loop Files, %A_ScriptDir%\menu\*.lnk 
{
	MenuString := A_LoopFileName
	word_array := StrSplit(MenuString, ".")
	var:= word_array[1]
	Menu, SeaMenu, Add, %Var%, MenuHandler
}
Menu, SeaMenu, Add 
Menu, System, Add, Control Panel, ControlHandler
Menu, System, Add, Recycle Bin, RecycleHandler
Menu, SeaMenu, Add, System, :System
Menu, Seacaptain, Add, Add menu item, AddHandler
Menu, Seacaptain, Add, Open SeaCaptain folder, FolderHandler
Menu, Seacaptain, Add, Homepage, WebHandler
Menu, SeaMenu, Add, Seacaptain, :Seacaptain
Menu, SeaMenu, show
return 

MenuHandler:
run %A_ScriptDir%\menu\%A_ThisMenuItem%.lnk
return 

AddHandler:
FileSelectFile, SelectedFile, 3 
if (SelectedFile = "")
    MsgBox, The user didn't select anything.
else
    SplitPath, SelectedFile,,,, name_no_ext
    FileCreateShortcut, %SelectedFile%, %A_ScriptDir%\menu\%name_no_ext%.lnk
return 

FolderHandler:
SeaFolder := SubStr(A_ScriptDir, 1, -3) 
Run %SeaFolder%
return 

ControlHandler:
run control panel
return 

RecycleHandler:
run ::{645FF040-5081-101B-9F08-00AA002F954E}
return 

WebHandler:
run  https://github.com/phantomdiorama/seacaptain
return 

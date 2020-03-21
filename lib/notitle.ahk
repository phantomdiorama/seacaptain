; https://autohotkey.com/board/topic/19672-detect-when-a-new-window-is-opened/

#Persistent
Gui +LastFound
hWnd := WinExist()

DllCall( "RegisterShellHookWindow", UInt,hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )
Return

ShellMessage( wParam,lParam ) {
  Local k
  If ( wParam = 1 ) ;  HSHELL_WINDOWCREATED := 1
     {
       NewID := lParam
       SetTimer, NoTitle, -1
     }
}

NoTitle:
WinSetTitle, A, ,
Return 
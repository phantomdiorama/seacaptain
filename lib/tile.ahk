TaskBar := 32
gap := 24

;--do not edit beyond here--;

FullGap := gap * 2
TaskHeight := A_ScreenHeight - TaskBar 
TileWidth := (A_ScreenWidth / 2) - FullGap 
TileHeight := (TaskHeight / 2) - FullGap 
FullTileHeight := (TaskHeight - FullGap)
RightTilePos := (A_ScreenWidth / 2) + gap
BottomTilePos := (TaskHeight / 2) + gap

;Left
CapsLock & ,::
WinMove, A,,%gap%,%gap%, %TileWidth%, %FullTileHeight%, 
return 

 ;Right
 CapsLock & .::
 WinMove, A,,%RightTilePos%,%gap%, %TileWidth%, %FullTileHeight%, 
 return 


 ;Left Top
 CapsLock & RAlt::
 WinMove, A,,%gap%,%gap%, %TileWidth%, %TileHeight%, 
 return 

 ;Right Top
 CapsLock & RWin::
 WinMove, A,,%RightTilePos%,%gap%, %TileWidth%, %TileHeight%, 
 return 

 ;Left Bottom
 CapsLock & AppsKey::
 WinMove, A,,%gap%,%BottomTilePos%, %TileWidth%, %TileHeight%, 
 return 

 ;Right Bottom
 CapsLock & RCtrl::
 WinMove, A,,%RightTilePos%,%BottomTilePos%, %TileWidth%, %TileHeight%, 
 return 

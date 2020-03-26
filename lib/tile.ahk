FullGap := gap * 2
TaskHeight := A_ScreenHeight - TaskBar 
TileWidth := (A_ScreenWidth / 2) - FullGap 
TileHeight := (TaskHeight / 2) - FullGap 
FullTileHeight := (TaskHeight - FullGap)
RightTilePos := (A_ScreenWidth / 2) + gap
BottomTilePos := (TaskHeight / 2) + gap

;Left
Capslock & q::
WinMove, A,,%gap%,%gap%, %TileWidth%, %FullTileHeight%, 
return 

;Right
Capslock & e::
WinMove, A,,%RightTilePos%,%gap%, %TileWidth%, %FullTileHeight%, 
return 

;Left Top
Capslock & 1::
WinMove, A,,%gap%,%gap%, %TileWidth%, %TileHeight%, 
return 

;Right Top
Capslock & 2::
WinMove, A,,%RightTilePos%,%gap%, %TileWidth%, %TileHeight%, 
return 

;Left Bottom
Capslock & 3::
WinMove, A,,%gap%,%BottomTilePos%, %TileWidth%, %TileHeight%, 
return 

;Right Bottom
Capslock & 4::
WinMove, A,,%RightTilePos%,%BottomTilePos%, %TileWidth%, %TileHeight%, 
return 

; Centre Window
Capslock & c::
WinExist("A")
WinGetPos,,, sizeX, sizeY
WinMove, (A_ScreenWidth/2)-(sizeX/2), (TaskHeight/2)-(sizeY/2)
return 
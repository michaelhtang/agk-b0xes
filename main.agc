
// Project: b0xes 
// Created: 2020-10-01
// Author: Michael Tang

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Boxes" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

// Create Colors
CreateImageColor(1, 255, 0, 0, 255) // RED
CreateImageColor(2, 0, 255, 0, 255) //GREEN
CreateImageColor(3, 0, 0, 255, 255) // BLUE
CreateImageColor(99, 100, 100, 100, 255) //GREY

// Create Sprites
CreateSprite(99, 99) // Grey Background
SetSpriteSize(99, GetVirtualWidth(), GetVirtualHeight())

CreateSprite(1, 1) //Red Box
SetSpriteSize(1, 50, 50) // Set size

CreateSprite(2, 3) //Blue Box
SetSpriteSize(2, 100, 100) // size of blue box
blueBoxX = GetVirtualWidth()/2 - GetSpriteWidth(2)/2
blueBoxY = GetVirtualHeight()/2 - GetSpriteHeight(2)/2
blueBoxSPD = 5
SetSpritePosition(2, blueBoxX, blueBoxY)

do
    // Moving the blue box
    if GetRawKeyState(65) = 1 // 'a' key
		blueBoxX = blueBoxX - blueBoxSPD
	endif
	if GetRawKeyState(68) = 1 // 'd' key
		blueBoxX = blueBoxX + blueBoxSPD
	endif
	if GetRawKeyState(87) = 1 // 'w' key
		blueBoxY = blueBoxY - blueBoxSPD
	endif
	if GetRawKeyState(83) = 1 // 's' key
		blueBoxY = blueBoxY + blueBoxSPD
	endif
	// Make sure box doesn't go out of bounds
	if blueBoxX > GetVirtualWidth() - GetSpriteWidth(2)
		blueBoxX = GetVirtualWidth() - GetSpriteWidth(2)
	endif
	if blueBoxX < 0 
		blueBoxX = 0
	endif
	if blueBoxY > GetVirtualHeight() - GetSpriteHeight(2)
		blueBoxY = GetVirtualHeight() - GetSpriteHeight(2)
	endif
	if blueBoxY < 0 
		blueBoxY = 0
	endif
	SetSpritePosition(2, blueBoxX, blueBoxY)

    
    Sync()
loop

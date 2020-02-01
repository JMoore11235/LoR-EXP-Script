#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.





;**CHANGE THESE NUMBER TO MATCH YOUR TRUE GAME DISPLAY RESOLUTION**
;Note that some systems run a scaled version, so this might not be your display resolution if it is scaled.
;For example, if you have the scale set to 125%, you'll need to multiply your scaled resolution by 1.25 to get your true resolution.

;If you are running the game in fullscreen, this is just your monitor resolution, regardless of your scaling (since you need true resolution).


;********************************************************************************************************************************************************************************************
xDim := 2560
yDim := 1440
;********************************************************************************************************************************************************************************************

;**CHANGE THESE NUMBERS IF YOUR WINDOW HAS BORDERS**
;(Note: Fullscreen is 0, 0). If you have the game in windowed mode, most likely you will have a top header, which is about 30px most of the time.
;Try "xStart := 0" and "yStart := 30" for windowed mode.
;Note that this has to be true as well, so if you are running at 150% scaling, this should then be "yStart := 45" instead of "yStart := 30" for example.


;********************************************************************************************************************************************************************************************
xStart := 0
yStart := 0
;********************************************************************************************************************************************************************************************




;If you are running this to alternate between two accounts:
	;Set this to either 0 or 1. Make sure that it is different than whoever you are running it with.

;If you are running this to always surrender:
	;Set this to 2. This setting can also be used against an AI opponent to get only loss EXP.
	;If used with another account using this script, the other account should have this setting set to -1.

;If you are running this to always receive surrenders:
	;Set this to -1. Note that this will sit in game doing nothing until the game finishes.
	;This setting should only be used if there is another account with this setting set to 2.


;********************************************************************************************************************************************************************************************
surrenderFirst := 0
;********************************************************************************************************************************************************************************************








;Use "Control + Shift + Left Click" to begin the script.
;Use "Control + q" to stop.





;**WARNING: DO NOT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING**

;************************************************************************************************
;************************************************************************************************
























;*****Constants********


;All positions based on a 2560p x 1440p screen


;Position of the Ready button in the menu
readyX := 2175
readyY := 1275



;Color is in BGR (not RGB)
waitingColor := 0xC2CCD3



; How many pixels off for color check
err := 10

; How much color off for color check
var := 10



;Surrender button location
surrenderX := 1175
surrenderY := 1275


;Surrender ok button location
surrenderOkX := 1460
surrenderOkY := 800


;Continue button location
continueX := 1700
continueY := 1275



;Multipliers based on screen size
xMult := xDim/2560 ; Sets the correct scaling for x
yMult := yDim/1440 ; Sets the correct scaling for y 


;*****End Constants******




;Use "Control + Shift + Left Click" to begin the script.
;Use "Control + q" to stop.
^+LButton::

Loop	;This Loop should start and end right before clicking on the "Play" Button before a match.
{
	MouseMove, xStart + (readyX*xMult), yStart + (readyY*yMult)
	Sleep, 500


	; Launch Game
	Send, {LButton} 
	Sleep, 1000


	;Signify that you are ready, but waiting
	MouseMove, xDim + xStart, yDim + yStart
	Sleep, 500

	;Make sure you aren't waiting for opponent
	xCheck := xStart + (readyX*xMult)
	yCheck := yStart + (readyY*yMult)
	

	PixelSearch, outX, outy, xCheck-err, yCheck-err, xCheck+err, yCheck+err, %waitingColor%, var, Fast
	while(ErrorLevel == 0) {
		Sleep, 500
		PixelSearch, outX, outy, xCheck-err, yCheck-err, xCheck+err, yCheck+err, %waitingColor%, var, Fast
	}





	;Wait for game to load in.
	
	MouseMove, xStart + 5, yStart + 5
	Sleep, 500

	Sleep, 20000

	MouseMove, xStart + 100, yStart + 100
	Sleep, 500


	Sleep, 3000 ; Wait 2 seconds for menu to be available

	if (surrenderFirst > 0) {

		;Escape to open the menu
		Send, {Esc}
		Sleep, 500

		;Start surrender
		MouseMove, xStart + (surrenderX*xMult), yStart + (surrenderY*yMult)
		Sleep, 500
		Send, {LButton}
		Sleep, 500

		;Confirm surrender
		MouseMove, xStart + (surrenderOkX*xMult), yStart + (surrenderOkY*yMult)
		Sleep, 500
		Send, {LButton}
		Sleep, 500

		if (surrenderFirst == 1) {
			surrenderFirst := 0
		}
	}
	else {
		Sleep, 2500
		if (surrenderFirst == 0) {
			surrenderFirst := 1
		}
	}
	


	;Wait for end screen (20s)
	Sleep, 20000


	;Continue
	MouseMove, xStart + (continueX*xMult), yStart + (continueY*yMult)
	Sleep, 500
	Send, {LButton}
	Sleep, 500


	;Sleep to give time to reset.
	Sleep, 5000

}
return




^+RButton::		; Use this to find the correct multiplier for your screen. 
			; When run, this should move your cursor to roughly the center of the Ready button.

MouseMove, xStart + (readyX*xMult), yStart + (readyY*yMult)

return


^q::
ExitApp
return
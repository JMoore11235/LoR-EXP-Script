# LoR-EXP-Script
Script to run with either two of your accounts or with another person. In essence, you use this to grind your daily win/loss exp. Designed to alternate wins between players, but can be run so one person always wins and one always loses.



# First time setup:<br><br>


**1. Install AutoHotKey**
  * Go to https://www.autohotkey.com/, click on "Download" and then "Download Current Version".
  * Run the executable, then you can click "Exit" when given the menu with 4 options. (You don't need to click on "Run AutoHotKey").
<br><br>

**2. Download "Lor Surrender Script vX_X.ahk"**

  * Self-explanatory. Put this file somewhere where you'll remember it (or don't, I don't care).
<br><br>

**3. Setup the script**

  * Right click on the script and click on "Edit Script". Notepad is fine for this (or something similar).<br>
  * Near the top, there should be 3 sets of two rows of stars. Between each set of rows, there are variables that you might have to change. There are explanations for each above the respective sections, but I will also go through them here.<br><br>
  * First, set xDim and yDim to the dimensions of your game window. If you are playing in full screen, just put your monitor dimensions here. (Note that if you have a scaled screen you'll need to do some quick maths for this if you are running in windowed mode; just mulitpy by the scale).<br><br>
  * Second, set xStart and yStart to how far down/right the top-left corner of the game is relative to the window. For fullscreen this is 0, 0. In fact I think xStart will always be 0, unless someone has funky settings (but I have it in there just in case). For windowed mode, I've found the header is about 30 pixels, so try "yStart := 30" (multiplied by your screen scaling if you have it) first.<br><br>
  * Finally, change surrenderFirst to the correct value. The values are explained here:
    * **0 or 1:**
  These are going to be the most common settings. When running this with another account to win-trade, make sure that one has this set to "1" and the other has it set to "0".<br>
    * **2:**
  This will always surrender. You can use this either to always surrender to another account, or the AI to farm only loss EXP.<br>
  If you are using this setting with another account, they should always be on -1.<br>
    * **-1:**
  This will always receive surrenders. DO NOT use this setting unless you are also running this script on another account with this setting set to 2.<br><br><br>



# Everytime:<br><br>

**1. Make sure that the script has the correct "surrenderFirst" number.**
 * If you are win-trading, make sure that the other account has a different number.<br><br>
  
**2. Start a Friendly Challenge, or Select "VS AI" in the Play menu**
 * Since you've made it this far, I'm assuming you're literate and can read English. Thus you should read the name of this step.<br><br>
 
**3. Click on a deck (but not the Ready button)**
 * The script needs you to start with the "Ready" button available, but still waiting.<br><br>
 
**4. Initialize the Script by running it**
 * This is usually done by double-clicking, but if you want to get really fancy, you can click on it once and then hit the "Enter" button (or some other way).<br><br>

**5. Start the Script (Simultaneously)**
 * Press "Control + Shift + Left Click" to start the script. Hopefully it clicks on the "Ready" button. If it doesn't, check your setup to make sure everything is right. If it still doesn't work then try debugging/re-writing the script until it does. Please then send me an updated version so I can copy it and claim it as my own (jk I don't plagiarize).<br>
 
 * If you're running this against the AI, obviously timing doesn't matter, but if you're running this against another account, try to start the scripts within a second or so of each other so that they don't get misaligned.<br><br>
 
 
**6. Go do something else for a while**
  * You should do something productive like reading a book, working out, or watching Netflix.<br><br>
  
**7. Stop the script**
  * By hitting "Control + q"



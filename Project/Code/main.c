/* 
===========================================================================================
=======================Project Statement and Progress by Will Brewer=======================
===========================================================================================
==
== My game is a side-scrolling action survival game, called RE/SPAWN
== 
== Main Game Loop:
== When the player starts the game, the player is dropped in the world,
== and monsters will assault them from both directions. The player
== must try to survive as long as possible by killing the monsters with their 
== weapons and abilities. Once they run out of health, the game ends.
==
== Game Specifications:
== -2D side-scroller with boundries (approximately 1 screen left and right 
==  of the starting area)
== -Game state will use tiled background, and 3 parralax layers (ground, mountains, sky)
== -Enemies will randomly spawn off the screen and start pursuing the player,
== -Each enemy type has a special AI that determines how they attack the player in game
== -The player has a series of attacks and abilities at their disposal:
== 		--Melee (gives the character forward momentum, like a "dash")
==		--Jump (also allows dashing while mid-air)
==		--Dash, allowing the player quick traversal
== -The player also has a stamina meter, restricting the amount of attacks they can dish out
==  Once stamina is out, the player must wait until it recharges
==
==
== What I think deserves extra credit:
== -All of the art in the game is hand drawn by me, and there are several enemies with full animation cycles
== -Novel Idea. I belive the game concept I came up with was exceptional, and was very pleased with the final product.
== -Game play is also very challanging. I playtested the game with several of my friends, so it should be fairly balanced.
== -THe player also has several animations depending on the action in game
==
== Current Bugs:
== Flying enemy collision is a tad bit buggy, and I couldn't get the score (number of monsters killed) to display on death
==
===========================================================================================
===========================================================================================
===========================================================================================
*/

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "engine.h"
#include "splash1.h"
#include "splash2.h"
#include "splash3.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "bottomFeeders.h"
#include "undertaleChoir.h"

//Buttons
extern unsigned int buttons;
extern unsigned int oldButtons;

//State
extern int state;

//Animation Timer
int timer = 0;
int currFrame = 0;
char* g;
extern int score;
char scorebuffer[30];


//=========================================================
// STATE MACHINE						
//=========================================================

int main() {

	initializeStart();

	while(1) {
		oldButtons = buttons;
		buttons = BUTTONS;

		//State Machine
		switch(state) {
			case STARTSCREEN :
				start();
				break;
			case GAMESCREEN :
				game();
				break;
			case WINSCREEN :
				win();
				break;
			case LOSESCREEN :
				lose();
				break;
			case PAUSESCREEN :
				pause();
				break;
			case GAMEDEATH :
				death();
				break;
		}
	}
}


//=========================================================
// STATE MACHINE METHODS					
//=========================================================

void initializeStart() {
	REG_DISPCTL = MODE4 | BG2_ENABLE | BUFFER2;

	loadPalette(splash1Pal);

	drawBackgroundImage4(splash1Bitmap);
	flipPage();
	drawBackgroundImage4(splash1Bitmap);

	setupInterrupts();
	setupSounds();

	playSoundA(undertaleChoir, UNDERTALECHOIRLEN, UNDERTALECHOIRFREQ, 0);

	state = STARTSCREEN;
}

void start() {
	if(timer > 13000) {
		timer = 0;
		
		switch(currFrame) {
			case 0 :
				//loadPalette(splash2Pal);
				fillScreen4(BLACK);
				drawBackgroundImage4(splash2Bitmap);
				flipPage();
				drawBackgroundImage4(splash2Bitmap);
				currFrame = 1;
				break;
			case 1 :
				//loadPalette(splash3Pal);
				fillScreen4(BLACK);
				drawBackgroundImage4(splash3Bitmap);
				flipPage();
				drawBackgroundImage4(splash3Bitmap);
				currFrame = 2;
				break;
			case 2 :
				//loadPalette(splash1Pal);
				fillScreen4(BLACK);
				drawBackgroundImage4(splash1Bitmap);
				flipPage();
				drawBackgroundImage4(splash1Bitmap);
				currFrame = 0;
				break;
		}
	} else {
		timer++;
	}

	if(BUTTON_PRESSED(BUTTON_START)) {
		initializeGame();
		playSoundA(bottomFeeders, BOTTOMFEEDERSLEN, BOTTOMFEEDERSFREQ, 1);
	}
}

void initializePause() {
	REG_DISPCTL = MODE4 | BG2_ENABLE | BUFFER2;
	loadPalette(pausePal);

	state = PAUSESCREEN;
}

void pause() {
	drawBackgroundImage4(pauseBitmap);
	flipPage();
	drawBackgroundImage4(pauseBitmap);

	if(BUTTON_PRESSED(BUTTON_START)) {
		fillScreen4(BLACK);
		flipPage();
		fillScreen4(BLACK);

		REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
		initGraphics();

		state = GAMESCREEN;
	}
}

void initializeWin() {
	REG_DISPCTL = MODE4 | BG2_ENABLE | BUFFER2;

	state = WINSCREEN;
}

void win() {
	drawBackgroundImage4(winBitmap);
	flipPage();
	drawBackgroundImage4(winBitmap);

	if(BUTTON_PRESSED(BUTTON_START)) {
		initializeGame();
	}
}

void initializeLose() {
	REG_DISPCTL = MODE4 | BG2_ENABLE | BUFFER2;
	loadPalette(losePal);

	state = LOSESCREEN;
}

void lose() {
	drawBackgroundImage4(loseBitmap);
	flipPage();
	drawBackgroundImage4(loseBitmap);

	if(BUTTON_PRESSED(BUTTON_START)) {
		initializeGame();
	}
}
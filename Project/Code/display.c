/*
========================== display.c ============================
==
== Contains the methods that control what is displayed on screen:
== -Animation
== -Showing and hiding sprites
== -OAM functions
==================================================================
*/

#include "display.h"
#include "sword.h"

//Sprite memory
OBJ_ATTR shadowOAM[128];

int aniIsFinish = 1;
int cooldown = 0;
int isAttack = 0;

int counter = 0;


//=========================================================
// SPRITE DRAWING FUNCTIONS					
//=========================================================

void hideSprites() {
	for(int i = 0; i < 128; i++) {
		shadowOAM[i].attr0 = ATTR0_HIDE;
		DMANow(3, shadowOAM, OAM, 512);
	}
}

//Updates OAM for player and enemies
void updateOAM(MOVOBJ sprite, int index) {
	if(BUTTON_PRESSED(BUTTON_R))
	{
		counter++;
		counter %= 15;
		REG_MOSIAC = OH(counter) | OV(counter);
	}
	
	if(!sprite.isHide) {
		shadowOAM[index].attr0 = (ROWMASK & SHIFTDOWN(sprite.row)) | ATTR0_4BPP | sprite.shape | ATTR0_MOSAIC;
		shadowOAM[index].attr1 = (COLMASK & SHIFTDOWN(sprite.col)) | sprite.size | sprite.flip;

		if(sprite.type == 3 || sprite.type == 0) {
			shadowOAM[index].attr2 = SPRITEOFFSET16(2 * sprite.currFrame, 4 * sprite.prevAniState);
		} else {
			shadowOAM[index].attr2 = SPRITEOFFSET16(sprite.currFrame, 2 * sprite.prevAniState);
		}  		

	} else {
		shadowOAM[index].attr0 |= ATTR0_HIDE;
	}

	DMANow(3, shadowOAM, OAM, 512);
}


//=========================================================
// SPRITE ANIMATION FUNCTIONS					
//=========================================================

void animate() {
	animatePlayer();
	animateEnemies();
	animateUI();
}

void animatePlayer() {
	player.prevAniState = player.aniState;

	if(player.aniCounter % 4 == 0) {
		player.aniCounter = 0;

		if((player.currFrame == 3 && player.prevAniState == PLAYERATTACK) || player.currFrame == 9) {
			player.currFrame = 0;
			aniIsFinish = 1;
		} else {
			player.currFrame++;
		}
	} 

	if(aniIsFinish || BUTTON_PRESSED(BUTTON_B)) {
		player.aniState = PLAYERIDLE;

		if(BUTTON_HELD(BUTTON_LEFT)) {
			player.aniState = PLAYERRUN;
			player.flip = ATTR1_HFLIP;
		}

		if(BUTTON_HELD(BUTTON_RIGHT)) {
			player.aniState = PLAYERRUN;
			player.flip = 0;
		}

		if(BUTTON_PRESSED(BUTTON_A)) {
			player.aniState = PLAYERJUMP;
			aniIsFinish = 0;
			player.currFrame = 0;
		}

		if(BUTTON_PRESSED(BUTTON_B) && player.stamina > 0) {
			player.stamina--;
			player.aniState = PLAYERATTACK;
			playSoundB(sword, SWORDLEN, SWORDFREQ, 0);
			aniIsFinish = 0;
			player.currFrame = 0;
		}
		
		if(BUTTON_PRESSED(BUTTON_L)) {
			//player.aniState = PLAYERDASH;
		}

		if(BUTTON_PRESSED(BUTTON_R)) {
			//player.aniState = PLAYERSMASH;
		}
	}

	updateOAM(player, 0);

	player.aniCounter++;
}

void animateEnemies() {
	int oamCounter = 2;

	for(int i = 0; i < 50; i++) {
		enemies[i].prevAniState = 4;

		if(enemies[i].aniCounter % 8 == 0) {
			enemies[i].aniCounter = 0;

			if(enemies[i].currFrame == 8) {
				enemies[i].currFrame = 0;
			} else {
				enemies[i].currFrame += 2;
			}
		}

		switch(enemies[i].type) {
			case 0 :
				enemies[i].prevAniState = 4;
				break;
			case 1 :
				enemies[i].prevAniState = 9;
				break;
			case 2 :
				enemies[i].prevAniState = 11;
				break;
		}
	
		updateOAM(enemies[i], oamCounter);
		oamCounter++;
		enemies[i].aniCounter++;
	}
}

void animateUI() {
	shadowOAM[1].attr0 = (ROWMASK & 0) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[1].attr1 = (COLMASK & 0) | ATTR1_SIZE64;
	shadowOAM[1].attr2 = (SPRITEOFFSET16(20, 0)) | (ATTR2_PALBANK(1));

	//Update Stamina
	if(player.stamina == 3) {
		SPRITE_PALETTE[20] = UIYELLOW;
		SPRITE_PALETTE[21] = UIYELLOW; 
		SPRITE_PALETTE[22] = UIYELLOW;
	} else if(player.stamina == 2) {
		SPRITE_PALETTE[20] = UIYELLOW; 
		SPRITE_PALETTE[21] = UIYELLOW;
		SPRITE_PALETTE[22] = UIGREY;
	} else if(player.stamina == 1) {
		SPRITE_PALETTE[20] = UIYELLOW;
		SPRITE_PALETTE[21] = UIGREY; 
		SPRITE_PALETTE[22] = UIGREY;
	} else {
		SPRITE_PALETTE[20] = UIGREY; 
		SPRITE_PALETTE[21] = UIGREY; 
		SPRITE_PALETTE[22] = UIGREY;
	}

	//Update Health
	if(player.hitPoints == 3) {
		SPRITE_PALETTE[17] = UIRED; 
		SPRITE_PALETTE[18] = UIRED; 
		SPRITE_PALETTE[19] = UIRED;
	} else if(player.hitPoints == 2) {
		SPRITE_PALETTE[17] = UIRED; 
		SPRITE_PALETTE[18] = UIRED; 
		SPRITE_PALETTE[19] = UIGREY;
	} else {
		SPRITE_PALETTE[17] = UIRED; 
		SPRITE_PALETTE[18] = UIGREY; 
		SPRITE_PALETTE[19] = UIGREY;
	}

	//Update Special

	DMANow(3, shadowOAM, OAM, 512);
}

void initGraphics() {
	//Switch to MODE0 for Game
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

	REG_BG0CNT = CBB(0) | SBB(30) | BG_SIZE1;
	REG_BG1CNT = CBB(1) | SBB(28) | BG_SIZE1;
	REG_BG2CNT = CBB(2) | SBB(26) | BG_SIZE1;

	//Initialize backgrounds
	loadPalette(tilemap_ground_v1Pal);
	DMANow(3, tilemap_ground_v1Tiles, &CHARBLOCKBASE[0], tilemap_ground_v1TilesLen/2);
	DMANow(3, tilemap_ground_v1Map, &SCREENBLOCKBASE[30], tilemap_ground_v1MapLen/2);

    DMANow(3, tilemap_mountainsv1Tiles, &CHARBLOCKBASE[1], tilemap_mountainsv1TilesLen/2);
    DMANow(3, tilemap_mountainsv1Map, &SCREENBLOCKBASE[28], tilemap_mountainsv1MapLen/2);

    DMANow(3, tilemap_moonTiles, &CHARBLOCKBASE[2], tilemap_moonTilesLen/2);
    DMANow(3, tilemap_moonMap, &SCREENBLOCKBASE[26], tilemap_moonMapLen/2);
	
	DMANow(3, sprite_sheet_v1Tiles, &CHARBLOCKBASE[4], sprite_sheet_v1TilesLen/2);
	DMANow(3, sprite_sheet_v1Pal, SPRITE_PALETTE, sprite_sheet_v1PalLen/2);
}
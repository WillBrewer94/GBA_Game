/*
========================== engine.c ============================
== 
== Contains methods to drive the game engine: 
== -Game Logic
== -Physics Calculations
== -Input Processing
== -Collisions
================================================================
*/ 

#include <stdlib.h>
#include <time.h>
#include <math.h>
#include "engine.h"
#include "bottomFeeders.h"
#include "undertaleChoir.h"
#include "sword.h"
#include "fleshTear.h"

//Buttons
unsigned int buttons;
unsigned int oldButtons;

//Tile Scroll Variables
int hOff = 136;
int vOff = 20;

//Game Variables
int isOver = 0;
int isCheat = 0;
int state;
int attackTimer = 0;
int hitTimer = 0;
int isDash = 0;
int isHit = 0;
int jumpCount = 0;
int coolDown = 20;
int frameCount = 0;
int enemyTimer = 0;
int enemyCount = 0;
int enemyMultiplier = 0;
int deathTimer = 0;
int score = 0;

//Display.h Externs
MOVOBJ player;
MOVOBJ enemies[50];
int sbb;


//=========================================================
// GAME LOOP FUNCTIONS						
//=========================================================

void initializeGame() {
	fillScreen4(BLACK);
	flipPage();
	fillScreen4(BLACK);

	initGraphics();

	//Set initial player values
	player.row = SHIFTUP(100);
	player.col = SHIFTUP(120);
	player.size = ATTR1_SIZE32;
	player.shape = ATTR0_WIDE;
	player.width = 32;
	player.height = 16;
	player.rDir = 0;
	player.cDir = 0;
	player.rAcc = 80;
	player.cAcc = 100;
	player.stopRange = 50;
	player.maxHSpeed = SHIFTUP(8);
	player.maxVSpeed = SHIFTUP(5);
	player.isHide = 0;
	player.type = 3;

	player.hitPoints = 3;
	player.stamina = 3;
	player.isAttack = 0;

	hideSprites();

	enemyCount = 0;

	//Initialize Enemy isHide to 0
	for(int i = 0; i < 50; i++) {
		enemies[i].isHide = 1;
	}

	//Set up random number generator
	srand(time(NULL));

	//Set moon hOff
	REG_BG2HOFS = 50;
	REG_BG2VOFS = vOff;

	score = 0;

	state = GAMESCREEN;
}

void game() {
	if(!isOver) {
		update();
		waitForVblank();
		draw();
		frameCount++;
	}

	//Initialize lose if hitPoints drop below 1
	if(player.hitPoints <= 0) {
		initializeDeath();
	}

	if(BUTTON_PRESSED(BUTTON_START)) {
		initializePause();
	}
}

void initializeDeath() {
	playSoundA(fleshTear, FLESHTEARLEN, FLESHTEARFREQ, 0);
	state = GAMEDEATH;
}

void death() {
	if(deathTimer > 100000) {
		initializeLose();

	} else {
		deathTimer++;
	}
}

void update() {
	updatePlayer();

	updateEnemies();

	//Ensures hOff never goes beyond the bounds of the ground tilemap
	if(hOff <= 0) {
		hOff = 0;
	} else if(hOff + 240 >= 512) {
		hOff = 512 - 240;
	} 

	if(frameCount % 1000) enemyMultiplier++;

	REG_BG0HOFS = hOff;
	REG_BG0VOFS = vOff;

	REG_BG1HOFS = hOff / 2;
	REG_BG1VOFS = vOff / 2;

	REG_BG2HOFS = hOff / 3;
	REG_BG2VOFS = vOff / 3;
}	

void draw() {
	animate();
}


//=========================================================
// GAME LOGIC FUNCTIONS							
//=========================================================

//=========================
// PLAYER							
//=========================

void updatePlayer() {
	player.rDir += player.rAcc;
	player.row += player.rDir;

	if(hOff >= 512 || hOff <= 0) {
		player.col += player.cDir;
	} else {
		hOff += SHIFTDOWN(player.cDir);
	}

	//Updates player position based on row/col
	player.bigRow = player.row + SHIFTUP(vOff);
	player.bigCol = player.col + SHIFTUP(hOff);

	//Make attack last x frames
	if(player.isAttack == 1 && attackTimer < 20) {
		attackTimer++;
	} else {
		player.isAttack = 0;
		attackTimer = 0;
	}

	//Stamina Recharge
	if(frameCount % 80 == 0 && player.stamina < 3) {
		player.stamina++;
	}

	//Gound Collision
	if(SHIFTDOWN(player.row) >= SCREENHEIGHT - 32) {
		player.row = SHIFTUP(SCREENHEIGHT - 32);
		player.rDir = 0;
		jumpCount = 0;
	}

	//Ceiling Collision
	if(SHIFTDOWN(player.row) < 0) {
		player.row = 0;
		player.rDir = 0;
	}

	//Left Wall Collision
	if(SHIFTDOWN(player.col) <= 0) {
		player.col = 0;
		player.cDir = 0;
	}

	//Right Wall Collision
	if(SHIFTDOWN(player.col) >= SCREENWIDTH - 32 - 1) {
		player.col = SHIFTUP(SCREENWIDTH - 32 - 1);
	}

   	//Player deceleration
    if(player.cDir < 0) {
       player.cDir += player.cAcc;
    } else if(player.cDir > 0) {
       player.cDir -= player.cAcc;
    } 

    //Zeroes out cDir if below stoprange
    if(player.cDir < player.stopRange && player.cDir > -player.stopRange) {
       player.cDir = 0;
    } 

    //Sets dash flag to false
    if(player.cDir <= 0) {
   		isDash = 0;
    } 

	playerInput();
}

void playerInput() {
	//Player Jumping and double jump
	if(BUTTON_PRESSED(BUTTON_A)) { 
		if(jumpCount < 2) {
			player.rDir = -player.maxVSpeed;
			jumpCount++;
		} 
	}

	//Player Movement, also cancels dash if move in opposite direction
	if(BUTTON_HELD(BUTTON_LEFT)) {
		if(hOff > 0 && SHIFTDOWN(player.col) + player.width/2 < 120) {
			hOff -= 2;
		} else {
			player.col -= SHIFTUP(3);
		}

		player.flip = ATTR1_HFLIP;

		if(player.cDir > 0) { 
			player.cDir = 0;
		}

	} else if(BUTTON_HELD(BUTTON_RIGHT)) {
		if(hOff + 240 < 512 && SHIFTDOWN(player.col) + player.width/2 > 120) {
			hOff += 2;
		} else {
			player.col += SHIFTUP(3);
		}

		player.flip = 0;
		
		if(player.cDir < 0) {
			player.cDir = 0;
		}
	}

	//Basic Attack
	if(BUTTON_PRESSED(BUTTON_B) && player.stamina > 0) {
		if(BUTTON_HELD(BUTTON_LEFT)) {
			player.cDir = -800;
		}

		if(BUTTON_HELD(BUTTON_RIGHT)) {
			player.cDir = 800;
		}

		player.isAttack = 1;
	}

	//Dash Attack
	if(BUTTON_HELD(BUTTON_LEFT) && BUTTON_PRESSED(BUTTON_L)) {
		dash(-1);
		isDash = 1;
	} else if(BUTTON_HELD(BUTTON_RIGHT) && BUTTON_PRESSED(BUTTON_L)) {
		dash(1);
		isDash = 1;
	}
	
	if(player.cDir <= 0) {
		isDash = 0;
	}

	//Cheat
	if(BUTTON_PRESSED(BUTTON_R)) {
		isCheat = 1;
	}
}

void dash(int d) {
	player.cDir = d * 1600;
}

//=========================
// ENEMIES		
//=========================

//Spawn an enemy every 60 frames
void spawner() {
	if(enemyTimer == 30 && enemyCount < 50) {
		enemyTimer = 0;
		 
		createEnemy();

		enemyCount++;

	} else {
		enemyTimer++;
	}
}

void createEnemy() {
	int loc = getRand(0, 2);
	int random = getRand(0, 5);
	//getRand(0, 4);

	if(enemyCount < 50) {
		for(int i = 0; i < 50; i++) {
			if(enemies[i].isHide) {
				enemies[i].rDir = 0;
				enemies[i].cDir = 0;
				enemies[i].rAcc = 150;
				enemies[i].cAcc = 100;
				enemies[i].stopRange = 50;
				enemies[i].isHide = 0;

				enemies[i].size = ATTR1_SIZE32;

				switch(random) {
					case 0 :
					case 1 :
					case 2 :
						enemies[i].width = 16;
						enemies[i].height = 32;
						enemies[i].bigRow = SHIFTUP(100);
						enemies[i].shape = ATTR0_TALL;
						enemies[i].type = 0;
						break;
					case 3 :
						enemies[i].width = 32;
						enemies[i].height = 16;
						enemies[i].bigRow = SHIFTUP(100);
						enemies[i].shape= ATTR0_WIDE;
						enemies[i].type = 1;
						break;
					case 4 :
						enemies[i].width = 32;
						enemies[i].height = 16;
						enemies[i].bigRow = SHIFTUP(100);
						enemies[i].shape= ATTR0_WIDE;
						enemies[i].type = 2;
						break;
				}				

				enemies[i].maxHSpeed = SHIFTUP(8);
				enemies[i].maxVSpeed = SHIFTUP(9);

				if(loc == 1) {
					enemies[i].bigCol = SHIFTUP(0);
				} else {
					enemies[i].bigCol = SHIFTUP(512);
				}

				break;
			}
		}
	}
}

void updateEnemies() {
	spawner();

	for(int i = 0; i < 50; i++) {
		if(!enemies[i].isHide) {
		    switch(enemies[i].type) {
		    	case 0 :
		    		tiltedManAI(&enemies[i]);		
		    		break;
	    		case 1 :
	    			amalgamAI(&enemies[i]);
    				break;
    			case 2 :
    				voidFlyerAI(&enemies[i]);
	    			break;
		    }

		    //Hide enemy if off screen
		    //currEnemy->isHide = (SHIFTDOWN(currEnemy->col) < -currEnemy->width || SHIFTDOWN(currEnemy->col) > 240) ? 1 : 0;

		    enemyCollisions(&enemies[i]);
		}
	} 
}

void tiltedManAI(MOVOBJ* enemy) {
	enemy->rDir += enemy->rAcc;
	enemy->row += enemy->rDir;
	enemy->col += enemy->cDir;

	enemy->row = enemy->bigRow - SHIFTUP(vOff);
	enemy->col = enemy->bigCol - SHIFTUP(hOff);

	if(SHIFTDOWN(enemy->bigRow) <= SCREENHEIGHT - enemy->height) {
		enemy->bigRow = SHIFTUP(SCREENHEIGHT - enemy->height + 4);
	}

	//Enemy deceleration
    if(enemy->cDir < 0) {
       enemy->cDir += enemy->cAcc;
    } else if(enemy->cDir > 0) {
       enemy->cDir -= enemy->cAcc;
    }

    //Zeroes out cDir if below stoprange
    if(enemy->cDir < enemy->stopRange && enemy->cDir > enemy->stopRange) {
        enemy->cDir = 0;
    }

    //Moves towards player
    if(enemy->bigCol > player.bigCol) {
    	enemy->bigCol -= SHIFTUP(getRand(0, 2));
    	enemy->flip = ATTR1_HFLIP;
    }

    if(enemy->bigCol < player.bigCol) {
    	enemy->bigCol += SHIFTUP(getRand(0, 2));
    	enemy->flip = 0;
    }
}

void amalgamAI(MOVOBJ* enemy) {
	enemy->row = enemy->bigRow - SHIFTUP(vOff);
	enemy->col = enemy->bigCol - SHIFTUP(hOff);

	enemy->row += enemy->rDir;
	enemy->col += enemy->cDir;

	if(SHIFTDOWN(enemy->bigRow) <= SCREENHEIGHT - enemy->height) {
		enemy->bigRow = SHIFTUP(SCREENHEIGHT - enemy->height + 4);
	}

	//Enemy deceleration
    if(enemy->cDir < 0) {
       enemy->cDir += enemy->cAcc;
    } else if(enemy->cDir > 0) {
       enemy->cDir -= enemy->cAcc;
    }

    if(enemy->rDir < 0) {
    	enemy->rDir += enemy->rAcc;
    } else if(enemy->rDir > 0) {
       enemy->rDir -= enemy->cAcc;
    }

    //Zeroes out cDir if below stoprange 
    if(enemy->cDir < enemy->stopRange && enemy->cDir > enemy->stopRange) {
        enemy->cDir = 0;
    }

    //Moves fast towards player
    if((SHIFTDOWN(enemy->bigCol) + enemy->width > SHIFTDOWN(player.bigCol) - 100 && SHIFTDOWN(enemy->bigCol) + enemy->width < SHIFTDOWN(player.bigCol) + player.width) 
    		|| (SHIFTDOWN(enemy->bigCol) < SHIFTDOWN(player.bigCol) + player.width + 100 && SHIFTDOWN(enemy->bigCol) > SHIFTDOWN(player.bigCol))) {
    	//Moves towards player
	    if(enemy->bigCol > player.bigCol) {
	    	enemy->bigCol -= SHIFTUP(getRand(0, 5));
	    	enemy->flip = ATTR1_HFLIP;
	    }

	    if(enemy->bigCol < player.bigCol) {
	    	enemy->bigCol += SHIFTUP(getRand(0, 5));
	    	enemy->flip = 0;
	    }

    } else {
    	//Moves towards player
	    if(enemy->bigCol > player.bigCol) {
	    	enemy->bigCol -= SHIFTUP(getRand(0, 2));
	    	enemy->flip = ATTR1_HFLIP;
	    }

	    if(enemy->bigCol < player.bigCol) {
	    	enemy->bigCol += SHIFTUP(getRand(0, 2));
	    	enemy->flip = 0;
	    }
    }
}

void voidFlyerAI(MOVOBJ* enemy) {
	enemy->rDir += enemy->rAcc;
	enemy->row += enemy->rDir;
	enemy->col += enemy->cDir;

	enemy->row = enemy->bigRow - SHIFTUP(vOff);
	enemy->col = enemy->bigCol - SHIFTUP(hOff);

	if(SHIFTDOWN(enemy->bigRow) <= SCREENHEIGHT - enemy->height - 50) {
		enemy->bigRow = SHIFTUP(SCREENHEIGHT - enemy->height - 50);
		enemy->rDir = 0;
	}

	if(SHIFTDOWN(enemy->bigRow) > SCREENHEIGHT - enemy->height) {
		enemy->isHide = 1;
	}

	//Enemy deceleration
    if(enemy->cDir < 0) {
       enemy->cDir += enemy->cAcc;
    } else if(enemy->cDir > 0) {
       enemy->cDir -= enemy->cAcc;
    }

    if(enemy->cDir < enemy->stopRange && enemy->cDir > enemy->stopRange) {
        enemy->cDir = 0;
    }

    //Rapidly moves down
    if((SHIFTDOWN(enemy->bigCol) + enemy->width > SHIFTDOWN(player.bigCol) && SHIFTDOWN(enemy->bigCol) + enemy->width < SHIFTDOWN(player.bigCol) + player.width) 
    		|| (SHIFTDOWN(enemy->bigCol) < SHIFTDOWN(player.bigCol) + player.width && SHIFTDOWN(enemy->bigCol) > SHIFTDOWN(player.bigCol))) {
    	enemy->bigRow += SHIFTUP(3);

    } else {
    	//Moves towards player
	    if(enemy->bigCol > player.bigCol) {
	    	enemy->bigCol -= SHIFTUP(getRand(0, 2));
	    	enemy->flip = ATTR1_HFLIP;
	    }

	    if(enemy->bigCol < player.bigCol) {
	    	enemy->bigCol += SHIFTUP(getRand(0, 2));
	    	enemy->flip = 0;
	    }
    }
}

void enemyCollisions(MOVOBJ* currEnemy) {
	//Checks if enemy is in attack range
	if(player.isAttack) {
		if(player.flip == 0 && SHIFTDOWN(currEnemy->bigCol) < SHIFTDOWN(player.bigCol) + player.width + 3 && SHIFTDOWN(currEnemy->bigCol) > SHIFTDOWN(player.bigCol)
				&& abs(SHIFTDOWN(player.bigRow) - SHIFTDOWN(currEnemy->bigRow)) < 20) { //Attacking left
			currEnemy->isHide = 1;
			enemyCount--;
			currEnemy->cDir = -1000;
		} else if(SHIFTDOWN(currEnemy->bigCol) + currEnemy->width > SHIFTDOWN(player.bigCol) - 3 && SHIFTDOWN(currEnemy->bigCol) + currEnemy->width < SHIFTDOWN(player.bigCol) + player.width
				&& abs(SHIFTDOWN(player.bigRow) - SHIFTDOWN(currEnemy->bigRow)) < 20) { //Attacking right
			currEnemy->isHide = 1;
			enemyCount--;
			currEnemy->cDir = 1000;
		}
	}

	if(isHit == 1 && hitTimer < 200) {
		hitTimer++;
	} else if(currEnemy->isHide == 0 && player.isAttack == 0 && player.cDir <= 0) {
		isHit = 0;
		hitTimer = 0;
		//Checks if enemy can damage player
		if(abs(SHIFTDOWN(currEnemy->bigRow) - SHIFTDOWN(player.bigRow)) < 30) { //If at same height
			if(SHIFTDOWN(currEnemy->bigCol) < SHIFTDOWN(player.bigCol) + 10 && SHIFTDOWN(currEnemy->bigCol) > SHIFTDOWN(player.bigCol)) {//Colliding from right
				//Knock player to the left
				if(!isCheat) {
					isHit = 1;
					player.cDir = -1000;
					player.rDir = -500;
					player.hitPoints--;
				}
			} else if(SHIFTDOWN(currEnemy->bigCol) + 4 > SHIFTDOWN(player.bigCol) && SHIFTDOWN(currEnemy->bigCol) < SHIFTDOWN(player.bigCol) + 10) {//Colliding from left
				//Knock player to the right
				if(!isCheat) {
					isHit = 1;
					player.cDir = 1000;
					player.rDir = -500;
					player.hitPoints--;
				}
			}
		}
	}
}

//=========================
// HELPER METHODS	
//=========================

int getRand(int min, int max) {
	int random = rand() % max + min;

	return random;
}
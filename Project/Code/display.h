//Header files used by display.c
#include "myLib.h"
#include "tilemap_ground_v1.h"
#include "tilemap_mountainsv1.h"
#include "sprite_sheet_v1.h"
#include "tilemap_moon.h"

//=========================================================
// GLOBAL VARIABLES			
//=========================================================

//Player Sprite
extern MOVOBJ player;

//Enemy Sprites
extern MOVOBJ enemies[50];


//=========================================================
// ENUMS						
//=========================================================

enum { PLAYERIDLE, PLAYERRUN, PLAYERJUMP, PLAYERATTACK };
enum { ENEMYLEFT, ENEMYRIGHT, ENEMYATTACK, ENEMYDIE };


//=========================================================
// DISPLAY PROTOTYPES					
//=========================================================

void hideSprites();
void animate();
void animatePlayer();
void animateEnemies();
void animateUI();
void updateOAM(MOVOBJ sprite, int index);
void initGraphics();
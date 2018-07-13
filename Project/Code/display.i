# 1 "display.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "display.c"
# 11 "display.c"
# 1 "display.h" 1

# 1 "myLib.h" 1



typedef unsigned short u16;
# 59 "myLib.h"
extern unsigned short *videoBuffer;
extern unsigned short *buffer1;
extern unsigned short *buffer2;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;






void drawSprites();
void hideSprites();






void setPixel3(int row, int col,volatile unsigned short color);
void drawRect3(int row, int col, int height, int width,volatile unsigned short color);
void fillScreen3(volatile unsigned short color);






void waitForVblank();
void flipPage();
void setPixel4(int row, int col,volatile unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(volatile unsigned char color);
void drawBackgroundImage4(volatile const unsigned short* image);
void drawImage4(volatile const unsigned short* image, int row, int col, int height, int width);
void loadPalette(volatile const unsigned short* palette);
void drawSubImage4(volatile const unsigned short* sourceImage, int sourceRow, int sourceCol, int sourceWidth,
       int row, int col, int height, int width);
# 115 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 127 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef volatile struct {
        volatile const void *src;
        volatile const void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 254 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

void setupSounds();
void playSoundA(const unsigned char* sound, int length, int frequency, int isLoops);
void playSoundB(const unsigned char* sound, int length, int frequency, int isLoops);
void pauseSound();
void unpauseSound();
void muteSound();
void unmuteSound();
void stopSound();
void setupInterrupts();
void interruptHandler();





typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 306 "myLib.h"
void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb);
# 353 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;

typedef struct {
    int row;
    int col;
    int bigRow;
    int bigCol;

    int rDir;
    int cDir;
    int rAcc;
    int cAcc;
    int maxHSpeed;
    int maxVSpeed;
    int stopRange;

    int shape;
    int size;
    int flip;
    int width;
    int height;
    int type;

    int hitPoints;
    int stamina;
    int special;
    int isAttack;

    int aniState;
    int aniCounter;
    int prevAniState;
    int currFrame;
    int isHide;
} MOVOBJ;






typedef struct NODE {
    MOVOBJ enemy;
    struct NODE *next;
} NODE;

void addItem(NODE **head_ref, MOVOBJ newEnemy);
void deleteNode(NODE *head, NODE *n);
# 3 "display.h" 2
# 1 "tilemap_ground_v1.h" 1
# 22 "tilemap_ground_v1.h"
extern const unsigned short tilemap_ground_v1Tiles[1856];


extern const unsigned short tilemap_ground_v1Map[2048];


extern const unsigned short tilemap_ground_v1Pal[256];
# 4 "display.h" 2
# 1 "tilemap_mountainsv1.h" 1
# 22 "tilemap_mountainsv1.h"
extern const unsigned short tilemap_mountainsv1Tiles[4208];


extern const unsigned short tilemap_mountainsv1Map[2048];


extern const unsigned short tilemap_mountainsv1Pal[256];
# 5 "display.h" 2
# 1 "sprite_sheet_v1.h" 1
# 21 "sprite_sheet_v1.h"
extern const unsigned short sprite_sheet_v1Tiles[16384];


extern const unsigned short sprite_sheet_v1Pal[256];
# 6 "display.h" 2
# 1 "tilemap_moon.h" 1
# 22 "tilemap_moon.h"
extern const unsigned short tilemap_moonTiles[3184];


extern const unsigned short tilemap_moonMap[2048];


extern const unsigned short tilemap_moonPal[256];
# 7 "display.h" 2






extern MOVOBJ player;


extern MOVOBJ enemies[50];






enum { PLAYERIDLE, PLAYERRUN, PLAYERJUMP, PLAYERATTACK };
enum { ENEMYLEFT, ENEMYRIGHT, ENEMYATTACK, ENEMYDIE };






void hideSprites();
void animate();
void animatePlayer();
void animateEnemies();
void animateUI();
void updateOAM(MOVOBJ sprite, int index);
void initGraphics();
# 12 "display.c" 2
# 1 "sword.h" 1
# 20 "sword.h"
extern const unsigned char sword[6087];
# 13 "display.c" 2


OBJ_ATTR shadowOAM[128];

int aniIsFinish = 1;
int cooldown = 0;
int isAttack = 0;

int counter = 0;






void hideSprites() {
 for(int i = 0; i < 128; i++) {
  shadowOAM[i].attr0 = (2 << 8);
  DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
 }
}


void updateOAM(MOVOBJ sprite, int index) {
 if((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8)))))
 {
  counter++;
  counter %= 15;
  *(unsigned short *)0x0400004C = ((counter)<<8) | ((counter)<<12);
 }

 if(!sprite.isHide) {
  shadowOAM[index].attr0 = (0xFF & ((sprite.row) >> 8)) | (0 << 13) | sprite.shape | (1 << 12);
  shadowOAM[index].attr1 = (0x1FF & ((sprite.col) >> 8)) | sprite.size | sprite.flip;

  if(sprite.type == 3 || sprite.type == 0) {
   shadowOAM[index].attr2 = (2 * sprite.currFrame)*32+(4 * sprite.prevAniState);
  } else {
   shadowOAM[index].attr2 = (sprite.currFrame)*32+(2 * sprite.prevAniState);
  }

 } else {
  shadowOAM[index].attr0 |= (2 << 8);
 }

 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}






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

 if(aniIsFinish || (!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
  player.aniState = PLAYERIDLE;

  if((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
   player.aniState = PLAYERRUN;
   player.flip = (1 << 12);
  }

  if((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
   player.aniState = PLAYERRUN;
   player.flip = 0;
  }

  if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
   player.aniState = PLAYERJUMP;
   aniIsFinish = 0;
   player.currFrame = 0;
  }

  if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))) && player.stamina > 0) {
   player.stamina--;
   player.aniState = PLAYERATTACK;
   playSoundB(sword, 6087, 11025, 0);
   aniIsFinish = 0;
   player.currFrame = 0;
  }

  if((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {

  }

  if((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8))))) {

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
 shadowOAM[1].attr0 = (0xFF & 0) | (0 << 13) | (1 << 14);
 shadowOAM[1].attr1 = (0x1FF & 0) | (3 << 14);
 shadowOAM[1].attr2 = ((20)*32+(0)) | (((1)<<12));


 if(player.stamina == 3) {
  ((unsigned short*)(0x5000200))[20] = ((27) | (26)<<5 | (6)<<10);
  ((unsigned short*)(0x5000200))[21] = ((27) | (26)<<5 | (6)<<10);
  ((unsigned short*)(0x5000200))[22] = ((27) | (26)<<5 | (6)<<10);
 } else if(player.stamina == 2) {
  ((unsigned short*)(0x5000200))[20] = ((27) | (26)<<5 | (6)<<10);
  ((unsigned short*)(0x5000200))[21] = ((27) | (26)<<5 | (6)<<10);
  ((unsigned short*)(0x5000200))[22] = ((2) | (2)<<5 | (2)<<10);
 } else if(player.stamina == 1) {
  ((unsigned short*)(0x5000200))[20] = ((27) | (26)<<5 | (6)<<10);
  ((unsigned short*)(0x5000200))[21] = ((2) | (2)<<5 | (2)<<10);
  ((unsigned short*)(0x5000200))[22] = ((2) | (2)<<5 | (2)<<10);
 } else {
  ((unsigned short*)(0x5000200))[20] = ((2) | (2)<<5 | (2)<<10);
  ((unsigned short*)(0x5000200))[21] = ((2) | (2)<<5 | (2)<<10);
  ((unsigned short*)(0x5000200))[22] = ((2) | (2)<<5 | (2)<<10);
 }


 if(player.hitPoints == 3) {
  ((unsigned short*)(0x5000200))[17] = ((15) | (1)<<5 | (1)<<10);
  ((unsigned short*)(0x5000200))[18] = ((15) | (1)<<5 | (1)<<10);
  ((unsigned short*)(0x5000200))[19] = ((15) | (1)<<5 | (1)<<10);
 } else if(player.hitPoints == 2) {
  ((unsigned short*)(0x5000200))[17] = ((15) | (1)<<5 | (1)<<10);
  ((unsigned short*)(0x5000200))[18] = ((15) | (1)<<5 | (1)<<10);
  ((unsigned short*)(0x5000200))[19] = ((2) | (2)<<5 | (2)<<10);
 } else {
  ((unsigned short*)(0x5000200))[17] = ((15) | (1)<<5 | (1)<<10);
  ((unsigned short*)(0x5000200))[18] = ((2) | (2)<<5 | (2)<<10);
  ((unsigned short*)(0x5000200))[19] = ((2) | (2)<<5 | (2)<<10);
 }



 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void initGraphics() {

 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1<<10) | (1 << 12);

 *(volatile unsigned short*)0x4000008 = 0 << 2 | 30 << 8 | 1<<14;
 *(volatile unsigned short*)0x400000A = 1 << 2 | 28 << 8 | 1<<14;
 *(volatile unsigned short*)0x400000C = 2 << 2 | 26 << 8 | 1<<14;


 loadPalette(tilemap_ground_v1Pal);
 DMANow(3, tilemap_ground_v1Tiles, &((charblock *)0x6000000)[0], 3712/2);
 DMANow(3, tilemap_ground_v1Map, &((screenblock *)0x6000000)[30], 4096/2);

    DMANow(3, tilemap_mountainsv1Tiles, &((charblock *)0x6000000)[1], 8416/2);
    DMANow(3, tilemap_mountainsv1Map, &((screenblock *)0x6000000)[28], 4096/2);

    DMANow(3, tilemap_moonTiles, &((charblock *)0x6000000)[2], 6368/2);
    DMANow(3, tilemap_moonMap, &((screenblock *)0x6000000)[26], 4096/2);

 DMANow(3, sprite_sheet_v1Tiles, &((charblock *)0x6000000)[4], 32768/2);
 DMANow(3, sprite_sheet_v1Pal, ((unsigned short*)(0x5000200)), 512/2);
}

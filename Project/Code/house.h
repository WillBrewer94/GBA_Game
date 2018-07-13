
//{{BLOCK(house)

//======================================================================
//
//	house, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 57 tiles (t|f reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 3648 + 2048 = 6208
//
//	Time-stamp: 2009-10-28, 17:34:25
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef __HOUSE__
#define __HOUSE__

#define houseTilesLen 3648
extern const unsigned short houseTiles[1824];

#define houseMapLen 2048
extern const unsigned short houseMap[1024];

#define housePalLen 512
extern const unsigned short housePal[256];

#endif // __HOUSE__

//}}BLOCK(house)

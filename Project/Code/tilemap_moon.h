
//{{BLOCK(tilemap_moon)

//======================================================================
//
//	tilemap_moon, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 199 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 6368 + 4096 = 10976
//
//	Time-stamp: 2016-04-13, 22:52:55
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TILEMAP_MOON_H
#define GRIT_TILEMAP_MOON_H

#define tilemap_moonTilesLen 6368
extern const unsigned short tilemap_moonTiles[3184];

#define tilemap_moonMapLen 4096
extern const unsigned short tilemap_moonMap[2048];

#define tilemap_moonPalLen 512
extern const unsigned short tilemap_moonPal[256];

#endif // GRIT_TILEMAP_MOON_H

//}}BLOCK(tilemap_moon)

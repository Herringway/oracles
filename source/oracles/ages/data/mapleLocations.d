module oracles.ages.data.mapleLocations;

import oracles.external;
//; Each bit represents whether maple can appear on the corresponding screen 
//; (0 if she can appear, 1 if she can't)

//maplePresentLocationsTable:
//	.dw maplePresentLocationsRickyCompanion
//	.dw maplePresentLocationsDimitriCompanion
//	.dw maplePresentLocationsMooshCompanion

//maplePresentLocationsRickyCompanion:
//	dbrev %10010100 %11111111
//	dbrev %11010011 %11011111
//	dbrev %10111111 %11000111
//	dbrev %11011111 %11100011
//	dbrev %01110111 %11000011
//	dbrev %11111111 %10111111
//	dbrev %00111111 %10111011
//	dbrev %11111111 %11111011
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//maplePresentLocationsDimitriCompanion:
//	dbrev %10010100 %11111111
//	dbrev %11010011 %11011111
//	dbrev %10111111 %11000111
//	dbrev %11011111 %11100011
//	dbrev %01110111 %11000011
//	dbrev %11111111 %10111111
//	dbrev %00111111 %10111011
//	dbrev %11111111 %11111011
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//maplePresentLocationsMooshCompanion:
//	dbrev %10010100 %11111111
//	dbrev %11010011 %11011111
//	dbrev %10111111 %11000111
//	dbrev %11011111 %11100011
//	dbrev %01110111 %11000011
//	dbrev %11111111 %10111111
//	dbrev %00111111 %10111011
//	dbrev %11111111 %11111011
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111

//maplePastLocations:
//	dbrev %11010111 %11111111
//	dbrev %00010111 %01011111
//	dbrev %10111111 %01000111
//	dbrev %01010111 %11011111
//	dbrev %11111111 %11111011
//	dbrev %11111111 %10111111
//	dbrev %00010111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
//	dbrev %11111111 %11111111
///scr_entity_set_look(sprite, N, NE, E, SE, S, SW, W, NW);
//Is set clockwise, anything null defaults to first frame
var spr = argument[0];
var subNE = 0;
var subSE = 0;
var subSW = 0;
var subNW = 0;
var subN = 0;
var subE = 0;
var subS = 0;
var subW = 0;
for (var _i = 0; _i < 8; _i += 1) { _fac[_i] = 0; faceAnimation[_i] = "stand_SW"; }
if (argument_count > 1) { if (argument[1] != NULL) { subN = argument[1]; _fac[0] = 1; } }
if (argument_count > 2) { if (argument[2] != NULL) { subNE = argument[2]; _fac[1] = 1; } }
if (argument_count > 3) { if (argument[3] != NULL) { subE = argument[3]; _fac[2] = 1; } }
if (argument_count > 4) { if (argument[4] != NULL) { subSE = argument[4]; _fac[3] = 1; } }
if (argument_count > 5) { if (argument[5] != NULL) { subS = argument[5]; _fac[4] = 1; } }
if (argument_count > 6) { if (argument[6] != NULL) { subSW = argument[6]; _fac[5] = 1; } }
if (argument_count > 7) { if (argument[7] != NULL) { subW = argument[7]; _fac[6] = 1; } }
if (argument_count > 8) { if (argument[8] != NULL) { subNW = argument[8]; _fac[7] = 1; } }

//Set standings
faceAuto = 1;
scr_entity_animation_define("stand_NE", spr, subNE, 1, 0);
scr_entity_animation_define("stand_SE", spr, subSE, 1, 0);
scr_entity_animation_define("stand_SW", spr, subSW, 1, 0);
scr_entity_animation_define("stand_NW", spr, subNW, 1, 0);
scr_entity_animation_define("stand_N", spr, subN, 1, 0);
scr_entity_animation_define("stand_E", spr, subE, 1, 0);
scr_entity_animation_define("stand_S", spr, subS, 1, 0);
scr_entity_animation_define("stand_W", spr, subW, 1, 0);

//Now populate faceNW etc with the right anims
faceAnimation[0] = "stand_E";
faceAnimation[1] = "stand_NE";
faceAnimation[2] = "stand_N";
faceAnimation[3] = "stand_NW";
faceAnimation[4] = "stand_W";
faceAnimation[5] = "stand_SW";
faceAnimation[6] = "stand_S";
faceAnimation[7] = "stand_SE";

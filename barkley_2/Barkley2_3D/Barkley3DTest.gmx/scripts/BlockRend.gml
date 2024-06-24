//0 = ID, 1 = X, 2 = Y, 3 = Z, 4 = WIDTH, 5 = HEIGHT, 6 = LENGTH, 7 = TEX, 8 = TX, 9 = TY
//TEXTURE ORDER: R, U, L, D, T, B
//x and y need integration
_id = argument0;
_x = argument1;
_y = argument2;
_z = argument3;
_w = argument4; //x
_h = argument5; //z
_l = argument6; //y
_spr = argument7;
_tx = argument8;
_ty = argument9;

//Shorts
_w2 = _w / 2;
_h2 = _h / 2;
_l2 = _l / 2;

//Copy for local record
blkX[_id] = _x;
blkY[_id] = _y;
blkZ[_id] = _z;
blkW[_id] = _w;
blkH[_id] = _h;
blkL[_id] = _l;

//Get texture coods = R, U, L, D, T, B
blkTex[_id] = sprite_get_texture(_spr, 0);
blkTexW[_id] = sprite_get_width(_spr);
blkTexH[_id] = sprite_get_height(_spr);
_dw = 1.0 / blkTexW[_id];
_dh = 1.0 / blkTexH[_id];
_l0 = _l; _w0 = _w;
_w = _l0; _l = _w0;
_side = (0 * 2); //r
blkTexX[_id, _side + 0] = _dw * (_tx);
blkTexY[_id, _side + 0] = _dh * (_ty);
blkTexX[_id, _side + 1] = _dw * (_tx + _l);
blkTexY[_id, _side + 1] = _dh * (_ty + _h);
_side = (1 * 2); //up
blkTexX[_id, _side + 0] = _dw * (_tx + _l + 1);
blkTexY[_id, _side + 0] = _dh * (_ty);
blkTexX[_id, _side + 1] = _dw * (_tx + _l + 1 + _w);
blkTexY[_id, _side + 1] = _dh * (_ty + _h);
_side = (2 * 2); //left
blkTexX[_id, _side + 0] = _dw * (_tx + _l + 1 + _w + 1);
blkTexY[_id, _side + 0] = _dh * (_ty);
blkTexX[_id, _side + 1] = _dw * (_tx + _l + 1 + _w + 1 + _l);
blkTexY[_id, _side + 1] = _dh * (_ty + _h);
_side = (3 * 2); //down
blkTexX[_id, _side + 0] = _dw * (_tx + _l + 1 + _w + 1 + _l + 1);
blkTexY[_id, _side + 0] = _dh * (_ty);
blkTexX[_id, _side + 1] = _dw * (_tx + _l + 1 + _w + 1 + _l + 1 + _w);
blkTexY[_id, _side + 1] = _dh * (_ty + _h);
_side = (4 * 2); //top
blkTexX[_id, _side + 0] = _dw * (_tx + _l + 1 + _w + 1 + _l + 1 + _w + 1);
blkTexY[_id, _side + 0] = _dh * (_ty);
blkTexX[_id, _side + 1] = _dw * (_tx + _l + 1 + _w + 1 + _l + 1 + _w + 1 + _l);
blkTexY[_id, _side + 1] = _dh * (_ty + _w);
_side = (5 * 2); //bottom
blkTexX[_id, _side + 0] = _dw * (_tx + _l + 1 + _w + 1 + _l + 1 + _w + 1 + _l + 1);
blkTexY[_id, _side + 0] = _dh * (_ty);
blkTexX[_id, _side + 1] = _dw * (_tx + _l + 1 + _w + 1 + _l + 1 + _w + 1 + _l + 1 + _l);
blkTexY[_id, _side + 1] = _dh * (_ty + _w);
_w = _w0; _l = _l0;

//Draw top
blkTopZ[_id] = _z + _h;
blkBotZ[_id] = _z;

blkTopX0[_id] = _x - _w2;
blkTopY0[_id] = _y - _l2;
blkTopX1[_id] = _x + _w2;
blkTopY1[_id] = _y - _l2;
blkTopX2[_id] = _x - _w2;
blkTopY2[_id] = _y + _l2;
blkTopX3[_id] = _x + _w2;
blkTopY3[_id] = _y + _l2;

//Right
_i = 0;
blkX0[_id, _i] = _x - _w2;
blkY0[_id, _i] = _y + _l2;
blkZ0[_id, _i] = _z + _h;

blkX1[_id, _i] = _x + _w2;
blkY1[_id, _i] = _y + _l2;
blkZ1[_id, _i] = _z + _h;

blkX2[_id, _i] = _x - _w2;
blkY2[_id, _i] = _y + _l2;
blkZ2[_id, _i] = _z;

blkX3[_id, _i] = _x + _w2;
blkY3[_id, _i] = _y + _l2;
blkZ3[_id, _i] = _z;

//Up
_i = 1;
blkX0[_id, _i] = _x + _w2;
blkY0[_id, _i] = _y + _l2;
blkZ0[_id, _i] = _z + _h;

blkX1[_id, _i] = _x + _w2;
blkY1[_id, _i] = _y - _l2;
blkZ1[_id, _i] = _z + _h;

blkX2[_id, _i] = _x + _w2;
blkY2[_id, _i] = _y + _l2;
blkZ2[_id, _i] = _z;

blkX3[_id, _i] = _x + _w2;
blkY3[_id, _i] = _y - _l2;
blkZ3[_id, _i] = _z;

//Left
_i = 2;
blkX0[_id, _i] = _x + _w2;
blkY0[_id, _i] = _y - _l2;
blkZ0[_id, _i] = _z + _h;

blkX1[_id, _i] = _x - _w2;
blkY1[_id, _i] = _y - _l2;
blkZ1[_id, _i] = _z + _h;

blkX2[_id, _i] = _x + _w2;
blkY2[_id, _i] = _y - _l2;
blkZ2[_id, _i] = _z;

blkX3[_id, _i] = _x - _w2;
blkY3[_id, _i] = _y - _l2;
blkZ3[_id, _i] = _z;

//Down --edited
_i = 3;
blkX0[_id, _i] = _x - _w2;
blkY0[_id, _i] = _y - _l2;
blkZ0[_id, _i] = _z + _h;

blkX1[_id, _i] = _x - _w2;
blkY1[_id, _i] = _y + _l2;
blkZ1[_id, _i] = _z + _h;

blkX2[_id, _i] = _x - _w2;
blkY2[_id, _i] = _y - _l2;
blkZ2[_id, _i] = _z;

blkX3[_id, _i] = _x - _w2;
blkY3[_id, _i] = _y + _l2;
blkZ3[_id, _i] = _z;



exit;

d3d_draw_floor(- wid2, - bck, hei, + wid2, + fnt, hei, tTop, 1, 1); //top

//DRAW FRONT / BACK
d3d_draw_wall(- wid2, - bck, hei, + wid2, - bck, 0, tBack, 1, 1); //
d3d_draw_wall(- wid2, + fnt, hei, + wid2, + fnt, 0, tFront, 1, 1);

//DRAW LEFT / RIGHT
d3d_draw_wall(- wid2, - bck, hei, - wid2, + fnt, 0, tLeft, 1, 1);
d3d_draw_wall(+ wid2, - bck, hei, + wid2, + fnt, 0, tLeft, 1, 1);

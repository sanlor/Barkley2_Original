// frame  
dx0 = argument0;
dy0 = argument1;
dx1 = argument2;
dy1 = argument3;
draw_spr_tiled(dx0 + 4, dy0 + 4, dx1 - 4, dy1 - 4, global.dialogBG, 0, 1);//0.75);
// edges
draw_spr_tiled(dx1 - 16, dy0 + 16, dx1, dy1 - 16, global.dialogEdge, 0, 1); // right
draw_spr_tiled(dx0 + 16, dy0, dx1 - 16, dy0 + 15, global.dialogEdge, 1, 1); // top
draw_spr_tiled(dx0, dy0 + 8, dx0 + 15, dy1 - 4, global.dialogEdge, 2, 1); // left
draw_spr_tiled(dx0 + 16, dy1 - 16, dx1 - 16, dy1, global.dialogEdge, 3, 1); // bottom
// corners
// top right
draw_sprite_ext(global.dialogCorner, 0, dx1 - sprite_get_width(global.dialogCorner), dy0, 1, 1, 0, c_white, 1);
// top left
draw_sprite_ext(global.dialogCorner, 1, dx0, dy0, 1, 1, 0, c_white, 1)
// bottom left
draw_sprite_ext(global.dialogCorner, 2, dx0, dy1 - sprite_get_height(global.dialogCorner), 1, 1, 0, c_white, 1)
// bottom right
draw_sprite_ext(global.dialogCorner, 3, dx1 - sprite_get_width(global.dialogCorner), dy1 - sprite_get_height(global.dialogCorner), 1, 1, 0, c_white, 1)

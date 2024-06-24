/// RoomXY(room, x, y, slide_direction [4 args] open_sfx [5 args], close_sfx [5 args])
rom = argument[0];
if (argument_count > 1) gox = argument[1];
if (argument_count > 2) goy = argument[2];
if (argument_count == 4) dir = argument[3];
if (argument_count == 5)
{
    var creX = x + (spw / 2);
    var creY = y + (sph / 2);
    if (object_index == o_doorlight_up) creY = y - 16;
    if (object_index == o_doorlight_down) creY = y; //16;
    if (object_index == o_doorlight_left) creX = x - 16;
    if (object_index == o_doorlight_right) creX = x; //16;
    kid = instance_create(creX, creY, o_door_light01);
    kid.sfx_open = argument[3];
    kid.sfx_close = argument[4];
    if (object_index == o_doorlight_left) kid.text_x += 16; //abs(sprite_width);
    if (object_index == o_doorlight_right) kid.text_x -= 16; //abs(sprite_width);
    if (object_index == o_doorlight_up) { kid.text_x -= 16; kid.text_y += 16; } //abs(sprite_height);
    if (object_index == o_doorlight_down) { kid.text_x -= 16; kid.text_y -= 16; } //abs(sprite_height);
    //show_debug_message("RoomXY() - making a doorlight laz for " + object_get_name(object_index));
}

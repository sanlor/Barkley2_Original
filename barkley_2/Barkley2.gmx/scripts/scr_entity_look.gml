///scr_entity_look(object_looking, direction_cardinal)
var dir = argument[1];
if (argument[0].flipAuto == 0)
{
    scr_entity_animation_set(argument[0], argument[0].faceAnimation[dir]);
}
else
{
    if (dir == 7 || dir == 0 || dir == 1 || dir == 2) argument[0].image_xscale = 1;
    else argument[0].image_xscale = -1;
    scr_entity_animation_set(argument[0], argument[0].faceAnimation[dir]);
}

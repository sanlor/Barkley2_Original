/// scr_entity_getZHeight()
//  Gets the base z-height for entity at its current position

var val = scr_collision_zheight(x, y)
if (is_undefined(val)) {
    return 0; //base_z; // If this is not 0, it uses the last maps Z height when this is undefined as base_z is set on CREATE but the maps are cleared on ROOM START!
} else {
    return val;
}

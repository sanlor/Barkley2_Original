/// scr_entity_zcollision(id1,id2)
/// Check if two entities are colliding on the Z axis.

var id1, id2;
id1 = argument0;
id2 = argument1;

var bot = id1.z + id1.hitbox_z_bottom;
var top = id1.z + id1.hitbox_z_top;

var other_bot = id2.z + id2.hitbox_z_bottom;
var other_top = id2.z + id2.hitbox_z_top;

if (bot <= other_top + 0 and top > other_bot - 0) { // GZ EDIT: Juiced the bullet z hitbox by 2 so rockets and things can hit while maintaining visuals
    return true;
}
return false;

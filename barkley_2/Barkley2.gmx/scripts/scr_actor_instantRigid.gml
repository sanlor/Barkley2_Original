///scr_actor_instantRigid(actor)
//Instantly does rigid code
with (argument0)
{
    if (actor_rigid and not actor_rigid_set) {
        if (actor_rigid_semisolid) {
            scr_collisionSystem_add_shape_semisolid(_sat_shape, z + hitbox_z_bottom, z + hitbox_z_top)
        }
        else {
            scr_collisionSystem_add_shape_solid(_sat_shape, z + hitbox_z_bottom, z + hitbox_z_top)
        }
        actor_rigid_set = true
    }
    //show_debug_message(string(object_get_name(object_index)) + " < object name");
    if ((not actor_rigid) and actor_rigid_set) {
        if (actor_rigid_semisolid) {
            scr_collisionSystem_remove_shape_semisolid(_sat_shape)
        }
        else {
            scr_collisionSystem_remove_shape_solid(_sat_shape)
        }
        actor_rigid_set = false
    }
}

///scr_event_set_object(object, x, y)
var rig = argument[0].actor_rigid;
if (rig)
{
    scr_actor_unsetRigid(argument[0]);
    scr_actor_instantRigid(argument[0]);
}
argument[0].x = argument[1];
argument[0].y = argument[2];
argument[0].xstart = argument[0].x;
argument[0].ystart = argument[0].y;
argument[0]._sat_shape = 0 // Free previous shape
argument[0]._sat_shape = sat_make_shape_circle(argument[0].x, argument[0].y, 8);
if (rig)
{
    scr_actor_setRigid(argument[0]);
    scr_actor_instantRigid(argument[0]);
}

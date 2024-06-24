/*
if (argument0 == SCRIPT_START)
{
    if (scr_quest_get_state("sewerBridgeClosed") == 1) //
    {
        bridgeShapeMade = 1;
        bridgeShape = sat_make_shape_rect(o_retractableBridge01.x, o_retractableBridge01.y, 32, 64);
        scr_collisionSystem_add_shape_semisolid(brigdeShape); 
    }
    else //Ladder up
    {
        scr_collisionSystem_remove_shape_solid(_sat_shape);
        instance_create(o_tnn_ladder02.x, o_tnn_ladder02.y, o_tnn_ladder01);
        instance_destroy();
    }
}

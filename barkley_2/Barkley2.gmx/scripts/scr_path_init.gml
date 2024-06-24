/// scr_path_init()

scr_path_setMotionPlanningType(MOTIONPLANNING_NORMAL); // motion planning collision grid
path_walk = NULL; // path resource (default none)
path_dir = 0; // direction on path
path_spd = 0; // path speed
path_pos = 0; // Current position in pixels
path_walldist = 0; // Distance from walls
path_targetx = 0;
path_targety = 0;

scr_path_setMovementType(scr_path_movementType_standard); // Movement type for path following
scr_path_setLookaheadDist(10); //Was 10, GZ edited because I now lock on path end in path_update

/// scr_collisionSystem_init(level_width,level_height)
/// Initializes all of the variables needed for the collision grid.

var width = argument0;
var height = argument1;

// --- Collision trees ---
// R-Tree that covers all solids and semi-solids.
c_tree = sat_rtree_create(width, height, global.rtreeSize);
// R-Tree that covers all (solids, semi-solids, wading)
c_alltree = sat_rtree_create(width, height, global.rtreeSize);
// R-Tree for only solids.
c_ostree = sat_rtree_create(width, height, global.rtreeSize);
// R-Tree for shadows.
c_stree = sat_rtree_create(width, height, global.rtreeSize / 2);
// R-Tree for wading
c_wadetree = sat_rtree_create(width, height, global.rtreeSize / 2);

// Grid for stairs.
c_stgrid = ds_grid_create(width, height);

//GZ ADDED Grid for footsteps
c_footgrid = ds_grid_create(width / 16, height / 16);
// --- Motion Planning ---
// MP avoiding all
mpc_allgrid = mp_grid_create(0, 0, width/8, height/8, 8, 8);
mp_grid_clear_all(mpc_allgrid)

// MP avoiding solids, semi-solids
mpc_grid = mp_grid_create(0, 0, width/8, height/8, 8, 8);
mp_grid_clear_all(mpc_grid)

// MP avoiding solids
mpc_osgrid = mp_grid_create(0, 0, width/8, height/8, 8, 8);
mp_grid_clear_all(mpc_osgrid)

// MP allowing wading movement only
mpc_wadegrid = mp_grid_create(0, 0, width/8, height/8, 8, 8);
mp_grid_add_rectangle(mpc_wadegrid, 0, 0, width, height);

// Heightmap Grid
height_grid = ds_grid_create(width/ZHEIGHT_GRID_W, height/ZHEIGHT_GRID_W);
ds_grid_clear(height_grid, undefined);

height_stairs_grid = ds_grid_create(width/ZHEIGHT_GRID_W, height/ZHEIGHT_GRID_W);
ds_grid_clear(height_stairs_grid, undefined);

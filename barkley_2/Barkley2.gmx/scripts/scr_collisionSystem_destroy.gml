/// scr_collisionSystem_destroy()

sat_rtree_destroy(c_alltree);
sat_rtree_destroy(c_tree);
sat_rtree_destroy(c_ostree);
sat_rtree_destroy(c_stree);
sat_rtree_destroy(c_wadetree);

ds_grid_destroy(c_stgrid);
ds_grid_destroy(c_footgrid); //GZ ADDED
mp_grid_destroy(mpc_allgrid);
mp_grid_destroy(mpc_grid);
mp_grid_destroy(mpc_osgrid);
mp_grid_destroy(mpc_wadegrid);
ds_grid_destroy(height_grid);
ds_grid_destroy(height_stairs_grid);

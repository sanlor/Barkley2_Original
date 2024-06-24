// Do stuff that needs to be done on entering new room

// Roomstart
show_debug_message("Roomstart");
instance_create(0, 0, o_room_light);

// Clear casings
ds_list_clear(global.dslCasings);

// Reset collisions
with (sys_collision) {
    scr_collisionSystem_destroy();
    scr_collisionSystem_init(room_width, room_height);
}

// Load spawn points
spawn_loadRoom();

// Parse collisions
show_debug_message("Collisionsparse begin...");
var time_coll = get_timer();
if (global.rtreeCache && ds_map_exists(global.CACHEc_tree, room))
{
    // Delete empty rtrees created in collision INIT
    ds_list_destroy(sys_collision.c_tree);
    ds_list_destroy(sys_collision.c_alltree);
    ds_list_destroy(sys_collision.c_ostree);
    ds_list_destroy(sys_collision.c_stree);
    ds_list_destroy(sys_collision.c_wadetree);
    // Load the saved rtrees
    sys_collision.c_tree = global.CACHEc_tree[? room];
    sys_collision.c_alltree = global.CACHEc_alltree[? room];
    sys_collision.c_ostree = global.CACHEc_ostree[? room];
    sys_collision.c_stree = global.CACHEc_stree[? room];
    sys_collision.c_wadetree = global.CACHEc_wadetree[? room];
    // Disable addition of collisions while using cache
    global.CACHEcollision = 1;
}
with (o_rigid_solid) 
{
     if (is_array(shape)) {
         scr_collisionSystem_add_shape_solid(shape, z_bottom, z_top);
     }
     instance_destroy()
}
with (o_rigid_semisolid) 
{
     if (is_array(shape)) {
         scr_collisionSystem_add_shape_semisolid(shape, z_bottom, z_top);
     }
     instance_destroy()
}
with (o_wading) 
{
     var cx = (bbox_left + (bbox_right+1)) / 2
     var cy = (bbox_top + (bbox_bottom+1)) / 2
     var w = ((bbox_right+1) - bbox_left) / 2
     var h = ((bbox_bottom+1) - bbox_top) / 2
     scr_collisionSystem_add_shape_wading(sat_make_shape_rect(cx, cy, w, h));
     instance_destroy()
}

// Init Z-Height
scr_collision_heightmap_stairs();

var do_holeCover = false;

with(o_map_zladder)
{
    self.floodfillBlocker = sat_make_shape_rect(x + 16, y + 4, 16, 4);
    scr_collisionSystem_add_shape_semisolid(self.floodfillBlocker);
}

show_debug_message("Z-height floodfill begin...");
var time_flood = get_timer();
with (o_zsurvey) {
    scr_collision_heightmap_floodfill(scr_collisionSystem_collisionTreeOfType(r_tree), x, y, initial_height);
    do_holeCover = true;
    instance_destroy();
}
show_debug_message("Z-height floodfill end... Took " + string((get_timer() - time_flood) / 1000) + "ms");

if (do_holeCover) {
    show_debug_message("Z-height hole-cover begin...");
    var time_holecover = get_timer();
    scr_collision_heightmap_coverHoles(scr_collisionSystem_collisionTreeOfType(COLLISION_NORMAL));
    show_debug_message("Z-height holecover end... Took " + string((get_timer() - time_flood) / 1000) + "ms");
}

with(o_map_zladder)
{
    scr_collisionSystem_remove_shape_semisolid(self.floodfillBlocker);
}

// Add environ collision shapes after Z height map generated.
// NOTE: This breaks caching, we should probably take out the cache by new
with (Environ) event_user(1);
with (Environ) event_user(0);
with (EnvironInteract) event_user(15);
with (MiniEnviron) event_user(15);

// Save game on map start (TODO: Unless an event is currently running) #2080
if (room != r_scale && room != r_title && room != r_logo && room != r_logo_debug) {
    scr_savedata_put("map.room", room_get_name(room));
    scr_savedata_put("map.x", _teleport_x);
    scr_savedata_put("map.y", _teleport_y);
    scr_savedata_put("player.respawn.do", false);
    if (Quest("saveDisabled") == 0) scr_savedata_save();
}

// Init Entities (including hoopz)
var loaded = ds_list_find_index(global.rooms_loaded, room) != -1;
if (loaded) 
{   
    // Init hoopz
    
    if (global.eventTeleport == 1)
    {
        if (instance_exists(o_teleport_mark))
        {
            _teleport_x = o_teleport_mark.x;
            _teleport_y = o_teleport_mark.y;
        }
        else
        {
            _teleport_x = round(room_width / 2);
            _teleport_y = round(room_height / 2);
        }
        global.eventTeleport = 0;
    }
    // Init hoopz
    if(!instance_exists(o_hoopz))
        instance_create(0, 0, o_hoopz);
        
    o_hoopz.x = _teleport_x;
    o_hoopz.y = _teleport_y;
    
    if (global.hoopzKeepX != -999) { o_hoopz.x = global.hoopzKeepX; global.hoopzKeepX = -999; }
    if (global.hoopzKeepY != -999) { o_hoopz.y = global.hoopzKeepY; global.hoopzKeepY = -999; }
    
    instance_create(0, 0, o_hud);
    
    o_hoopz.facing = global.eventFacing; //Fix for ticket #895
    o_hoopz.look_dir = global.eventFacing * 45; //Fix for ticket #895
    o_hoopz.move_dir = global.eventFacing * 45; //Fix for ticket #895
    
    // Assign z-heights to object model objects
    with(Particle)
    {
        base_z = scr_entity_getZHeight();
        z = base_z;
    }
    
    // Focus camera instantly on hoopz (#1727)
    if(!instance_exists(o_camera_hoopz))
    { instance_create(0, 0, o_camera_hoopz); }
    
    o_camera_hoopz.x = o_hoopz.x;
    o_camera_hoopz.y = o_hoopz.y - o_hoopz.z; 
}

Cyberspear("room start");
Music("get");

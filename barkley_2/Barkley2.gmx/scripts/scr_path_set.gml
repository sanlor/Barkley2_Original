/// scr_path_set(start_x,start_y,end_x,end_y,path_speed,length_min,length_max)
/// Returns true if the path is created successfully, false otherwise.

var start_x = argument0; // start point
var start_y = argument1;
var end_x = argument2; // end point
var end_y = argument3;
path_spd = argument4;
var length_min = argument5; // path limit
var length_max = argument6;
 
// pathfind to point
var dist =  point_distance(end_x,end_y,start_x,start_y)
if (dist >= length_min && (length_max == NULL or dist <= length_max)) { // if destination is far enough 
    scr_path_delete(); // remove existing path resource
    path_walk = path_add(); // create new path resource
    var pth = mp_grid_path( // generate path
            path_grid,
            path_walk,
            start_x,
            start_y,
            end_x,
            end_y,
            1);
            
    if pth { // if path succesfully generated
        if (length_max != NULL && path_get_length(path_walk) > length_max) {// cancel if destination is too far
            scr_path_delete();
            return false;
        } else {
            path_pos = 0;
            path_targetx = start_x;
            path_targety = start_y;
            scr_path_update();
            return true;
        }
    } else {
        scr_path_delete();
        return false;
    }
}

scr_path_delete();
return false;

///scr_debug_movementVisualizer_addPath(path)
var path;

path = argument[0];

if(!instance_exists(o_debugMenu_movementVisualizer)) exit;

if(path_exists(path))
{
    //show_debug_message("path added at " + 
    //    string(path_get_point_x(path, 0)) + "," + 
    //    string(path_get_point_y(path, 0)))
    ds_list_add(o_debugMenu_movementVisualizer.paths, path_duplicate(path));
}

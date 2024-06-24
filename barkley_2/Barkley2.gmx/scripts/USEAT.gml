/// USEAT(direction / object, play, set, time)
var waitTime = 1;
var ar0 = argument[0];
var hopPly, hopSet;
var obj;
var dirCar = "";
var dirStr = "";
if (ar0 == "NORTHWEST") { dirCar = NORTHWEST; dirStr = "NW"; }
if (ar0 == "NORTHEAST") { dirCar = NORTHEAST; dirStr = "NE"; }
if (ar0 == "SOUTHWEST") { dirCar = SOUTHWEST; dirStr = "SW"; }
if (ar0 == "SOUTHEAST") { dirCar = SOUTHEAST; dirStr = "SE"; }
if (ar0 == "WEST") { dirCar = WEST; dirStr = "W"; }
if (ar0 == "EAST") { dirCar = EAST; dirStr = "E"; }
if (ar0 == "NORTH") { dirCar = NORTH; dirStr = "N"; }
if (ar0 == "SOUTH") { dirCar = SOUTH; dirStr = "S"; }

if (dirCar == "")
{
    obj = ar0;
    if (asset_get_index(string(obj)) > -1) obj = asset_get_index(obj);
    obj = real(obj);
    var dir = point_direction(o_cts_hoopz.x, o_cts_hoopz.y, obj.x, obj.y);
    var dirSub = round(dir / 45);
    if (dirSub == 8) dirSub = 0;
    
    if (dirSub == 7) { dirCar = SOUTHEAST; dirStr = "SE"; }
    if (dirSub == 6) { dirCar = SOUTH; dirStr = "S"; }
    if (dirSub == 5) { dirCar = SOUTHWEST; dirStr = "SW"; }
    if (dirSub == 4) { dirCar = WEST; dirStr = "W"; }
    if (dirSub == 3) { dirCar = NORTHWEST; dirStr = "NW"; }
    if (dirSub == 1) { dirCar = NORTHEAST; dirStr = "NE"; }
    if (dirSub == 2) { dirCar = NORTH; dirStr = "N"; }
    if (dirSub == 0) { dirCar = EAST; dirStr = "E"; }
}


if (argument_count <= 1) hopPly = "action_" + dirStr;
else hopPly = argument[1] + dirStr;
if (argument_count <= 2) hopSet = "stand_" + dirStr;
else hopSet = argument[2] + dirStr;
if (argument_count > 3) waitTime = argument[3];
if (string_count("kneel", hopPly) == 0) // && string_count("surprise", hopPly) == 0)
{
    if (BodySwap() == "diaper") { hopPly = "diaper_" + hopPly; hopSet = "diaper_" + hopSet; }
    if (BodySwap() == "prison") { hopPly = "prison_" + hopPly; hopSet = "prison_" + hopSet; }
}

// Play and Set
if (hopPly == hopSet)
{
    show_debug_message("USEAT: " + hopPly);
    with (o_cts_hoopz) 
    {
        _current_animation = hopPly;
        _automatic_animation = false;
        scr_entity_animation_setFrame(hopPly, 0);
    }
}
else Animation("play and set", o_cts_hoopz, hopPly, hopSet);

// Wait
global.cinAct = 0;
var wait_object = instance_create(0, 0, o_wait);
wait_object._event = id;
wait_object._secs_to_wait = waitTime;
wait_object.dsl = 1;
global.cinObj = -999;//wait_object;

/// Light(check_script_with_f12)
var _db = 0; // Debug
// FUNCTIONS FOR ADDING A LIGHT

// Light("add", object_index, size, [flicker], [color]);
// Light("add xy", x, y, size, [flicker], [color]);



// FUNCTION FOR REMOVING A LIGHT

// Light("delete", light_index);



// FUNCTIONS FOR EDITING AN EXISTING LIGHT

// light_index = Light("add", o_skullpep, 128);
// Light("object", light_index, object);
// Light("x", light_index, x);
// Light("y", light_index, y);
// Light("color", light_index, color)
// Light("size", light_index, size);
// Light("flicker", light_index, flicker); - 0 is no flicker, 1 is full flicker



// TO PUT THE LIGHT IN A BUILD EVENT, 
// SUPPLY "BUILD" AS THE FIRST ARGUMENT

// Light("build", "add", o_skullpep, 128, 0.5, c_blue)



// GZ NOTE: Colors do not work yet.
// GZ NOTE: Optimize later so draw moves up for faster processing

//if (_db) show_debug_message("Light('" + argument[0] + "')...");

if (is_real(argument[0])) // ds_list containing actions
{
    var siz = ds_list_size(argument[0]) - 1;
    if (siz == 1) Light(ds_list_find_value(argument[0], 1));
    if (siz == 2) Light(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2));
    if (siz == 3) Light(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3));
    if (siz == 4) Light(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4));
    if (siz == 5) Light(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4), ds_list_find_value(argument[0], 5));
    if (siz == 6) Light(ds_list_find_value(argument[0], 1), ds_list_find_value(argument[0], 2), ds_list_find_value(argument[0], 3), ds_list_find_value(argument[0], 4), ds_list_find_value(argument[0], 5), ds_list_find_value(argument[0], 6));
    scr_event_advance(id);
    return 1;
}

if (argument[0] == "draw")
{
    var obj = global.dslLightObject[| argument[1]];
    if (obj == -999) return 0;
    var dx = global.dslLightX[| argument[1]];
    var dy = global.dslLightY[| argument[1]];
    if (instance_exists(obj)) 
    { 
        dx = obj.x + dx; 
        dy = obj.y + dy; 
    }
    var flk = global.dslLightFlicker[| argument[1]];
    var scl = ((1 / 256) * global.dslLightSize[| argument[1]]);
    scl = (scl * abs(1 - flk)) + (scl * random(flk));
    var col = global.dslLightColor[| argument[1]];
    draw_sprite_ext(s_light_256, 0, dx, dy, scl, scl, 0, col, 1);
    return 1;
}

if (argument[0] == "step")
{
    // Do step stuff
    if (string_pos("_fct", room_get_name(room)) > 0)
    {
        if (scr_quest_get_state("pdt_benhur_light") == 1) Light("goal", 1);
        else Light("goal", 0.25);
    }
    
    return 1;
}

if (argument[0] == "build") // Shift functions to action
{
    var act = ds_list_create();
    ds_list_add(act, Light);
    if (argument_count > 1) ds_list_add(act, argument[1]);
    if (argument_count > 2) ds_list_add(act, argument[2]);
    if (argument_count > 3) ds_list_add(act, argument[3]);
    if (argument_count > 4) ds_list_add(act, argument[4]);
    if (argument_count > 5) ds_list_add(act, argument[5]);
    if (argument_count > 6) ds_list_add(act, argument[6]);
    if (argument_count > 7) ds_list_add(act, argument[7]);
    ds_list_add(_event_list, act);
    return ds_list_size(_event_list) - 1;
}

// Light("add", object_index, size, [flicker], [color]);
if (argument[0] == "add")
{
    if (is_string(argument[1])) argument[1] = asset_get_index(argument[1]);
    if (_db) show_debug_message("Light('add', " + object_get_name(argument[1].object_index) + ", " + string(argument[2]) + ") - TOTAL = " + string(ds_list_size(global.dslLightObject)));
    ds_list_add(global.dslLightID, global.lightCount);
    ds_list_add(global.dslLightObject, argument[1]);
    ds_list_add(global.dslLightX, 0);
    ds_list_add(global.dslLightY, 0);
    ds_list_add(global.dslLightSize, real(argument[2]));
    if (argument_count > 3) ds_list_add(global.dslLightFlicker, real(argument[3]));
    else ds_list_add(global.dslLightFlicker, 0);
    if (argument_count > 4) 
    {
        argument[4] = real(argument[4]);
        var col = make_color_rgb(abs(255 - color_get_red(argument[4])), abs(255 - color_get_green(argument[4])), abs(255 - color_get_blue(argument[4])));
        ds_list_add(global.dslLightColor, argument[4]); //col);
    }
    else ds_list_add(global.dslLightColor, c_black);
    global.lightCount += 1;
    return global.lightCount - 1;
}

// Light("add xy", x, y, size, [flicker], [color]);
if (argument[0] == "add xy")
{
    if (_db) show_debug_message("Light('add xy', " + string(argument[1]) + ", " + string(argument[2]) + ") - TOTAL = " + string(ds_list_size(global.dslLightObject)));
    ds_list_add(global.dslLightID, global.lightCount);
    ds_list_add(global.dslLightObject, -555);
    ds_list_add(global.dslLightX, argument[1]);
    ds_list_add(global.dslLightY, argument[2]);
    ds_list_add(global.dslLightSize, argument[3]);
    if (argument_count > 4) ds_list_add(global.dslLightFlicker, argument[4]);
    else ds_list_add(global.dslLightFlicker, 0);
    if (argument_count > 5) 
    {
        var col = make_color_rgb(abs(255 - color_get_red(argument[5])), abs(255 - color_get_green(argument[5])), abs(255 - color_get_blue(argument[5])));
        ds_list_add(global.dslLightColor, argument[5]); //col);
    }
    else ds_list_add(global.dslLightColor, c_black);
    global.lightCount += 1;
    return global.lightCount - 1;
}

if (argument_count == 2)
{
    if (argument[0] == "destroy" || argument[0] == "delete" || argument[0] == "remove")
    {
        // THIS WAS ERROR!
        var _in = ds_list_find_index(global.dslLightID, real(argument[1]));
        if (_in != -1) global.dslLightObject[| _in] = -999;
    }
    else if (argument[0] == "kill")
    {
        var _in = real(argument[1]);
        _in = ds_list_find_index(global.dslLightID, _in);
        if (_in != -1)
        {
            if (_db) show_debug_message("LIGHT = KILL = " + string(_in));
            ds_list_delete(global.dslLightID, _in);
            ds_list_delete(global.dslLightObject, _in);
            ds_list_delete(global.dslLightX, _in);
            ds_list_delete(global.dslLightY, _in);
            ds_list_delete(global.dslLightColor, _in);
            ds_list_delete(global.dslLightSize, _in);
            ds_list_delete(global.dslLightFlicker, _in);
        }
        else if (_db) show_debug_message("Light('kill') FAIL -> " + string(argument[1]) + " - LIGHTS = " + string(ds_list_size(global.dslLightObject)));
    }
}
else if (argument_count == 3)
{
    // THIS WAS ERROR!
    var _in = ds_list_find_index(global.dslLightID, real(argument[1]));
    // Light("object", light_index, object);
    if (argument[0] == "object") global.dslLightObject[| _in] = argument[2];
    // Light("x", light_index, x);
    if (argument[0] == "x") global.dslLightX[| _in] = argument[2];
    // Light("y", light_index, y);
    if (argument[0] == "y") global.dslLightY[| _in] = argument[2];
    // Light("color", light_index, color)
    if (argument[0] == "color" || argument[0] == "colour") global.dslLightColor[| _in] = argument[2]; //make_color_rgb(abs(255 - color_get_red(argument[2])), abs(255 - color_get_green(argument[2])), abs(255 - color_get_blue(argument[2])));
    // Light("size", light_index, size);
    if (argument[0] == "size") global.dslLightSize[| _in] = argument[2];
    // Light("flicker", light_index, flicker); - 0 is no flicker, 1 is full flicker
    if (argument[0] == "flicker") global.dslLightFlicker[| _in] = argument[2];
}

if (argument[0] == "set")
{
    if (instance_exists(o_room_darkarea))
    {
        o_room_darkarea.light = real(argument[1]);
        o_room_darkarea.light_goal = real(argument[1]);
    }
    return 1;
}

if (argument[0] == "goal")
{
    if (instance_exists(o_room_darkarea))
    {
        o_room_darkarea.light_goal = real(argument[1]);
    }
    return 1;
}

if (argument[0] == "clear") // Called on every room end
{
    ds_list_clear(global.dslLightID);
    ds_list_clear(global.dslLightObject);
    ds_list_clear(global.dslLightX);
    ds_list_clear(global.dslLightY);
    ds_list_clear(global.dslLightColor);
    ds_list_clear(global.dslLightSize);
    ds_list_clear(global.dslLightFlicker);
    global.portraitFlicker = 0;
    if (_db) show_debug_message("Light('clear') - LIGHTS = " + string(ds_list_size(global.dslLightObject)));
    return 1;
}

if (argument[0] == "portrait flicker")
{
    global.portraitFlicker = real(argument[1]);
    return 1;
}

if (argument[0] == "init")
{
    global.dslLightID = ds_list_create();
    global.dslLightObject = ds_list_create();
    global.dslLightX = ds_list_create();
    global.dslLightY = ds_list_create();
    global.dslLightColor = ds_list_create();
    global.dslLightSize = ds_list_create();
    global.dslLightFlicker = ds_list_create();
    global.lightCount = 0;
    global.portraitFlicker = 0;
    return 1;
}

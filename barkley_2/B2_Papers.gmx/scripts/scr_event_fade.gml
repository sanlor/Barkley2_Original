/// scr_event_fade(fade [1 is in; 0 is out], seconds)
var str = "";
for (var i = 0; i < argument_count; i += 1)
{
    str += argument[i] + " > ";
}
show_debug_message("scr_event_fade() - " + str);
return (instance_create(x, y, o_suicide));

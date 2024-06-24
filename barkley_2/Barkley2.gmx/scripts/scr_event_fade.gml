///scr_event_fade(fade [1 is in; 0 is out], seconds, depth);

var typ = 1; //1 is fade in, 0 is fade out
var sec = 1; //1 second fade duration
var dep = -2510001; //depth for o_hud is -2510000

if (argument_count > 0) typ = argument[0];
if (argument_count > 1) sec = argument[1];
//if (argument_count > 2) dep = argument[2]; //Removed, should always be over hud?

var fade_object = instance_create(0, 0, o_fade);
//fade_object._event = NULL; //In fade create anyway
fade_object._fade = typ;
if (fade_object._fade) {
    fade_object.image_alpha = 0;
} else {
    fade_object.image_alpha = 1;
}
fade_object._seconds = sec;
fade_object.depth = dep;

return fade_object;

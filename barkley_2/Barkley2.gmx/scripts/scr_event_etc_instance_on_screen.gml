/// scr_event_etc_instance_on_screen(object_id)
/// Checks to see if the specified instance is in the player's view.
/// Returns true if the instance is on screen, false otherwise.

var obj = argument0;
var right = obj.x - obj.sprite_xoffset + obj.sprite_width;
var left = obj.x - obj.sprite_xoffset;
var top = obj.y - obj.sprite_yoffset;
var bottom = obj.y - obj.sprite_yoffset + obj.sprite_height;
return right > view_xview and left < view_xview + view_wview
        and bottom > view_yview and top < view_yview + view_hview;

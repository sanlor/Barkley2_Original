///scr_entity_look_object(object_looking, object_to_look_at)
//Face object based on what we defined in scr_entity_set_look
var obj0 = argument[0];
var obj1 = argument[1];
var tmpFac = round(point_direction(obj0.x, obj0.y, obj1.x, obj1.y) / 45);
if (tmpFac == 8) tmpFac = 0;
scr_entity_look(obj0, tmpFac);
//scr_entity_animation_set(obj0, obj0.faceAnimation[tmpFac]);

//show_debug_message("scr_entity_look - Trying to set " + object_get_name(id) + " facing...");
//show_debug_message("...to face animation " + obj0.faceAnimation[tmpFac] + " which is index " + string(tmpFac));
//else show_debug_message("...but I don't have autoFace true.");

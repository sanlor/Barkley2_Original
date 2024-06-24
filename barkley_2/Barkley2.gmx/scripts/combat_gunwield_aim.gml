/// combat_gunwield_aim(look_dir)

var _look_dir  = argument0;

look_dir = _look_dir;
look_dir_discrete = (_look_dir div (360/aFaceCount)) * (360 / aFaceCount);
aiming = (_look_dir div (360/aFaceCount));

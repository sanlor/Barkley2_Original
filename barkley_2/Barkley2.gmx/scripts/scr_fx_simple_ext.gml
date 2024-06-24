/// scr_fx_simple_ext(x, y, z, sprite_index, anim_speed, image_xscale, image_yscale, image_angle, image_blend, image_alpha)

var _x = argument0;
var _y = argument1;
var _z = argument2;
var _sprite_index = argument3;
var _anim_speed = argument4;
var _image_xscale = argument5;
var _image_yscale = argument6;
var _image_angle = argument7;
var _image_blend = argument8;
var _image_alpha = argument9;


effectSimple = instance_create(_x, _y, o_effect_generic_animateOnce);
effectSimple.z = _z;
effectSimple.sprite_index = _sprite_index;
with effectSimple { scr_entity_animation_setSpeed(ANIMATION_DEFAULT, _anim_speed) }
effectSimple.image_xscale = _image_xscale;
effectSimple.image_yscale = _image_yscale;
effectSimple.image_angle = _image_angle;
effectSimple.image_blend = _image_blend;
effectSimple.image_alpha = _image_alpha;

return effectSimple;

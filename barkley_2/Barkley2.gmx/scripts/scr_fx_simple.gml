/// scr_fx_simple(x, y, z, sprite_index)
effectSimple = instance_create(argument0, argument1, o_effect_generic_animateOnce);
effectSimple.z = argument2;
effectSimple.sprite_index = argument3;
return effectSimple;

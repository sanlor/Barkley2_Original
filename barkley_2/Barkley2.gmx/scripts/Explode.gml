/// Explode(object_to_explode_at, explosion_intensity_0_to_10)
argument[0] = asset_get_index(argument[0]);
var obj = scr_fx_explosion_spawn_at(argument[0].x, argument[0].y, 128, real(argument[1]));
obj.depth = -999;

///scr_fx_statusDrawEffect(conf, actor, sprite);
// Draw some effect on the ailment //

var conf   = argument0;
var actor  = argument1;
var sprite = argument2;

conf[? "effectY"] = -(conf[? "timer"] / conf[? "timerTotal"]) * 16;

draw_sprite_ext(sprite, conf[? "effectImage"],
                actor.x, actor.y - actor.z - ailmentTotem_headqueue_get(actor),
                image_xscale, image_yscale, image_angle, image_blend, conf[? "effectFlickerToggle"]);
ailmentTotem_headqueue_next(actor);

/// scr_player_draw_death()
if (BodySwap() == "hoopz") 
{
    var current = scr_statusEffect_getFromCombatActor(id, statusEffect_wading);
    var swimmove = 0;
    if (current > 0) swimmove = ds_map_find_value(current, "wadingDepthCurrent");

    if (swimmove != 10) scr_draw_spr(s_HoopzDeath, scr_entity_animation_getImage("default"), dx, dy);
    else 
    {
        shadow_visible = 0;
        scr_draw_spr(s_HoopzDeathWading, scr_entity_animation_getImage("default"), dx, dy);
    }
}
else scr_draw_spr(sHoopzPrisonDead, scr_entity_animation_getImage("default"), dx, dy);

/// combatActor_draw_post()
if (spriteHueDid)
{
    shader_reset();
    spriteHueDid = 0;
}
// Call post-draw event from status effects
ailmentTotem_headqueue_reset(self.id);

if (doRenderSurf) {
    // Finish drawing to surface
    surface_reset_target();
    dx = dxReal;
    dy = dyReal;
    
    // Apply FX
    for (i = 0; i < ds_list_size(list_status_effect); i += 1) {
        var map, scr;
        map = ds_list_find_value(list_status_effect, i);
        scr = ds_map_find_value(map, "script");
        script_execute(scr, map, self.id, "draw_fx", NULL);
    }
    
    // Draw periodic hit
    if (periodicHit > 0)
    {
        //show_debug_message("hello periodic");
        periodicHit = Goto(periodicHit, 0, (1 / periodicTime) * dt_sec());
        EffectZauberSurface(renderSurf, dx - render_surf_size*0.5, dy - render_surf_size*0.75, 1, 1, periodicColor, periodicHit);
    }
    
    // Draw surface{
    if (periodicHit > 0) || (hit_flash_str > 0 and hit_flash_timer > 0 and hit_flash_time > 0) {
        // Draw with hitflash
        var str = hit_flash_str * (hit_flash_timer / hit_flash_time);
        var strCol = hit_flash_color;
        if (periodicHit > 0) { str = periodicHit; strCol = periodicColor; }
        
        shader_set(shader_color);
        uCol = shader_get_uniform(shader_color, 'col');
        uStr = shader_get_uniform(shader_color, 'str');
        shader_set_uniform_f(uCol, color_get_red(strCol)  /255.0,
                                   color_get_green(strCol)/255.0,
                                   color_get_blue(strCol) /255.0);
        shader_set_uniform_f(uStr, str);
    
        draw_surface(renderSurf, dx - render_surf_size*0.5, dy - render_surf_size*0.75);
    
        shader_reset();
    } else {
        // Direct surface draw
        draw_surface(renderSurf, dx - render_surf_size*0.5, dy - render_surf_size*0.75);
    }
    surface_free(renderSurf);
}


// Call draw event from status effects
for (i = 0; i < ds_list_size(list_status_effect); i += 1) {
    var map, scr;
    map = ds_list_find_value(list_status_effect, i);
    scr = ds_map_find_value(map, "script");
    script_execute(scr, map, self.id, "draw_post", NULL);
}

// Draw lifebar //
if object_get_name(object_index) != "o_hoopz" {
    scr_enemy_lifebar("draw");
    if glampdraw = true then scr_enemy_glampstatus();
    if resistancedraw = true then DrawResistance();
} else {
    if(resistancedraw == true and global.quickmenuActive == 1)then DrawResistance();
}


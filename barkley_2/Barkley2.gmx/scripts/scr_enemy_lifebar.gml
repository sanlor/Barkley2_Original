// Enemy lifebar //
var command = argument0;
if command = "setup" then
    {
    lifepoints = 3;
    lifecolor = c_green;
    lifealpha = 0;
    lifedraw = 1;
    }
else if command = "update" then
    {
    // Update the bar //
    lifealpha = 3.5;
    var ratio = scr_stats_getCurrentStat(self, STAT_CURRENT_HP) / scr_stats_getEffectiveStat(self, STAT_EFFECTIVE_MAX_HP);
    if ratio >= 0.85 then
        {
        lifepoints = 3;
        lifecolor = make_color_rgb(80, 255, 30);
        }
    else if ratio >= 0.7 then
        {
        lifepoints = 2;
        lifecolor = make_color_rgb(110, 215, 30);
        }
    else if ratio >= 0.55 then
        {
        lifepoints = 2;
        lifecolor = make_color_rgb(140, 175, 20);
        }
    else if ratio >= 0.40 then
        {
        lifepoints = 1;
        lifecolor = make_color_rgb(170, 135, 20);
        }
    else if ratio >= 0.25 then
        {
        lifepoints = 1;
        lifecolor = make_color_rgb(200, 95, 20);
        }
    else if ratio >= 0.10 then
        {
        lifepoints = 0;
        lifecolor = make_color_rgb(230, 55, 10);
        }
    else
        {
        lifepoints = 0;
        lifecolor = make_color_rgb(255, 20, 10);
        }
    }
else if command = "draw" then
    {
    // Draw the bar //
    if (lifedraw)
        draw_sprite_ext(s_effect_lifebar, 3 - lifepoints, dx, dy - ailmentTotem_foot_get(self.id), 1, 1, 0, lifecolor, lifealpha);
    //Old draw code
    //draw_sprite_ext(s_effect_lifebar, 3 - lifepoints, dx, dy, 1, 1, 0, lifecolor, lifealpha);
    //draw_sprite_ext(s_effect_lifebar, 0, x, y, 1, 1, 0, c_white, lifealpha); - removed the gray styling
    }
else if command = "step" then
    {
    var ratio = scr_stats_getCurrentStat(self, STAT_CURRENT_HP) / scr_stats_getEffectiveStat(self, STAT_EFFECTIVE_MAX_HP);
    if lifealpha > 0 and ratio >= 0.1 then lifealpha -= 0.025;
    }

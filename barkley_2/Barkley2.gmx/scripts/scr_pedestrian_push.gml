// Try my best to do always  -GZ cam
// Pushed // Countdown before I return to my origin from the pushed state //
if push_return_to_origin > 0 then
    {
    // Tick down //
    push_return_to_origin -= dt();
    }
    
// Returning back to my origin spot instead of the pushed spot //
else
    {
    // Push back to origin, horizontal //
    if pushed_x > 1 then pushed_x -= 1;
    else if pushed_x < -1 then pushed_x += 1;
    else pushed_x = 0;
    
    // Push back to origin, vertical //
    if pushed_y > 1 then pushed_y -= 1;
    else if pushed_y < -1 then pushed_y += 1;
    else pushed_y = 0;
    }
    
// Return cooldown //
if push_return_to_origin_cooldown > 0 then
    {
    // Tick down //
    push_return_to_origin_cooldown -= dt();
    
    // Event //
    if push_return_to_origin_cooldown <= 0 then push_return_to_origin_treshold = 0;   
    }    

// Get pushed by Hoopz //
if place_meeting(x, y, PlayerCombatActor) and global.event = false then
    {
    // Push Hoopz //
    if PlayerCombatActor.move_x >= -3 and PlayerCombatActor.move_x <= 3 then PlayerCombatActor.move_x += lengthdir_x(push_player_force * push_weight, point_direction(x, y, PlayerCombatActor.x, PlayerCombatActor.y));
    if PlayerCombatActor.move_y >= -3 and PlayerCombatActor.move_y <= 3 then PlayerCombatActor.move_y += lengthdir_y(push_player_force * push_weight, point_direction(x, y, PlayerCombatActor.x, PlayerCombatActor.y));
    
    // Push strength increases to avoid Hoopz being able to occupy the same spot as the pedestrian //
    if push_player_force < 2 then push_player_force += 0.2;
    
    // Pedestrian is pushed away until treshold is met //
    if push_return_to_origin_treshold < 15 then
        {
        push_return_to_origin_treshold += dt();
        push_return_to_origin = 2;
        push_return_to_origin_cooldown = 10;
        push_me_force = 1 - (push_weight * 0.5);
        if push_me_force < 0 then push_me_force = 0.2;
        if pushed_x > -16 and pushed_x < 16 then pushed_x += lengthdir_x(push_me_force, point_direction(PlayerCombatActor.x, PlayerCombatActor.y, x, y)); 
        if pushed_y > -16 and pushed_y < 16 then pushed_y += lengthdir_y(push_me_force, point_direction(PlayerCombatActor.x, PlayerCombatActor.y, x, y)); 
        }
    }
    
// Reset the pushing force against player //
else push_player_force = 1;


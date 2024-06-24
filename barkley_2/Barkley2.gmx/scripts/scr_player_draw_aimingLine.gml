/// scr_player_draw_aimingLine(swimmove)

var swimmove = argument0;
aimingDraw = 0;
var gun = scr_equipment_guns_getCurrentGun();
if (gun != NULL || o_hoopz.stance == scr_player_stance_zauber) { // GZ
    var try = 0;
    var gunType = gun[? "pType"];
    if (gunType == GUN_TYPE_HUNTINGRIFLE or
            gunType == GUN_TYPE_TRANQRIFLE or
            gunType == GUN_TYPE_SNIPERRIFLE or
            gunType == GUN_TYPE_ELEPHANTGUN or
            gunType == GUN_TYPE_ASSAULTRIFLE or
            gunType == GUN_TYPE_RIFLE or
            gunType == GUN_TYPE_MUSKET or
            gunType == GUN_TYPE_CROSSBOW) try = 1;
    if (o_hoopz.stance == scr_player_stance_zauber) try = 1; // gz
    if (try) 
    {
        // Get barrel position
        if (o_hoopz.stance == scr_player_stance_zauber) scr_player_getGunShifts("",false);
        else scr_player_getGunShifts(gun[? "pType"],gun[? "pMaterial"]=="Dual");
        var gundir = aiming * (360 / aFaceCount)
        var distx = lengthdir_x(heldDist,gundir);
        var disty = lengthdir_y(heldDist,gundir)*0.75;
        var xhshift = lengthdir_x(heldHShift,gundir+90);
        var yhshift = lengthdir_y(heldHShift,gundir+90)*0.75;
        
        var _barrel_x = lengthdir_x(heldBulletDist, gundir) + distx + xhshift + x;
        var _barrel_y = lengthdir_y(heldBulletDist, gundir) + disty + yhshift + y;
        var _barrel_z = ARMS_HEIGHT + heldBullet_YShift + 1 - swimmove;
        
        // Adjust to aim more towards cursor
        var aimdir = look_dir;
        if (global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE) 
        {
            curX = cursor_x;
            curY = cursor_y;
            curDir = scr_math_mod(point_direction(_barrel_x, _barrel_y, curX, curY), 360);
            curDif = angle_difference(curDir, aimdir);
            curDif = clamp(curDif, -10, +10);
            aimdir += curDif;
            if (aimdir < 0) aimdir += 360; else if (aimdir >= 360) aimdir -= 360;
        }
        
        var gunRange = gun[? "bDistanceLife"];
        var gunRangeFadeStart = clamp(gunRange, 64, 200);
        var gunRangeFadeEnd = gunRangeFadeStart + 48;
        
        // Determine end point of aiming line
        to_x = _barrel_x + lengthdir_x(gunRangeFadeEnd, aimdir); // var
        to_y = _barrel_y + lengthdir_y(gunRangeFadeEnd, aimdir);
        var coll_dist_world = scr_collision_line_distance_absolute(_barrel_x, _barrel_y, to_x, to_y, _barrel_z, COLLISION_ONLY_SOLID);
        var coll_dist_enemy = scr_enemy_collision_line(_barrel_x, _barrel_y, to_x, to_y, _barrel_z, EnemyCombatActor);
        var coll_dist_destruct = scr_enemy_collision_line(_barrel_x, _barrel_y, to_x, to_y, _barrel_z, DestructibleCombatActor);
        var line_dist = min(coll_dist_world, coll_dist_enemy, coll_dist_destruct);
        to_x = _barrel_x + lengthdir_x(line_dist, aimdir);
        to_y = _barrel_y + lengthdir_y(line_dist, aimdir) - _barrel_z; // gz added + 4
        //if (line_dist == coll_dist_destruct) to_y += 8;
        
        // Determine start point of aiming line
        var line_dist_start = min(30, line_dist/2); // was 36
        from_x = _barrel_x + lengthdir_x(line_dist_start, aimdir); // var
        from_y = _barrel_y + lengthdir_y(line_dist_start, aimdir) - _barrel_z;
            
        // Draw
        aimingAlpha = 1;
        if (line_dist > gunRangeFadeStart) {
            aimingAlpha = 1 - ((line_dist - gunRangeFadeStart) / (gunRangeFadeEnd - gunRangeFadeStart));
        }
        
        if (line_dist < gunRangeFadeEnd and line_dist > 0) aimingDraw = 1;
    }
}

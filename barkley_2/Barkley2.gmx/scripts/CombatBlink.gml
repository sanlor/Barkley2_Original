/// CombatBlink(distance?)
var dis = 32 + irandom(32);
if (argument_count > 0) dis = argument[0];

var xpr = x;
var ypr = y;

for (var _i = 0; _i < 15; _i += 1)
{
    var dir = random(360);
    var linDis = scr_collision_line_distance_absolute(x, y, 
    x + lengthdir_x(dis, dir), y + lengthdir_y(dis, dir), 16, COLLISION_ALL);
    mx = lengthdir_x(linDis, dir);
    my = lengthdir_y(linDis, dir);
    movement_hit = scr_collision_move_contact_solid(mx, my, collision_check);
    if (movement_hit == 0)
    {
        //x = x + lengthdir_x(linDis, dir);
        //y = y + lengthdir_y(linDis, dir);
        break;
    }
    else
    {
        x = xpr;
        y = ypr;
    }
}

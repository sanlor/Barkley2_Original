/// gunfx_bfg_spark(bullet)

var bullet = argument0;

if (instance_exists(bullet)) {
    var dir = bullet.move_dir - 110 + random(220);
    var dist = 16 + random(24);
    var to_x = bullet.x + lengthdir_x(dist, dir);
    var to_y = bullet.y + lengthdir_y(dist, dir);
    var to_z = bullet.z;
    
    var check = scr_collision_line_distance(bullet.x, bullet.y, to_x, to_y, bullet.x, COLLISION_NORMAL);
    if (check != -1) {
        // Hit a wall
        dist = check;
        to_x = bullet.x + lengthdir_x(dist, dir);
        to_y = bullet.y + lengthdir_y(dist, dir);
    } else {
        to_z = scr_collision_zheight(to_x, to_y);
        if (is_undefined(to_z)) {
            to_z = 0;
        }
    }
    
    if (abs(to_z - bullet.z) < 64) {
        var fx = instance_create(to_x, to_y, o_effect_spark_bfg);
        fx.z = to_z;
        fx.parent_bullet = bullet;
    }
}

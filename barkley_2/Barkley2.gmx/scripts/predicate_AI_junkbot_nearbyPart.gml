var part = instance_nearest(x, y, o_wasteland_junk_enemypart);
return (part != noone and
        point_distance(x, y, part.x, part.y) <= 120 and
        part.pickupCooldown <= 0);

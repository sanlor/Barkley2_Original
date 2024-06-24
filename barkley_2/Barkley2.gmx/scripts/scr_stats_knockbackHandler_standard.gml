/* Standard knockback handler
   Pushes the actor every frame with a part of the knockback force */

var knockback_current = scr_stats_getCurrentStat(self, STAT_CURRENT_KNOCKBACK);
if (knockback_current > 0) {
    // We pull a certain amount of the knockback distance per frame
    // The larger the distance, the more of it we pull out.
    // The knockback force increases logarithmically with the distance
    var knockback = scr_stats_knockback_getForce() * dt();
    knockback = min(knockback, knockback_current);
    
    var knockback_v = scr_stats_knockback_getVector();
    
    if ((knockback_current - knockback) div 5 < knockback_current div 5 && scr_collision_place_free(x, y, COLLISION_WADING)) { // GZ FIX for wading water smoke
        var w = scr_entity_getMovementCollisionShapeRadius() / 2;
        /*var effect = instance_create(x + w - random(w*2), y + w - random(w*2), o_effect_generic_animateOnce);
        effect.z = z;
        with effect {
            sprite_index = s_effect_jetpackSmoke;
            gravity_x = 0;
            scr_entity_setMoveXYZ(0, 0, 0);
            scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 1);
            image_xscale = .5;
            image_yscale = .5;
        }*/
        Smoke("puff", x + w - random(w * 2), y + w - random(w * 2), z, 7 + random(5));
    }
    
    // Perform movement according to this vector
    var _xprev, _yprev;
    _xprev = x;
    _yprev = y;
    var mx = knockback * knockback_v[@ 0];
    var my = knockback * knockback_v[@ 1];
    knockback_v = 0; // Free array
    scr_collision_move_contact_solid(mx, my, collision_check);
    delta_x += x - _xprev;
    delta_y += y - _yprev;
    
    // Reduce the knockback amount
    scr_stats_setCurrentStat(self, STAT_CURRENT_KNOCKBACK, knockback_current - (knockback));
}

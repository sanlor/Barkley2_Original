/// scr_entity_bounceOnCollide(bounceSpd)
var bounceSpd = argument0;

if (scr_entity_movement_checkHitWall()) {
    var vec1 = scr_entity_movement_getHitWallVector();
    var vec2 = vector_reflection(-move_x, -move_y, vec1[0], vec1[1]);
    scr_entity_setMoveXY(vec2[0] * bounceSpd, vec2[1] * bounceSpd);
    vec1 = 0;
    vec2 = 0;
}

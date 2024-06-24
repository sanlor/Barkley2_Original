// Z-Ladder
var ladder = undefined;
var ascend = false;
if (scr_input_check_held(KEYID_UP, PLAYER1) and collision_rectangle(x-8, y-24, x+8, y-16, o_map_zladder, false, true)) {
    ladder = instance_nearest(x, y - 16, o_map_zladder);
    ascend = true;
}
if (scr_input_check_held(KEYID_DOWN, PLAYER1) and collision_rectangle(x-8, y-8, x+8, y, o_map_zladder, false, true)) {
    ladder = instance_nearest(x, y + 16, o_map_zladder);
}

if (!is_undefined(ladder)) {
    ladderDelay += dt();
    if (ladderDelay >= 2 || !ascend) {
        // Z-Ladder found, climb it
        z_ladder = ladder;
        if (ascend) {
            z = z_ladder.z_climb_bottom + 1;
        } else {
            z = z_ladder.z_climb_top - 1;
        }
        scr_player_setStance(scr_player_stance_zclimb);
        script_execute(stance);
        return true;
    }
} else {
    ladderDelay = 0;
}

return false;

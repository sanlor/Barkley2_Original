/// zauber_enemy_catfishQueen_bubblesSmall(command, caster, target_data, level)

var command = argument0;
var caster = argument1;
var aim_x = argument2;
var aim_y = argument3;
var aim_z = argument4;

if (command == "aim_decals") {
    // Place decals when aiming
    scr_fx_decal_transient(s_zauberCasting_circle, 1, aim_x, aim_y, aim_z - caster.z,
                           0.25, 0.25 * 0.7,
                           0, c_white, 0.5);
    scr_fx_decal_transient(s_zauberCasting_target, 1, aim_x, aim_y + 8, aim_z - caster.z, 1, 1, 0, c_white, 1)
}

if (command == "cast") {
    // Cast the zauber! Do whatever you want here
    var piety = scr_stats_getEffectiveStat(caster,STAT_BASE_PIETY);
    
    var bubbleAbility = floor(piety * 0.6); // it takes more effort to make large bubbles than small ones
    var numBubbles = max(1, bubbleAbility); // we always want to show one bubble
    
    var n = instance_create(aim_x, aim_y, o_zauber_queenBubblesSmall);
    n.spawnCount = numBubbles;
    n.dmg = piety;
    n.from = caster;
    n.toX = aim_x;
    n.toY = aim_y;
    n.toZ = aim_z;
    n.target_list = caster.target_list;
}

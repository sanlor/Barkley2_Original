/// ZauberBallSucker(command, caster, aim_x, aim_y, aim_z)

// ----- Input arguments -----
var command = argument0;
var caster = argument1;
var aim_x = argument2;
var aim_y = argument3;
var aim_z = argument4;

// ----- Commands -----
if (command == "element") return "KOSMIK";
if (command == "name") return "GALACTIC VORTEX";

if (command == "aim_decals") {
    // Place decals when aiming
    scr_fx_decal_transient(s_zauberCasting_circle, 1, aim_x, aim_y, aim_z,
                           0.25, 0.25 * 0.7,
                           0, c_white, 0.5);
    scr_fx_decal_transient(s_zauberCasting_target, 1, aim_x, aim_y + 8, aim_z, 1, 1, 0, c_white, 1)

}

if (command == "cast") 
{
    if (isCombatActor(caster)) 
    {
        var dir = caster.zauber_dir; //caster.aiming * 22.5;
        Zauber("effect", c_mental, dir);
        var cast_dir = point_direction(caster.x, caster.y, aim_x, aim_y);
        var piety = scr_stats_getEffectiveStat(caster, STAT_BASE_PIETY);
        
        // Create zauber
        var obj = instance_create(caster.x + lengthdir_x(24, cast_dir),
                                  caster.y + lengthdir_y(24, cast_dir),
                                  oZauberBallSucker);
        obj.z = caster.z;
        obj.movement_direction = cast_dir;
        
        piety /= 99;
        obj.radius_outer = lerp(global.zauberBallSuckerRadiusStartMinimum, global.zauberBallSuckerRadiusEndMinimum, piety);
        obj.radius_growth_speed = lerp(global.zauberBallSuckerRadiusGrowthMinimum, global.zauberBallSuckerRadiusGrowthMaximum, piety);
        obj.radius_outer_max = lerp(global.zauberBallSuckerRadiusEndMinimum, global.zauberBallSuckerRadiusEndMaximum, piety);
        obj.movement_speed = lerp(global.zauberBallSuckerSpeedMinimum, global.zauberBallSuckerSpeedMaximum, piety) / 10;
        obj.movement_distance_remain = lerp(global.zauberBallSuckerDistanceMinimum, global.zauberBallSuckerDistanceMaximum, piety);
        obj.pull_strength = lerp(global.zauberBallSuckerPullMinimum, global.zauberBallSuckerPullMaximum, piety);
        obj.timeSucking = lerp(global.zauberBallSuckerDurationMinimum, global.zauberBallSuckerDurationMaximum, piety);
        with (obj) event_user(0);
    }
}

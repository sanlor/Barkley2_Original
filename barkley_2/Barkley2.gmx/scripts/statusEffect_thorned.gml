// Periodic inflicts target with thornball that shoots out damaging BIO thorns.
statusEffect_this = statusEffect_thorned;

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_this, _bullet);
        
        // NUMBER OF THORNS FLYING OUT OF THE TARGET //
        conf[? "sprayCount"] = 5 + floor(gun[? "pAffix"]/100);
        
        // BIO DAMAGE OF THE SHOT AND THE THORNS //
        conf[? "bioDamage"] = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL) * (0.5 + gun[? "pAffix"]/100);

        // SET BULLET DAMAGE TO BIO TYPE AND REMOVE NORMAL DAMAGE //
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_BIO, scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL)); 
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, 0);
        
        // CHANGE BULLET SPRITE //
        gun[? "pBulletSprite"] = sprite_get_name(s_bull_thorns);
    }
    return 1;
}

var conf = argument[0];
var actor = argument[1];
var command = argument[2];
if (argument_count > 3) var changestat = argument[3];

// GENERATE BASIC INFO //
if (command == "generate") then
{
    // Copy attack stats into Conf so it can be used as an attack object
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_this, 10);
    
    // Basic data to prevent undefined variable crashes //
    conf[? "sprayCount"] = 4;
    conf[? "bioDamage"] = 5;
    
    // Return configuration //
    return conf;
}
// CHECK IF ACTOR EXISTS OR NOT //
else if (!instance_exists(actor)) then
{
    return 0;
}
else if (command == "apply")
{
    var reapply = statusHelper_reapply(actor, statusEffect_this, conf);
    if (reapply == 0) // Target did not previously have this status
    {
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_thorns"), false, 70);
    }
    return 0;
}
else if (command == "step") then
{
    var atk = scr_stats_newAttackStats();
    atk[? STAT_ATTACK_STAGGER] = 100;
    atk[? STAT_ATTACK_STAGGER_HARDNESS] = STAGGER_HARDNESS_SOFT;
    scr_stats_performAttack(atk, actor, false, NULL, false, true);
    ds_map_destroy(atk);
    return false;
}
else if (command == "draw") then
{
    image_blend = make_color_rgb(160, 255, 160);
    return 0;
}
else if (command == "finish") then
{
    // Return zero //
    // Variables for the thorn blast //
    var radius, thorndmg;
        
    // Number and damage of the thorns //
    radius = conf[? "sprayCount"];
    thorndmg = conf[? "bioDamage"];
           
    // Spawn the thorns //
    for(i=0; i<radius; i+=1)
        {
        // Set the direction and speed //
        var dir, spd;
        dir = 360/radius * i;
        spd = 24; // Speed of thorns
        var dis = 64; // Distance thorns travel
        
        // Create the thorns //
        a = instance_create(actor.x, actor.y, o_advBullet);
        with (a)
        {
            distlife = dis;
            timelife = dis;
            sprite_index = s_bull_thornspray_big;
            image_index = irandom(7);
            move_x_offset = actor.move_x;
            move_y_offset = actor.move_y;
            z = actor.z + (actor.hitbox_z_top / 2);
            ds_list_add(hit_list, actor);
            scr_entity_setDirSpd(dir, spd);
            ds_list_add(target_list, EnemyCombatActor);
            ds_list_add(target_list, PlayerCombatActor);
        }
        scr_stats_setAttackStat(a, STAT_ATTACK_DMG_BIO, thorndmg * 1); //0.5);
        }  
        
    // Play sound when applied //
    audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_thorns"),false,70);
    
    // Reset image_blend - need to make additive system for this
    image_blend = c_white;
      
    // Return zero //  
    return 0;
}

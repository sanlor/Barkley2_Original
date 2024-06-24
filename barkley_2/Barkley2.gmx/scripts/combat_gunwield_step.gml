/// combat_gunwield_step(gun)

var gun = argument0;

if (gun == NULL) {
    return 0;
}

var _triggerGain;
_triggerGain = 0;

// Which charge gain type is used //
switch(gun[? "pChargeGain"])
{
    // No charge
    case "cg_none":
        break;
    
    // Always full charge //
    case "cg_full":
        gun[? "pChargeCur"] = gun[? "pChargeMax"];
        break;
        
    // Each shot increases charge //
    case "cg_shot":
        _triggerGain += gun[? "pChargeShot"];
        break;
        
    // Dealing damage increases charge (1pt = 1 min bullet damage) //
    case "cg_damage":
        if(gun[? "pChargeDamage"]>0 and gun[? "pDamageMin"]>0){
            _triggerGain += gun[? "pChargeDamage"] / gun[? "pDamageMin"];
        }
        break;
        
    // Taking damage increases charge (1pt = 1% MAX HP damage) //
    case "cg_hurt":
        if(gun[? "pChargeHurt"] > 0 and scr_stats_getEffectiveStat(id, STAT_EFFECTIVE_MAX_HP) > 0) {
            var maxhp = scr_stats_getEffectiveStat(id, STAT_EFFECTIVE_MAX_HP);
            _triggerGain += (gun[? "pChargeHurt"] / (maxhp)) * 100;
        }
        break;
        
    // Hitting something increases charge? //
    case "cg_hit":
        _triggerGain += gun[? "pChargeHits"];
        break;
        
    // Each shot increases charge, hit increases charge by 2x //
    case "cg_shot_2xhit":
        _triggerGain += gun[? "pChargeShot"];
        _triggerGain += gun[? "pChargeHits"] * 2;
        break;
        
    // Constantly hitting something increases charge? //
    case "cg_conshit":
        if(gun[? "pChargeMissed"]>0){gun[? "pChargeGainVar"]=  0;}
        if(gun[? "pChargeHits"]>0)
        {
            gun[? "pChargeGainVar"]+=1;
            if(gun[? "pChargeGainVar"]>1){_triggerGain += 1;}
        }
        break;
        
    // Increase charge via kills //
    case "cg_kill":
        _triggerGain += gun[? "pChargeKilled"];
        break;
        
    // Candy eat //
    case "cg_candy":
        _triggerGain += gun[? "pChargeCandy"];
        break;
        
    // Stand still //
    case "cg_nomove":
        if (gun[? "pFireDelay"] == 0) {
            _triggerGain = 1;
        }
        break;
        
    // Stand still and enemy is nearby //
    case "cg_nomove_enemyProximity":
        if (move_dist == 0) {
            
            var nearest = scr_actor_getNearestOfTypeList(target_list, x, y);
            if (nearest != noone) {
                var dist = point_distance(x, y, nearest.x, nearest.y);
                if (dist < 250) {
                    _triggerGain = 1;
                }
            }
        }
        break;
        
    // Charge while gun is loaded //
    case "cg_loaded":
        if (move_dist == 0) {
            _triggerGain = 1;
        }
        break;
        
    // Heartbeat ? //
    case "cg_heartbeat":
        gun[? "pChargeGainVar"] = (gun[? "pChargeGainVar"] + dt() * 0.85) mod 8;
        var phase = floor(gun[? "pChargeGainVar"]);
        if (phase == 4) {
            gun[? "pChargeCur"] = .75;
        }
        else if (phase == 6) {
            gun[? "pChargeCur"] = 1;
        }
        else {
            gun[? "pChargeCur"] = 0;   
        }
        break;
        
    // Minigun: Each shot increases charge + Full charge when gun has winded down //
    case "cg_mitrailleuse":
        _triggerGain += gun[? "pChargeShot"];
        if (gun[? "pWindUpSpeed"] > 0 and gun[? "pWindUp"] <= 0) {
            gun[? "pChargeCur"] = gun[? "pChargeMax"];
        } 
        break;
        
    // Enemy is nearby //
    case "cg_enemyProximity":
        var nearest = scr_actor_getNearestOfTypeList(target_list, x, y);
        if (nearest != noone) {
            var dist = point_distance(x, y, nearest.x, nearest.y);
            var gain = max(0, (1 - dist/200) * dt());
            gun[? "pChargeCur"] += gain;
        }
        break;
        
    // Aim at enemy //
    case "cg_aim":
        var aimx;
        var aimy;
        var nearest;
        if (object_is_ancestor(object_index, PlayerCombatActor)) {
            aimx = o_curs.x + view_xview;
            aimy = o_curs.y + view_yview;
            nearest = instance_nearest(aimx, aimy, EnemyCombatActor);
            if (PlayerCombatActor.move_x != 0 || PlayerCombatActor.move_y != 0) nearest = noone;
        } else {
            aimx = o_hoopz.x;
            aimy = o_hoopz.y;
            nearest = scr_actor_getNearestOfTypeList(target_list, aimx, aimy);
        }
        if (nearest != noone) {
            var dist = point_distance(aimx, aimy, nearest.x, nearest.y);
            var gain = max(0, (1 - dist/100) * dt());
            gun[? "pChargeCur"] += gain;
        }
        if (gun[? "pChargeShot"] > 0) {
            gun[? "pChargeCur"] = 0;
        }
        break;
}

// How much charge is gained //
if(_triggerGain)
{
    gun[? "pChargeLossAccum"] = 0;
    switch(gun[? "pChargeGainAmount"])
    {
        case "ga_gainAll":
            gun[? "pChargeCur"] = gun[? "pChargeMax"]; 
            break;
            
        case "ga_gainOne":
            gun[? "pChargeCur"] += _triggerGain;
            break;
            
        case "ga_gainTime":
            gun[? "pChargeCur"] += _triggerGain * dt() * gun[? "pChargeGainTime"];
            break;
            
        case "ga_gainAmmoLevel":
            if (gun[? "pMaxAmmo"] > 0) {
                var ammoLevel = gun[? "pCurAmmo"] / gun[? "pMaxAmmo"];
                var diff = gun[? "pChargeGainAmmoMax"] - gun[? "pChargeGainAmmoMin"];
                gun[? "pChargeCur"] += _triggerGain * (gun[? "pChargeGainAmmoMin"] + ammoLevel*diff);
            }
            break;
            
        case "ga_gainAccum": // Accumulates while holding the fire button
            while (_triggerGain >= 1) {
                gun[? "pChargeCur"] += gun[? "pChargeAccum"];
                gun[? "pChargeAccum"] *= gun[? "pChargeIncAccum"];
                if (gun[? "pChargeAccum"] > gun[? "pChargeMaxAccum"]) {
                    gun[? "pChargeAccum"] = gun[? "pChargeMaxAccum"];
                }
                _triggerGain--;
            }
            break;
            
        case "ga_none":
            break;
    }
}

// Reset accumulated charge gain when fire button released //
if (!scr_input_check_held(KEYID_ACTION, PLAYER1)) {
    gun[? "pChargeAccum"] = 1;
}


// Which charge loss type is used //
var _triggerLoss;
_triggerLoss = 0;

switch(gun[? "pChargeLoss"])
{
    // Charge is never lost //
    case "cl_none":
        _triggerLoss = 0;
        break;
        
    // Charge lost when you shoot //
    case "cl_shot":
        if(gun[? "pChargeShot"] > 0){
            _triggerLoss = 1;
        }
        break;
        
    // Charge lost when you miss //
    case "cl_shotmissed":
        if(gun[? "pChargeMissed"]>0){
            _triggerLoss = 1;
        }
        break;
        
    // Charge is lost when you move or shoot //
    case "cl_move":
        if (move_dist != 0) {
            _triggerLoss = 1;
        }
        if (gun[? "pChargeShot"] > 0) {
            gun[? "pChargeCur"] = 0;
        }
        break;
        
    // Charge is lost always //
    case "cl_time":
        _triggerLoss = 1;
        break;
    
    default:
        _triggerLoss = 0;
        break;
}

// How much charge is lost //
if(_triggerLoss>0)
{
    gun[? "pChargeAccum"] = 1;
    switch(gun[? "pChargeLossAmount"])
    {
        case "la_loseAll":
            gun[? "pChargeCur"] = 0;
            break;
            
        case "la_loseOverTime":
            gun[? "pChargeCur"] -= dt() * gun[? "pChargeLossTime"];
            break;
            
        case "la_loseOne":
            gun[? "pChargeCur"] -= _triggerLoss;
            break;
            
        default:
            break;
    }
}

var stepScript = assetOrNull(gun[? "stepScript"], asset_script);
if (stepScript != NULL) {
    script_execute(stepScript, self.id, gun);
}

// Upper and lower limits of charge //
if(gun[? "pChargeCur"]>gun[? "pChargeMax"]){gun[? "pChargeCur"] = gun[? "pChargeMax"];}
if(gun[? "pChargeCur"]<0){gun[? "pChargeCur"] = 0;}

// The ratio of how much of the charge is filled up //
var chargeBefore = gun[? "pChargeRatio"];
gun[? "pChargeRatio"] = gun[? "pChargeCur"] / gun[? "pChargeMax"];
if (gun[? "pChargeRatio"] >= 1 and chargeBefore < 1) {
    audio_play_sound_on_actor(id, "periodic_charged", false, 100);
    // Use this if there is no prefix 2
    // audio_play_sound_on_actor(id, "periodic_charged_muted", false, 100);
}

// Reset things //
gun[? "pChargeMissed"] = 0;
gun[? "pChargeShot"] = 0;
gun[? "pChargeHits"] = 0;
gun[? "pChargeKilled"] = 0;
gun[? "pChargeKilledPow"] = 0;
gun[? "pChargeDamage"] = 0;
gun[? "pChargeHurt"] = 0;
gun[? "pChargeCandy"] = 0;


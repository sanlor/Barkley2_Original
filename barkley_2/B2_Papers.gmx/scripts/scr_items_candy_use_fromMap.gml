/// scr_items_candy_use(candyMap)

// If Hoopz doesn't exist, return a ZERO //
if (!instance_exists(o_hoopz)) 
    {
    return 0;
    }

// Setup some vars //
var candy = argument0;
var effects = candy[? "effects"];
var playSound = true;

// Go through the effects //
for (var i = 0; i < ds_list_size(effects); i++) 
    {
    // Comparison variables //
    var effect = effects[| i];
    var effectType = effect[? "effect"];
    
    // Check what effect the candy has //
    switch (effectType) 
        {    
        // Basic heal //
        case "heal":
            // Increase HP
            var amount = effect[? "amount"];
            var hp = scr_stats_getCurrentStat(o_hoopz, STAT_CURRENT_HP);
            scr_stats_setCurrentStat(o_hoopz, STAT_CURRENT_HP, hp + amount); 
                
            // Show Text
            var ind = instance_create(o_hoopz.x, o_hoopz.y, o_entity_indicatorCandy);
            ind.name = candy[? "name"];
            ind.number = amount;
        break;
            
        // Heal over time //
        case "healOverTime":
            var heal = scr_statusEffect_generateNewFromScript(statusEffect_healOverTime);
            heal[? "healCount"] = effect[? "times"];
            heal[? "healAmount"] = effect[? "amount"];
            heal[? "healInterval"] = effect[? "interval"];
            scr_statusEffect_applyNewToCombatActor(o_hoopz.id, heal);
        break;
        
        // Remove all ailments? //    
        case "antidote":
            // Nathink
        break;
                    
        // Display text // For info and "Jokes" //
        case "showText":
            // Show Text
            var ind = instance_create(o_hoopz.x, o_hoopz.y, o_entity_indicatorText);
            ind.name = candy[? "name"];
            ind.text = effect[? "text"];
        break;
        
        // Speed boost //
        case "speedBoost":
            var boost = scr_statusEffect_generateNewFromScript(statusEffect_candySpeed);
            boost[? "giveSpeed"] = effect[? "amount"];
            scr_statusEffect_applyNewToCombatActor(o_hoopz.id, boost);
        break;
        
        // GLAMP boost // GUTS +5
        case "gutsBoost":
            var boost = scr_statusEffect_generateNewFromScript(statusEffect_candyGuts);
            boost[? "boost"] = effect[? "amount"];
            scr_statusEffect_applyNewToCombatActor(o_hoopz.id, boost);
        break;
        
        // GLAMP boost // LUCK +5
        case "luckBoost":
            var boost = scr_statusEffect_generateNewFromScript(statusEffect_candyLuck);
            boost[? "boost"] = effect[? "amount"];
            scr_statusEffect_applyNewToCombatActor(o_hoopz.id, boost);
        break;
        
        // GLAMP boost // ACROBATICS +5
        case "acroBoost":
            var boost = scr_statusEffect_generateNewFromScript(statusEffect_candyAcro);
            boost[? "boost"] = effect[? "amount"];
            scr_statusEffect_applyNewToCombatActor(o_hoopz.id, boost);
        break;
        
        // GLAMP boost // MIGHT +5
        case "mightBoost":
            var boost = scr_statusEffect_generateNewFromScript(statusEffect_candyMight);
            boost[? "boost"] = effect[? "amount"];
            scr_statusEffect_applyNewToCombatActor(o_hoopz.id, boost);
        break;
        
        // GLAMP boost // PIETY +5
        case "pietyBoost":
            var boost = scr_statusEffect_generateNewFromScript(statusEffect_candyPiety);
            boost[? "boost"] = effect[? "amount"];
            scr_statusEffect_applyNewToCombatActor(o_hoopz.id, boost);
        break;
        
        case "scrollWeapon":
            show_debug_message("scroll weapon used!");
            _gun = scr_items_candy_scrollWeapon();
            combat_gunwield_shoot(id,_gun,look_dir,false);
            ds_map_destroy(_gun);
            playSound = false;
        break;
        }
    }

// Optionally clutter up the marquee
if (ds_map_exists(candy, "marquee")) 
    {
    Marquee("queue custom", candy[? "marquee"], c_white);
    }
    
// Play a candy slurp sound //
if(playSound){audio_play_sound_on_actor(o_hoopz,scr_soundbank_pickSound("hoopz_crunchcandy"),false,90);}

// Send candy info to current gun
var gun = scr_equipment_guns_getCurrentGun();

// Check if you have a gun, and then increase the guns candy periodic //
if (gun != NULL) 
    {
    gun[? "pChargeCandy"] += 1;
    }

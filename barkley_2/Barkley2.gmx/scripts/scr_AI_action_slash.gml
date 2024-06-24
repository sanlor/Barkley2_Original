// Setup some variables for later use //
var _action, _retvar, conf, _obj;

// Provide argument //
_action = argument0;

// Configure some maps //
if(_action=="config") then
    {
    conf = ds_map_create();
    ds_map_add(conf, "attackSystem", "old");
    ds_map_add(conf, "attackName", "slash");
    ds_map_add(conf, "maskDirs", 4);
    ds_map_add(conf, "mask", mask_crescent_24_12);
    ds_map_add(conf, "range", 0);
    ds_map_add(conf, "atkStep", 0); ///makes the enemy step forward by X pixels at the attack
    ds_map_add(conf, "beforeTime", 3);
    ds_map_add(conf, "damageTime", 0.5);
    ds_map_add(conf, "afterTime", 2);
    ds_map_add(conf, "beforeSpeed", 0);
    ds_map_add(conf, "damageSpeed", 0);
    ds_map_add(conf, "afterSpeed", 0);
    ds_map_add(conf, "turnSpeed", 0);
    ds_map_add(conf, "numParticles", 0);
    ds_map_add(conf, "particleObject", NULL);
    ds_map_add(conf, "sndAttackWarn",NULL);
    ds_map_add(conf, "sndAttackStrike",NULL);
    ds_map_add(conf, "atkLength", 16);  // where does the attack occur relative to the enemy's position?
    AI_util_action_addDefaultDamage(conf)   
    return conf;
    }

// Reset after use //
if(_action=="reset") then
    {
    conf = argument1;
    I_atk_slsh_timer = 0;
    I_atk_slsh_state = "before";
    I_atk_slsh_didAttack = false;
    I_atk_slsh_intBefore = ds_map_find_value(conf, "beforeTime");
    I_atk_slsh_intDamage = ds_map_find_value(conf, "damageTime");
    I_atk_slsh_intAfter = ds_map_find_value(conf, "afterTime");
    }

// Execute the attack //
if(_action = "execute") then
    {
    var _retvar = AI_STATERESULT_CONTINUE;
    
    conf = argument1;
    a_attackName = ds_map_find_value(conf, "attackName");
    
    // Stop moving //
    scr_entity_setMoveXY(0, 0);
    
    // Turn towards target if the target exists and you have turn speed //
    if (instance_exists(I_AI_target) and conf[? "turnSpeed"] > 0) then
        {
        scr_AI_util_turnTowards(I_AI_target.x, I_AI_target.y, conf[? "turnSpeed"]);
        }
    
    // Get the base movement speed of the one performing this attack //
    var baseSpeed = scr_stats_getEffectiveStat(id, STAT_BASE_SPEED);
    
    // Slash state switch //
    switch(I_atk_slsh_state)
        {
        // Before the slash //
        case "before":
            
        // Play a warning sound //
        if (I_atk_slsh_timer==0) then audio_play_sound_AI(ds_map_find_value(conf, "sndAttackWarn"));
        
        // Increase slash timer //
        I_atk_slsh_timer+= dt();
        
        // Set direction and speed //
        scr_entity_setDirSpd(faceDir, conf[? "beforeSpeed"] * baseSpeed);
        
        // If the slash timer is high enough perform the next action //
        if(I_atk_slsh_timer>=I_atk_slsh_intBefore) then
            {
            // Reset the slash timer, go to the next state in the attack called "damage" //
            I_atk_slsh_timer = 0;
            I_atk_slsh_state = "damage";
            
            // Lunge forward //
            mvGo = ds_map_find_value(conf, "atkStep");
            if(mvGo>0) //step forward on attack, happens on a single step so I cant use the normal move code...
                {
                scr_collision_move_contact_solid(lengthdir_x(mvGo,faceDir),lengthdir_y(mvGo,faceDir),collision_check)
                }
            }
        break;
            
        // Dealing damage //
        case "damage":
        
        // Play an attack sound //
        if (I_atk_slsh_timer==0) then audio_play_sound_AI(ds_map_find_value(conf, "sndAttackStrike"));
        
        // Increase slash timer //
        I_atk_slsh_timer+= dt();
        
        // Set direction and speed //
        scr_entity_setDirSpd(faceDir, conf[? "damageSpeed"] * baseSpeed);
        
        // Do this once //
        if (!I_atk_slsh_didAttack) then 
            {
            // Quantized direction
            var qdir = faceDir;
            if (conf[? "maskDirs"] > 0) 
                {
                qdir = faceDir - (faceDir mod (360 / conf[? "maskDirs"]));
                }
            
            // Rubble <--- what?
            
            var snap = 360 / conf[? "maskDirs"];
            
            // preload map values
            var part_num = conf[? "numParticles"];
            var part_obj = conf[? "particleObject"];
            var part_len = conf[? "atkLength"];
            var part_dir = 45 + faceDir div snap * snap;
            
            var part_x = x + (cos(degtorad(faceDir)) * part_len);
            var part_y = y - (sin(degtorad(faceDir)) * part_len);
            
            repeat(part_num) 
                {
                var i = random(360);
                var l = random(16);
                var n = instance_create(part_x + lengthdir_x(l, i), part_y + lengthdir_y(l, i), part_obj);
                with (n) 
                    {
                    move_z = 4 + random(8);
                    scr_entity_setDirSpd(random(360), random(6));
                    sprite_index = s_effect_rubble_rocks;
                    image_index = floor(random(sprite_get_number(sprite_index)));
                    }
                }
            
            // Create a static attack in the direction I am facing!
            var n, ax, ay, _dist;
            _dist = ds_map_find_value(conf, "range");
            ax = cos(degtorad(qdir)) * _dist;
            ay = -sin(degtorad(qdir)) * _dist;
            n = instance_create(x + ax, y + ay, o_enemyAttack_melee_static)
            n.z = z;
            n.parent = id;
            n.attack_from = id;
            n.instantkill = conf[? "instantKill"]
            n.offset_x = ax;
            n.offset_y = ay;
            n.lifetime = I_atk_slsh_intDamage;
            n.mask_index = conf[? "mask"];
            n.image_angle = qdir;
            ds_list_copy(n.target_list, target_list);
            if (instance_exists(I_AI_target)) ds_list_add(n.target_list, I_AI_target.object_index);                
            if (ds_map_find_value(conf, "attackSystem") == "new") Attack("damage", id, conf, n);
            else AI_util_action_attackEntityDamageFromAction(self.id, conf, n, STAT_ATTACK_DMG_NORMAL);                
            n.knockback_dir = qdir;                
            I_atk_slsh_didAttack = true;
            }
                    
        if(I_atk_slsh_timer >= I_atk_slsh_intDamage)
            {
            I_atk_slsh_timer = 0;
            I_atk_slsh_state = "after";
            }
        break;
            
        // After the fact //
        case "after":
        
        I_atk_slsh_timer += dt();
        scr_entity_setDirSpd(faceDir, conf[? "afterSpeed"] * baseSpeed);
        
        if (I_atk_slsh_timer >= I_atk_slsh_intAfter) 
            {
            _retvar = AI_STATERESULT_REMOVE;
            }
        break;
        }

    a_attackState = I_atk_slsh_state;
    a_attackAnim = I_atk_slsh_timer;
    
    if (_retvar != AI_STATERESULT_CONTINUE) 
        {
        a_attackName = "";
        }

    // Return garbage //    
    return _retvar;  
    }

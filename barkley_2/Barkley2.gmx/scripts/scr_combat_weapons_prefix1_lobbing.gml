///scr_combat_weapons_prefix1_spiraling(action, gunOrNull)

// SETUP //
var _action = argument0;
var gun = argument1;
var _retvar = noone;

// MINUS - FIRING //
switch(_action)
{
    case "apply": 
        //gun[? "bSpiraling"] = choose(1, -1) * (irandom(4) + 4);
        //gun[? "bTimeLife"] += 64;
        //gun[? "bDistanceLife"] = -1;
        //gun[? "bMaxSpeed"] = 28;    
        //gun[? "bMinSpeed"] = 16;
        gun[? "bLobGravity"] = 2;//2;
        gun[? "bRangeEndGrav"] = 1.5;//3; // combat_gunwield_shoot has code for flaregun
        gun[? "bLobDirection"] = 70;
        //gun[? "bShadow"] = 8;

        gun[? "bRoaming"] = 1;

        gun[? "bSpeed"] = 10;
        gun[? "bAccel"] = -0.20;
        gun[? "bMinSpeed"] = 0.5;
        
        gun[? "bLongTimeOut"] = true;     
        gun[? "sRange"] = 40*1.2;//_rng;        
    break;
    case "checkval":
        _retvar = 2;
    break;
}

// END //
return _retvar;

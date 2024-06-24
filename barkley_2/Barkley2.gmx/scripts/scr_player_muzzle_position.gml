/// scr_player_muzzle_position()
/// Hoopz X and Y and Actor Aiming and Actor FaceCount
// defaults: scr_player_getGunShifts
muzX = -999;
muzY = -999;
var did = 0;
var _type = argument0;
var dualGuns = argument1;
var actor = argument2;
var gun = argument3;
var gunCount = argument4;
switch(_type)
{
    case GUN_TYPE_PISTOL:
    case GUN_TYPE_MACHINEPISTOL: 
    case GUN_TYPE_SUBMACHINEGUN: 
    case GUN_TYPE_REVOLVER: 
    case GUN_TYPE_MAGNUM: 
    case GUN_TYPE_FLINTLOCK:  
        heldDist = 17;// + 2;
        heldHShift = 0;
        heldVShift = 5;
        heldBulletDist = 8;// - 6;
        heldBullet_YShift = 5 + 2;// + 2; 
        heldBulletDist = 12 - 6;// - 6;
        did = 1;
    break;
}
switch(_type)
{
    case GUN_TYPE_PISTOL: // DONE
        heldBullet_YShift += 0; 
        heldBulletDist += 0; 
    break;
    case GUN_TYPE_MACHINEPISTOL: // DONE
        heldBullet_YShift += 1; 
        heldBulletDist += 2; 
    break;
    case GUN_TYPE_SUBMACHINEGUN: // DONE    
        heldBullet_YShift += 2; 
        heldBulletDist += 1; 
    break;
    case GUN_TYPE_REVOLVER: // DONE   
        heldBullet_YShift += 6; 
        heldBulletDist += 5; 
    break;
    case GUN_TYPE_MAGNUM: // DONE          
        heldBullet_YShift += 4; 
        heldBulletDist += 8; 
    break;
    case GUN_TYPE_FLINTLOCK: // DONE       
        heldBullet_YShift += 1; 
        heldBulletDist += 4;
    break;
    
    case GUN_TYPE_RIFLE: // DONE
        heldBullet_YShift += -3; 
        heldBulletDist += -2; 
        did = 1;
    break;
    case GUN_TYPE_MUSKET: // DONE
        heldBullet_YShift += -3; 
        heldBulletDist += -1; 
        did = 1;
    break;
    case GUN_TYPE_HUNTINGRIFLE: // DONE
        heldBullet_YShift += -4; 
        heldBulletDist += -3; 
        did = 1;
    break;
    case GUN_TYPE_SNIPERRIFLE: // DONE 
        heldBullet_YShift += -3; 
        heldBulletDist += -2; 
        did = 1;
    break;
    case GUN_TYPE_TRANQRIFLE: // DONE
        heldBullet_YShift += -4; 
        heldBulletDist += -1; 
        did = 1;
    break;
    
    case GUN_TYPE_SHOTGUN: // DONE
        heldBullet_YShift += 5; 
        heldBulletDist += -3; 
        did = 1;
    break;
    case GUN_TYPE_ELEPHANTGUN: // DONE
        heldBullet_YShift += 5; 
        heldBulletDist += -2; 
        did = 1;
    break;
    case GUN_TYPE_REVOLVERSHOTGUN: // DONE
        heldBullet_YShift += 8; 
        heldBulletDist += -4; 
        did = 1;
    break;
    case GUN_TYPE_DOUBLESHOTGUN: // DONE
        heldBullet_YShift += 3; 
        heldBulletDist += -2; 
        did = 1;
    break;
    
    case GUN_TYPE_ASSAULTRIFLE: // DONE
        heldBullet_YShift += 0; 
        heldBulletDist += -1; 
        did = 1;
    break;
    
    case GUN_TYPE_CROSSBOW: 
        heldBullet_YShift += 3; 
        heldBulletDist += 2; 
        did = 1;
    break;
    case GUN_TYPE_FLAREGUN: // DONE 
        heldBullet_YShift += 4; 
        heldBulletDist += 0; 
        did = 1;
    break;
    case GUN_TYPE_ROCKET: // DONE
        heldBullet_YShift += 6; 
        heldBulletDist += -1; 
        did = 1;
    break;
    case GUN_TYPE_BFG: 
        heldBullet_YShift -= 1; 
        heldBulletDist += -1; 
        did = 1;
    break;
}

if (did)
{
    // Wading depth
    var current = scr_statusEffect_getFromCombatActor(actor.id, statusEffect_wading);
    var swimmove = 0;
    if(current >0)
    {
        swimmove = ds_map_find_value(current, "wadingDepthCurrent");
    }
    
    var _aimdirQuant = actor.aiming * (360 / actor.aFaceCount);
    var dir = actor.aiming*22.5 
    if (gun[? "pPrefix1"] == "Afterburner")
    {
        dir -= 180;
        _aimdirQuant -= 180;
        //_aimdir -= 180;
    }
    var distx = lengthdir_x(heldDist,dir);
    var disty = lengthdir_y(heldDist,dir)*0.75;
    if(gun[? "pMaterial"]=="Dual" && heldHShift<6)
    {
        heldHShift = 8;
    }
    var xhshift = lengthdir_x(heldHShift,dir+90);
    var yhshift = lengthdir_y(heldHShift,dir+90)*0.75;
    
    if(gunCount==2)
    {
        xhshift = lengthdir_x(heldHShift,dir-90);
        yhshift = lengthdir_y(heldHShift,dir-90)*0.75;
    }
    
    var _barrel_x = lengthdir_x(heldBulletDist,_aimdirQuant) + distx + xhshift + actor.x;
    var _barrel_y = lengthdir_y(heldBulletDist,_aimdirQuant) + disty + yhshift + actor.y;
    var _barrel_z = actor.ARMS_HEIGHT + heldBullet_YShift + 1 - swimmove;
    
    muzX = _barrel_x;
    muzY = _barrel_y;
    muzZ = _barrel_z;
}

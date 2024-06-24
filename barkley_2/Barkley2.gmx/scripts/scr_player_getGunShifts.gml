///scr_player_getGunShifts(weaponType,dualGuns)

var _type = argument0;
var dualGuns = argument1;
heldDist = 12;
heldHShift = 0;
heldVShift = 0;

heldBulletDist = 16;
heldBullet_YShift = -5;

switch(_type)
{
    ////heavy weapons are held low and close, to a side
/*    case GUN_TYPE_HEAVYMACHINEGUN:
    case GUN_TYPE_GATLINGGUN:
    case GUN_TYPE_MINIGUN:
    case GUN_TYPE_MITRAILLEUSE:
        heldDist = -4;
        heldVShift = -4;
        heldHShift = -8;
        heldBulletDist = 30;
        break;
        
    ////Rifles are held high and close, almost centered
    case GUN_TYPE_ASSAULTRIFLE:
    case GUN_TYPE_RIFLE:
    case GUN_TYPE_MUSKET:
    case GUN_TYPE_HUNTINGRIFLE:
    case GUN_TYPE_TRANQRIFLE:
    case GUN_TYPE_SNIPERRIFLE:
    case GUN_TYPE_CROSSBOW:
        heldDist = 10;
        heldVShift = 6;
        heldHShift = -7;
        break;
*/        
    ////shotguns are held somewhat low and close, a little to a side.
    case GUN_TYPE_MINIGUN:
        heldDist = -6;
        heldVShift = -2;
        heldHShift = -12;
        heldBulletDist = 16;
        if(dualGuns)
        {
            heldDist = 12;
            heldHShift = 0;
            heldVShift = 3;
            heldBulletDist = 8;
        }
        break;
        
    case GUN_TYPE_GATLINGGUN:
        heldDist = -4;
        heldVShift = 3;
        heldHShift = -12;
        heldBulletDist = 16;
        if(dualGuns)
        {
            heldDist = 8;
            heldHShift = 0;
            heldVShift = 5;
            heldBulletDist = 8;
        }
        break;
        
    case GUN_TYPE_MITRAILLEUSE:
        heldDist = 0;
        heldVShift = 3;
        heldHShift = -12;
        heldBulletDist = 16;
        if(dualGuns)
        {
            heldDist = 12;
            heldHShift = 0;
            heldVShift = 5;
            heldBulletDist = 8;
        }
        break;
        
    case GUN_TYPE_HEAVYMACHINEGUN:
        heldDist = 14;
        heldVShift = 0;
        heldHShift = -8;
        heldBulletDist = 16;
        if(dualGuns)
        {
            heldDist = 20;
            heldHShift = 0;
            heldVShift = 5;
            heldBulletDist = 8;
        }
    break;
        
    case GUN_TYPE_ASSAULTRIFLE:
    case GUN_TYPE_RIFLE:
    case GUN_TYPE_MUSKET:
    case GUN_TYPE_HUNTINGRIFLE:
    case GUN_TYPE_TRANQRIFLE:
    case GUN_TYPE_SNIPERRIFLE:
    case GUN_TYPE_CROSSBOW:
        heldDist = 22;
        heldVShift = 1;
        heldHShift = -8;
        heldBulletDist = 16;
        if(dualGuns)
        {
            heldDist = 19;
            heldHShift = 0;
            heldVShift = 6;
            heldBulletDist = 8;
        }
        break;
        
    case GUN_TYPE_SHOTGUN:
    case GUN_TYPE_DOUBLESHOTGUN:
    case GUN_TYPE_ELEPHANTGUN:
    case GUN_TYPE_FLAMETHROWER:
        heldDist = 14;
        heldVShift = 0;
        heldHShift = -8;
        heldBulletDist = 16;
        if(dualGuns)
        {
            heldDist = 19;
            heldHShift = 0;
            heldVShift = 5;
            heldBulletDist = 8;
        }
        break;
        
    case GUN_TYPE_REVOLVERSHOTGUN:
        heldDist = 18;
        heldVShift = 2;
        heldHShift = -8;
        heldBulletDist = 16;
        if(dualGuns)
        {
            heldDist = 24;
            heldHShift = 0;
            heldVShift = 5;
            heldBulletDist = 8;
        }
        break;
        
    ////rocket launchers are on the shoulder.
    case GUN_TYPE_ROCKET:
        heldDist = 16;
        heldVShift = 12;
        heldHShift = 8;
        heldBulletDist = 20;
        if(dualGuns)
        {
            heldDist = 20;
            heldHShift = 0;
            heldVShift = 6;
            heldBulletDist = 8;
        }
        break;
        
    case GUN_TYPE_MACHINEPISTOL:
    case GUN_TYPE_SUBMACHINEGUN:
    case GUN_TYPE_REVOLVER:
    case GUN_TYPE_PISTOL:
    case GUN_TYPE_MAGNUM:
    case GUN_TYPE_FLINTLOCK:
        heldDist = 17;
        heldHShift = 0;
        heldVShift = 5;
        heldBulletDist = 8;
    break;
    
    case GUN_TYPE_FLAREGUN:
        heldDist = 17;
        heldHShift = 0;
        heldVShift = 6;
        heldBulletDist = 8;
        if(dualGuns)
        {
            heldDist = 17;
            heldHShift = 0;
            heldVShift = 5;
            heldBulletDist = 8;
        }
    break;
    
     case GUN_TYPE_BFG:
        heldDist = 0;//-4;
        heldVShift = 3;
        heldHShift = -12;
        heldBulletDist = 16;
        if(dualGuns)
        {
            heldDist = 14;
            heldHShift = 0;
            heldVShift = 5;
            heldBulletDist = 8;
        }
        break;
    
    default:
        heldDist = 12;
        heldHShift = 0;
        heldVShift = 0;
        heldBulletDist = 8;
        break;
}



heldBullet_YShift = -5;

switch(_type)
{
    ////heavy weapons are held low and close, to a side
    case GUN_TYPE_HEAVYMACHINEGUN:  heldBullet_YShift = 0; heldBulletDist = 12; break; // -4
    case GUN_TYPE_GATLINGGUN:       heldBullet_YShift = -2; heldBulletDist = 26; break; // -10
    case GUN_TYPE_MINIGUN:          heldBullet_YShift = 0; heldBulletDist = 28; break; // -4
    case GUN_TYPE_MITRAILLEUSE:     heldBullet_YShift = -2; heldBulletDist = 16; break; // -10
    case GUN_TYPE_BFG:              heldBullet_YShift = -2; heldBulletDist = 26; break; // -10
        
    ////Rifles are held high and close, almost centered
    case GUN_TYPE_ASSAULTRIFLE:     heldBullet_YShift = 4; heldBulletDist = 8; break;
    case GUN_TYPE_RIFLE:            heldBullet_YShift = 6; heldBulletDist = 13; break;
    case GUN_TYPE_MUSKET:           heldBullet_YShift = 6; heldBulletDist = 16; break;
    case GUN_TYPE_HUNTINGRIFLE:     heldBullet_YShift = 8; heldBulletDist = 14; break;
    case GUN_TYPE_TRANQRIFLE:       heldBullet_YShift = 8; heldBulletDist = 14; break;
    case GUN_TYPE_SNIPERRIFLE:      heldBullet_YShift = 8; heldBulletDist = 14; break;
    case GUN_TYPE_CROSSBOW:         heldBullet_YShift = 8; heldBulletDist = 8; break;
        
    ////shotguns are held somewhat low and close, a little to a side.
    case GUN_TYPE_SHOTGUN:          heldBullet_YShift = 2; heldBulletDist = 12; break;
    case GUN_TYPE_DOUBLESHOTGUN:    heldBullet_YShift = 0; heldBulletDist = 14; break;
    case GUN_TYPE_REVOLVERSHOTGUN:  heldBullet_YShift = 2; heldBulletDist = 8; break;
    case GUN_TYPE_ELEPHANTGUN:      heldBullet_YShift = 0; heldBulletDist = 14; break;
    
    case GUN_TYPE_FLAMETHROWER:     heldBullet_YShift = 0; heldBulletDist = 12; break;
        
    ////rocket launchers are on the shoulder. - was 12 - 12 but that was too high and borked it
    case GUN_TYPE_ROCKET:           heldBullet_YShift = 10; heldBulletDist = 4; break;
        
    case GUN_TYPE_MACHINEPISTOL:    heldBullet_YShift = 4; heldBulletDist = 12; break;
    case GUN_TYPE_SUBMACHINEGUN:    heldBullet_YShift = 4; heldBulletDist = 10; break;
    case GUN_TYPE_REVOLVER:         heldBullet_YShift = 4; heldBulletDist = 14; break;
    case GUN_TYPE_PISTOL:           heldBullet_YShift = 5; heldBulletDist = 12; break;
    case GUN_TYPE_MAGNUM:           heldBullet_YShift = 4; heldBulletDist = 16; break;
    case GUN_TYPE_FLINTLOCK:        heldBullet_YShift = 4; heldBulletDist = 14; break;
    
    case GUN_TYPE_FLAREGUN:         heldBullet_YShift = 8; heldBulletDist = 10; break;
}


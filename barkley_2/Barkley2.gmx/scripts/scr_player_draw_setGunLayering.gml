///scr_player_draw_setGunLayering(gunType)

switch(argument0)
{
    case GUN_TYPE_PISTOL:
    case GUN_TYPE_FLINTLOCK:
    case GUN_TYPE_MACHINEPISTOL:
    case GUN_TYPE_REVOLVER:
    case GUN_TYPE_MAGNUM:
    case GUN_TYPE_FLAREGUN:
    case GUN_TYPE_SUBMACHINEGUN:
    case "Dual":
        aArmDepth[0] = 1;
        aArmDepth[1] = 1;
        aArmDepth[2] = 1;
        aArmDepth[3] = 1;
        aArmDepth[4] = 1;
        aArmDepth[5] = 1;
        aArmDepth[6] = 1;
        aArmDepth[7] = 1;
        aArmDepth[8] = 1;
        aArmDepth[9] = 0;
        aArmDepth[10] = 0;
        aArmDepth[11] = 0;
        aArmDepth[12] = 0;
        aArmDepth[13] = 0;
        aArmDepth[14] = 0;
        aArmDepth[15] = 0;
        
        if(BodySwap() == "diaper")
        {
            aArmDepth[0] = 0;
            aArmDepth[1] = 0;
            aArmDepth[2] = 0;
            aArmDepth[3] = 0;
            aArmDepth[4] = 1;
            aArmDepth[5] = 0;
            aArmDepth[6] = 0;
            aArmDepth[7] = 0;
            aArmDepth[8] = 0;
            aArmDepth[9] = 0;
            aArmDepth[10] = 0;
            aArmDepth[11] = 0;
            aArmDepth[12] = 0;
            aArmDepth[13] = 0;
            aArmDepth[14] = 0;
            aArmDepth[15] = 0;
        }
        
        break;
        
    case GUN_TYPE_FLAMETHROWER:
        aArmDepth[0] = 1;
        aArmDepth[1] = 1;
        aArmDepth[2] = 1;
        aArmDepth[3] = 1;
        aArmDepth[4] = 1;
        aArmDepth[5] = 1;
        aArmDepth[6] = 1;
        aArmDepth[7] = 1;
        aArmDepth[8] = 0;
        aArmDepth[9] = 0;
        aArmDepth[10] = 0;
        aArmDepth[11] = 0;
        aArmDepth[12] = 0;
        aArmDepth[13] = 0;
        aArmDepth[14] = 0;
        aArmDepth[15] = 0;
        break;
        
    case GUN_TYPE_HEAVYMACHINEGUN:
    case GUN_TYPE_GATLINGGUN:
    case GUN_TYPE_MINIGUN:
    case GUN_TYPE_MITRAILLEUSE:
        aArmDepth[0] = 0;
        aArmDepth[1] = 0;
        aArmDepth[2] = 0;
        aArmDepth[3] = 0;
        aArmDepth[4] = 1;
        aArmDepth[5] = 1;
        aArmDepth[6] = 1;
        aArmDepth[7] = 1;
        aArmDepth[8] = 2; //1
        aArmDepth[9] = 2; //1
        aArmDepth[10] = 2; //1
        aArmDepth[11] = 2; //1
        aArmDepth[12] = 0;
        aArmDepth[13] = 0;
        aArmDepth[14] = 0;
        aArmDepth[15] = 0;
        break;
        

    case GUN_TYPE_ASSAULTRIFLE:
    case GUN_TYPE_RIFLE:
    case GUN_TYPE_MUSKET:
    case GUN_TYPE_HUNTINGRIFLE:
    case GUN_TYPE_TRANQRIFLE:
    case GUN_TYPE_SNIPERRIFLE:
    case GUN_TYPE_CROSSBOW:
        aArmDepth[0] = 0;
        aArmDepth[1] = 0;
        aArmDepth[2] = 0;
        aArmDepth[3] = 0;
        aArmDepth[4] = 1;
        aArmDepth[5] = 1;
        aArmDepth[6] = 1;
        aArmDepth[7] = 1;
        aArmDepth[8] = 2; //1
        aArmDepth[9] = 2; //1
        aArmDepth[10] = 2; //1
        aArmDepth[11] = 2; //1
        aArmDepth[12] = 0;
        aArmDepth[13] = 0;
        aArmDepth[14] = 0;
        aArmDepth[15] = 0;
        break;
        
    ////shotguns are held somewhat low and close, a little to a side.
    case GUN_TYPE_SHOTGUN:
    case GUN_TYPE_DOUBLESHOTGUN:
    case GUN_TYPE_REVOLVERSHOTGUN:
    case GUN_TYPE_ELEPHANTGUN:
        aArmDepth[0] = 0;
        aArmDepth[1] = 0;
        aArmDepth[2] = 0;
        aArmDepth[3] = 0;
        aArmDepth[4] = 0;
        aArmDepth[5] = 1;
        aArmDepth[6] = 1;
        aArmDepth[7] = 1;
        aArmDepth[8] = 2; //1
        aArmDepth[9] = 2; //1
        aArmDepth[10] = 2; //1
        aArmDepth[11] = 2; //1
        aArmDepth[12] = 0; //0;
        aArmDepth[13] = 0; //0;
        aArmDepth[14] = 0; //0;
        aArmDepth[15] = 0; //0;
        break;
        
    ////rocket launchers are on the shoulder.
    case GUN_TYPE_ROCKET:
        aArmDepth[0] = 1;
        aArmDepth[1] = 1;
        aArmDepth[2] = 1;
        aArmDepth[3] = 1;
        aArmDepth[4] = 0;
        aArmDepth[5] = 0;
        aArmDepth[6] = 0;
        aArmDepth[7] = 0;
        aArmDepth[8] = 0;
        aArmDepth[9] = 0;
        aArmDepth[10] = 0;
        aArmDepth[11] = 0;
        aArmDepth[12] = 0;
        aArmDepth[13] = 1;
        aArmDepth[14] = 1;
        aArmDepth[15] = 1;
        break;
        
    default:
        aArmDepth[0] = 0;
        aArmDepth[1] = 0;
        aArmDepth[2] = 0;
        aArmDepth[3] = 0;
        aArmDepth[4] = 1;
        aArmDepth[5] = 1;
        aArmDepth[6] = 1;
        aArmDepth[7] = 1;
        aArmDepth[8] = 1;
        aArmDepth[9] = 1;
        aArmDepth[10] = 1;
        aArmDepth[11] = 1;
        aArmDepth[12] = 0;
        aArmDepth[13] = 0;
        aArmDepth[14] = 0;
        aArmDepth[15] = 0;
        break;
}

///combat_gunwield_drawGun_player_backHand(gun, dx, dy)
///Draw the front portion of a weapon. (The weapon itself)

var gun = argument0;
var dx  = argument1;
var dy  = argument2;

var backSpr = noone;

var wtype = gun[? "pType"]
var wmat = gun[? "pMaterial"];
switch(wtype)
{
        case GUN_TYPE_REVOLVER:
        case GUN_TYPE_PISTOL:
        case GUN_TYPE_FLINTLOCK:
        case GUN_TYPE_FLAREGUN:
        case GUN_TYPE_MAGNUM:
        case GUN_TYPE_SUBMACHINEGUN:
        case GUN_TYPE_MACHINEPISTOL:
        {
            backSpr = s_HoopzTorso_Handgun_Back;
            if (BodySwap() == "diaper") backSpr = s_HoopzDiaperTorso_Handgun_Back;
            break;
        }

        case GUN_TYPE_HEAVYMACHINEGUN:
        case GUN_TYPE_ASSAULTRIFLE:
        case GUN_TYPE_RIFLE:
        case GUN_TYPE_MUSKET:
        case GUN_TYPE_HUNTINGRIFLE:
        case GUN_TYPE_TRANQRIFLE:
        case GUN_TYPE_SHOTGUN:
        case GUN_TYPE_DOUBLESHOTGUN:
        case GUN_TYPE_REVOLVERSHOTGUN:
        case GUN_TYPE_ELEPHANTGUN:
        case GUN_TYPE_FLAMETHROWER:
        case GUN_TYPE_CROSSBOW:
        case GUN_TYPE_SNIPERRIFLE:
            backSpr = s_HoopzTorso_Rifle_Back;
            break;
            
        case GUN_TYPE_ROCKET:
            backSpr = s_HoopzTorso_Rocket_Back;
            break;
            
        case GUN_TYPE_GATLINGGUN:
        case GUN_TYPE_MINIGUN:
        case GUN_TYPE_MITRAILLEUSE:
        case GUN_TYPE_BFG:
            backSpr = noone;
            break;
}

if(wmat=="Dual")
{
    backSpr = s_HoopzTorso_Dualguns_Back;
}


if(backSpr != noone)
{
    scr_draw_spr(backSpr,aiming,dx,dy);
}

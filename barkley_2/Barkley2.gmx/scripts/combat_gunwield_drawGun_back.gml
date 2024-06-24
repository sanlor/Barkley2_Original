///combat_gunwield_drawGun_back(gun, dx, dy)
///Draw the back portion of a weapon. (Flamethrower tank, crossbow bolt quiver, etc)

///combat_gunwield_drawGun_back()
///Draw the front portion of a weapon. (The weapon itself)

var gun = argument0;
var dx  = argument1;
var dy  = argument2;
    
var wtype = gun[? "pType"]
var heldDist = 12;
var heldHShift = 0;
var heldVShift = 0;
var gunImg = assetOrNull(gun[? "gunHeldSprite"], asset_sprite);
var displayIt = false;
////handguns are held far and centered.


switch(wtype)
{
    ////Crossbows put a quiver on your back
    case GUN_TYPE_CROSSBOW:
        heldDist = -8;
        heldVShift = 4;
        break;
        
    ////Flamethrowers and napalm guns put a napalm tank on your back
    case GUN_TYPE_FLAMETHROWER:
        heldDist = -10;
        heldVShift = 4;
        gunImg = s_Flamethrower_Tank;
        displayIt = true;
        break;
}

if(displayIt)
{
    dir = aiming*22.5 
    distx = lengthdir_x(heldDist,dir);
    disty = lengthdir_y(heldDist,dir);
    xhshift = lengthdir_x(heldHShift,dir+90);
    yhshift = lengthdir_y(heldHShift,dir+90);
    col = gun[? "gunheldcol1"];
    
    var render_x = dx + round(buckx+distx+xhshift);
    var render_y = dy + round(bucky+disty - ARMS_HEIGHT-heldVShift+yhshift);
    
    draw_sprite_ext(gunImg,aiming,render_x,render_y,1,1,0,col,1);
    
    if (gun[? "pChargeRatio"] >= 1) {
        // Flash if charged
        draw_set_blend_mode(bm_add);
        d3d_set_fog(true, col, 0, 0);
        var alpha = max(abs(sin(current_time / 30)) - 0.3, 0) * 0.6;
        draw_sprite_ext(gunImg,aiming,render_x-1,render_y,1,1,0,col,alpha);
        draw_sprite_ext(gunImg,aiming,render_x+1,render_y,1,1,0,col,alpha);
        draw_sprite_ext(gunImg,aiming,render_x,render_y-1,1,1,0,col,alpha);
        draw_sprite_ext(gunImg,aiming,render_x,render_y+1,1,1,0,col,alpha);
        d3d_set_fog(false, c_white, 0, 0);
        draw_set_blend_mode(bm_normal);
    }
}

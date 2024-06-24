///combat_gunwield_drawGun(gun, dx, dy)
///Draw the front portion of a weapon. (The weapon itself)

var gun = argument0;
var dx  = argument1;
var dy  = argument2;

draw_set_color(gun[? "gunheldcol1"]);

heldDist = 12;
heldHShift = 0;
heldVShift = 0;
var gunImg = assetOrNull(gun[? "gunHeldSprite"], asset_sprite);
var displayIt = true;
var col = c_white;
var col2 = gun[? "gunheldcol2"];
var col3 = gun[? "gunheldcol3"];
var alph = gun[? "gunHeldSprite2Alpha"];
////handguns are held far and centered.

var wtype = gun[? "pType"]
var wmat = gun[? "pMaterial"];

scr_player_getGunShifts(wtype,wmat=="Dual");

/*
if(wmat=="Dual")
{
    heldDist = 17;
    heldHShift = 0;
    heldVShift = 5;
    heldBulletDist = 8;
}*/

var anm = gun[? "pWindUp"];

heldgun_Anim = heldgun_Anim + (anm/50)*dt();
if(heldgun_Anim>10000){heldgun_Anim=1;}

var gunOverlay = gun[? "gunHeldSprite2"];
var gunOverlay2 = gun[? "gunHeldSprite3"];


var cosmicShader = false;
var cosmObj = noone;
if(wmat == "Anti-Matter")
{
    if(!instance_exists(o_cosmicholeController)){cosmObj = instance_create(0,0,o_cosmicholeController);}
    else{cosmObj = o_cosmicholeController.id;}
    cosmObj.stickAround = 10;
    cosmicShader = true;
}

if(gunImg == s_BFG)
{
    if(gun[? "pFireTimer"]< gun[? "pFireTimerTarget"]*0.95 && gun[? "pFireTimer"]> gun[? "pFireTimerTarget"]*0.1)
    {
        gunImg = s_BFG_cooling;
    }
}

if(gunImg == s_Magnum)
{
    if(gun[? "pFireTimer"]< gun[? "pFireTimerTarget"]*0.9 && gun[? "pFireTimer"]> gun[? "pFireTimerTarget"]*0.4)
    {
        gunImg = s_Magnum_Anim;
    }
}

if(gunImg == s_RevShotgun)
{
    if(gun[? "pFireTimer"]< gun[? "pFireTimerTarget"]*0.9 && gun[? "pFireTimer"]> gun[? "pFireTimerTarget"]*0.4)
    {
        gunImg = s_RevShotgun_Anim;
    }
}

if(gunImg == s_GatlingGun)
{
    if(floor(heldgun_Anim) mod 2 == 1)
    {
        gunImg = s_GatlingGun_Anim;
    }
}

if(gunImg == s_Minigun)
{
    if(floor(heldgun_Anim) mod 2 == 1)
    {
        gunImg = s_Minigun_Anim;
    }
}

if(cosmicShader)
{
    shader_set(shader_paintimage);
    with(cosmObj){event_user(0);}
}
    
if(displayIt)
{
    if(wmat == "Dual"){if(abs(heldHShift)<6){heldHShift = 8;}}
    
    dir = aiming*22.5 
    distx = lengthdir_x(heldDist,dir);
    disty = lengthdir_y(heldDist,dir)*0.75;
    xhshift = lengthdir_x(heldHShift,dir+90);
    yhshift = lengthdir_y(heldHShift,dir+90)*0.75;
    col = gun[? "gunheldcol1"];
    
    var render_x = dx + round(buckx+distx+xhshift);
    var render_y = dy + round(bucky+disty - ARMS_HEIGHT-heldVShift+yhshift);
    
    draw_sprite_ext(gunImg,aiming,render_x,render_y,1,1,0,col,1);
                    
    if (gun[? "pChargeRatio"] >= 1) {
        // Flash if charged
        draw_set_blend_mode(bm_add);
        d3d_set_fog(true, col, 0, 0);
        var alpha = max(abs(sin(global.DELTA_TOTAL / 30)) - 0.3, 0) * 0.6;
        draw_sprite_ext(gunImg,aiming,render_x-1,render_y,1,1,0,col,alpha);
        draw_sprite_ext(gunImg,aiming,render_x+1,render_y,1,1,0,col,alpha);
        draw_sprite_ext(gunImg,aiming,render_x,render_y-1,1,1,0,col,alpha);
        draw_sprite_ext(gunImg,aiming,render_x,render_y+1,1,1,0,col,alpha);
        d3d_set_fog(false, c_white, 0, 0);
        draw_set_blend_mode(bm_normal);
    }    
    
    if(wmat == "Dual")
    {
        xhshift = lengthdir_x(heldHShift,dir-90);
        yhshift = lengthdir_y(heldHShift,dir-90)*0.75;
        var render_x = dx + round(buckx+distx+xhshift);
        var render_y = dy + round(bucky+disty - ARMS_HEIGHT-heldVShift+yhshift);
    
        draw_sprite_ext(gunImg,aiming,render_x,render_y,1,1,0,col,1);
                    
        if (gun[? "pChargeRatio"] >= 1) {
            // Flash if charged
            draw_set_blend_mode(bm_add);
            d3d_set_fog(true, col, 0, 0);
            var alpha = max(abs(sin(global.DELTA_TOTAL / 30)) - 0.3, 0) * 0.6;
            draw_sprite_ext(gunImg,aiming,render_x-1,render_y,1,1,0,col,alpha);
            draw_sprite_ext(gunImg,aiming,render_x+1,render_y,1,1,0,col,alpha);
            draw_sprite_ext(gunImg,aiming,render_x,render_y-1,1,1,0,col,alpha);
            draw_sprite_ext(gunImg,aiming,render_x,render_y+1,1,1,0,col,alpha);
            d3d_set_fog(false, c_white, 0, 0);
            draw_set_blend_mode(bm_normal);
        }   
    }
    
    if(gunOverlay != "")
    {
        gunOverlay = asset_get_index(gunOverlay);
        draw_sprite_ext(gunOverlay,aiming,render_x,render_y,1,1,0,col2,alph);
    }
    
    if(gunOverlay2 != "")
    {
        gunOverlay2 = asset_get_index(gunOverlay2);
        draw_sprite_ext(gunOverlay2,aiming,render_x,render_y,1,1,0,col3,alph);
    }
}

if(cosmicShader)
{
    shader_reset();
}

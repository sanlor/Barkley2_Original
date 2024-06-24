// Draw legs

var current = scr_statusEffect_getFromCombatActor(id, statusEffect_wading);
var swimmove = 0;
if(current > 0)
{
    swimmove = ds_map_find_value(current, "wadingDepthCurrent");
}

var weap = scr_player_equip("object");
var wtype = "";
if (weap != NULL)
{
    wtype = weap[? "pType"];
    wmat = weap[? "pMaterial"];
}

if(wmat == "Dual"){scr_player_draw_setGunLayering("Dual");}
else{scr_player_draw_setGunLayering(wtype);}

if (weap != NULL && assetOrNull(weap[? "gunHeldSprite"], asset_sprite) != NULL)
{
        if (aArmDepth[aiming] == 0)
        {
            combat_gunwield_drawGun_back(weap, dx, dy - round(yoff) + swimmove);
        }
        else if (aArmDepth[aiming] == 1)
        {
            combat_gunwield_drawGun_player_backHand(weap, dx, dy - round(yoff) + swimmove);
            if(wmat!= "Imaginary"){combat_gunwield_drawGun(weap, dx, dy - round(yoff) + swimmove);}
            combat_gunwield_drawGun_player_frontHand(weap, dx, dy - round(yoff) + swimmove);
        }
        else if (aArmDepth[aiming] == 2)
        {
            combat_gunwield_drawGun_player_backHand(weap, dx, dy - round(yoff) + swimmove);
            if(wmat!= "Imaginary"){combat_gunwield_drawGun(weap, dx, dy - round(yoff) + swimmove);}
            //combat_gunwield_drawGun_player_frontHand(weap, dx, dy - round(yoff) + swimmove);
        }
}

legSpr = s_HoopzLegs;
if (BodySwap() == "diaper") legSpr = s_HoopzDiaperLegs;

if(swimmove == 0)
{
    if (move_dist == 0 and shuffle <= 0) scr_draw_spr(legSpr, facing, dx, dy);
    else
    {
        if (BodySwap() == "diaper") scr_draw_spr(dLegsS[legdir], scr_entity_animation_getImage("default"), dx, dy);
        else scr_draw_spr(aLegsS[legdir], scr_entity_animation_getImage("default"), dx, dy);
    }
}
else if (swimmove <= 10) 
{
    if (move_dist == 0 and shuffle <= 0)
        draw_sprite_part_ext(legSpr,facing,
                             0, 0, 44, 41 - swimmove,
                             dx-22, dy-41 + swimmove,
                             1, 1, image_blend, image_alpha);
    else
    {
        if (BodySwap() == "diaper")
        {
            draw_sprite_part_ext(dLegsS[legdir],scr_entity_animation_getImage("default"),
                             0, 0, 44, 41 - swimmove,
                             dx-22, dy-41 + swimmove,
                             1, 1, image_blend, image_alpha);
        }
        else
        {
            draw_sprite_part_ext(aLegsS[legdir],scr_entity_animation_getImage("default"),
                             0, 0, 44, 41 - swimmove,
                             dx-22, dy-41 + swimmove,
                             1, 1, image_blend, image_alpha);
        }
    }
}

torsoSpr = s_HoopzTorso_Armless;
if (BodySwap() == "diaper") torsoSpr = s_HoopzDiaperTorso_Armless;

// Draw torso
scr_draw_spr(torsoSpr,aiming,dx,dy - yoff+swimmove);

if (weap != NULL && assetOrNull(weap[? "gunHeldSprite"], asset_sprite) != NULL)
{
    if (aArmDepth[aiming] == 0)
    {
        combat_gunwield_drawGun_player_backHand(weap, dx, dy - round(yoff) + swimmove);
        if(wmat!= "Imaginary"){combat_gunwield_drawGun(weap, dx, dy - round(yoff) + swimmove);}
        combat_gunwield_drawGun_player_frontHand(weap, dx, dy - round(yoff) + swimmove);
    }
    else if (aArmDepth[aiming] == 1)
    {
        combat_gunwield_drawGun_back(weap, dx, dy - round(yoff) + swimmove);
    }
    else if (aArmDepth[aiming] == 2)
    {
        combat_gunwield_drawGun_player_frontHand(weap, dx, dy - round(yoff) + swimmove);
    }
}

//Draw the Rifle Aiming Line moved to own object because status effect / doRenderSurface blocks it's draw

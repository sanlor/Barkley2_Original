/// CinemaFusion
if (argument[0] == "setup")
{
    // DNA - Affix
    dnaFrm = 0;
    
    // Meter - Firepower
    minPow = 0;
    meterImg = 0;
    meterMinsize = 0;
    meterRandsize = 0;
    delayRand = 0;
    randDmg = 0;
    meterCatchup = 0;
    meterSize = 0;
    meterSpd = 0.1;
    // Firespeed
    wavefrm = 0;
    meterfrm = 0;
    waveSpd = 0.1;
    
    // Ammo - gun[? "pType"] - gun[? "pMaxAmmo"]
    barsfrm = 0;
    textfrm = 0;
    bulletType = 0;
    bullets = 0;
    bulletsFrmMax = 0;
    
    
    exit;
    minPow = gun[? "pDamageMin"];
    var randpow = gun[? "pDamageRand"];
    
    meterSpd = 0.01;
    meterMinsize = minPow / 100 * 70;
    meterRandsize = randpow*2 / 100 * 70;
}
else if (argument[0] == "draw dna") // 0 = dna, 1 = x, 2 = y, 3 = affix, 4 = flip
{
    var dnaSpd = 0.06 / 100 * argument[3];
    var flp = argument[4];
    var drx = argument[1];
    var dry = argument[2];
    dnaFrm += dnaSpd * dt();
    if (flp == 2)
    {
        flp -= 2;
        draw_sprite_ext(spr_breedanm_dnaPanel, 1, drx, dry + (51 * flp), 1, 1 - (flp * 2), 0, c_white, draw_get_alpha());
        draw_sprite_ext(spr_breedanm_dnaAnim, dnaFrm, drx + 3, dry + 1 + (39 * flp), 1, 1 - (flp * 2), 0, c_white, draw_get_alpha());
    }
    else
    {
        draw_sprite_ext(spr_breedanm_dnaPanel, 0, drx, dry + (51 * flp), 1, 1 - (flp * 2), 0, c_white, draw_get_alpha());
        draw_sprite_ext(spr_breedanm_dnaAnim, dnaFrm, drx + 3, dry + 6 + (39 * flp), 1, 1 - (flp * 2), 0, c_white, draw_get_alpha());
    }
}
else if (argument[0] == "draw firepower") // 0 = firepower, 1 = x, 2 = y, 3 = damage, 4 = variance, 5 = flip
{
    var drx = argument[1];
    var dry = argument[2];
    var minPow = argument[3];
    var randpow = argument[4];
    var flp = argument[5];
    
    
    meterMinsize = minPow / 100 * 70;
    meterRandsize = randpow*2 / 100 * 70;
    
    if (delayRand > 0) delayRand -= 0.05 * dt();
    else { randDmg = random(meterRandsize); delayRand = 2; }
    if (meterImg < 9) meterImg += 0.02 * dt();
    if (meterSize < meterMinsize) meterSize += meterSpd * dt();
    if (meterSpd < minPow / 500) meterSpd += 0.05;
    var meterTo = median(0, 80, meterSize + randDmg);
    if (meterCatchup + 1 < meterTo) meterCatchup += 1;
    else if (meterCatchup - 1 > meterTo) meterCatchup -= 1;
    else meterCatchup = meterTo;
    ///// DRAW
    var rot = 0;
    if (flp > 1) 
    { 
        rot = 90;
        draw_set_color(make_color_rgb(20, 0, 35));
        scr_drawRect(drx + 1, dry - 2, drx + 88, dry - 25, 1);
        draw_set_color(c_white);
        scr_drawRect(drx + 1, dry - 2, drx + 88, dry - 25, 1);
        draw_sprite_general(sCinemaFirepower, 0, 0, 0, 19, abs(81 - (81 - (meterCatchup div 2 * 2))), drx + 4, dry - 4, 1, 1, rot, c_white, c_white, c_white, c_white, draw_get_alpha());
        draw_sprite_ext(spr_breedanm_firepowpan_tx, meterImg, drx + 3, dry - 2, 1, 1, rot, c_white, draw_get_alpha());
    }
    else if (flp)
    {
        draw_sprite_ext(spr_breedanm_firepowpan, 0, drx, dry + 89, 1, -1, 0, c_white, draw_get_alpha());
        draw_set_color(make_color_rgb(20, 0, 35)); //make_color_rgb(40, 17, 36));
        scr_drawRect(drx + 4, dry + 4, drx + 4 + 19, dry + 5 + 80 - (meterCatchup div 2 * 2), false);
        draw_sprite(spr_breedanm_firepowpan_tx, meterImg, drx + 2, dry + 73);
    }
    else
    {
        draw_sprite_ext(spr_breedanm_firepowpan, 0, drx, dry, 1, 1, 0, c_white, draw_get_alpha());
        draw_set_color(make_color_rgb(20, 0, 35)); //make_color_rgb(40, 17, 36));
        scr_drawRect(drx + 4, dry + 5 + (meterCatchup div 2 * 2), drx + 4 + 19, dry + 5 + 80, false);
        draw_sprite(spr_breedanm_firepowpan_tx, meterImg, drx + 2, dry + 3);
    }
}
else if (argument[0] == "draw speed") // 0 = speed, 1 = x, 2 = y, 3 = firespeed
{
    var drx = argument[1];
    var dry = argument[2];
    waveSpd = argument[3] / 100 * 0.1;
    wavefrm += waveSpd * dt();
    if (wavefrm > 12) wavefrm -= 5;
    if (meterfrm < 15) meterfrm += 0.02 * dt();
    draw_sprite(spr_breedanm_firespd, wavefrm, drx + 2, dry + 11);
    draw_sprite(spr_breedanm_firespd_ovr, meterfrm, drx, dry);
}
else if (argument[0] == "draw ammo") // 1 = x, 2 = y, 3 = type, 4 = 
{
    var drx = argument[1];
    var dry = argument[2];
    
    bulletType = GunType(argument[3]);
    bullets = argument[4];
    if(bullets<4){bulletFrmMax = 2;}
    else if(bullets<8){bulletFrmMax = 3;}
    else if(bullets<16){bulletFrmMax = 4;}
    else if(bullets<24){bulletsFrmMax = 5;}
    else if(bullets<32){bulletsFrmMax = 6;}
    else if(bullets<48){bulletsFrmMax = 7;}
    else if(bullets<64){bulletsFrmMax = 8;}
    else if(bullets<80){bulletsFrmMax = 9;}
    else if(bullets<120){bulletsFrmMax = 10;}
    else if(bullets<180){bulletsFrmMax = 11;}
    else if(bullets<240){bulletsFrmMax = 12;}
    else if(bullets<320){bulletsFrmMax = 13;}
    else{bulletsFrmMax = 14;}
    
    // Step
    if(barsfrm<bulletsFrmMax){barsfrm+=0.02*dt();}
    if(textfrm<9){textfrm+=0.03*dt();}
    
    // Draw
    draw_set_color(make_color_rgb(20,0,35));
    scr_drawRect(drx+1,dry+1,drx+35,dry+26,false);
    draw_sprite(spr_breedanm_bulletpan,textfrm,drx,dry);
    draw_sprite(spr_breedanm_bulletType,bulletType,drx,dry);
    draw_sprite(spr_breedanm_bulletbars,barsfrm,drx+2,dry+2);
}
else if (argument[0] == "draw type")
{
    var drx = argument[1];
    var dry = argument[2];
    var flp = argument[4];
    showType = GunType(argument[3]);
    if (textfrm < 20) textfrm += 0.03 * dt();
    if (flp)
    {
        draw_sprite(spr_breedanm_typepan_text,textfrm,drx,dry+2);
        draw_sprite(spr_breedanm_typepan_type,showType,drx,dry+30);
    }
    else
    {
        draw_sprite(spr_breedanm_typepan_text,textfrm,drx,dry+17);
        draw_sprite(spr_breedanm_typepan_type,showType,drx,dry);
    }
}

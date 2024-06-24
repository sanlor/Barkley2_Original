/// EffectCloud("draw", x, y, width, height, alpha)
var i;
if (argument[0] == "init")
{
    clouds = 12;
    for (i = 0; i < clouds; i += 1) EffectCloud("new", i);
}
else if (argument[0] == "new")
{
    i = argument[1];
    len = random(24);
    dir = random(360);
    cloudX[i] = lengthdir_x(len * 0.66, dir);
    cloudY[i] = lengthdir_y(len * 0.66, dir); //1.00

    cloudXScl[i] = (0.4 + random(0.1)) * .66;
    cloudYScl[i] = (0.4 + random(0.1)) * .66;
    
    cloudAlpDir[i] = 180;
    cloudAlpDirSpd[i] = (1 + random(2)) * choose(1, -1);
    cloudAlp[i] = lengthdir_y(1, cloudAlpDir[i]);
    
    cloudCol[i] = c_cosmic;
    cloudRot[i] = -5 + random(10);
    cloudRotSpd[i] = -1 + random(2);
    
    cloudDir[i] = point_direction(cloudX[i], cloudY[i], 0, 0) - 45 + random(90);
    cloudSpd[i] = .1 + random(.1);
}
// EffectCloud("draw", 1 = x, 2 = y, 3 = width, 4 = height, 5 = alpha, 6 = color?)
else if (argument[0] == "draw") 
{
    var clx = argument[1];
    var cly = argument[2];
    var clw = (1 / 16) * argument[3];
    var clh = (1 / 20) * argument[4];
    var cls = dt() * 20;
    var alpha = argument[5];
    var color = c_cosmic;
    if (argument_count > 6) var color = argument[6];
    clw *= 0.66; 
    clh *= 0.66;
    draw_set_blend_mode(bm_add);
    draw_set_colour_write_enable(1, 1, 1, 0);
    for (i = 0; i < clouds; i += 1)
    {
        draw_sprite_ext(sBioRainCloud3, floor(random(4)), clx + (cloudX[i] * clw), cly + (cloudY[i] * clh), cloudXScl[i] * clw, cloudYScl[i] * clh, cloudRot[i], color, abs(cloudAlp[i] * .66) * alpha);
        if (paused() == 0)
        {
            cloudX[i] += lengthdir_x(cloudSpd[i], cloudDir[i]) * cls;
            cloudY[i] += lengthdir_y(cloudSpd[i], cloudDir[i]) * cls;
            cloudRot[i] += cloudRotSpd[i] * cls;
            
            cloudAlpDir[i] += cloudAlpDirSpd[i] * cls;
            cloudAlp[i] = lengthdir_y(1, cloudAlpDir[i]);
            if (cloudAlpDir[i] >= 360 || cloudAlpDir[i] <= 0) EffectCloud("new", i);
        }
    }
    draw_set_colour_write_enable(1, 1, 1, 1);
    draw_set_blend_mode(bm_normal);
}

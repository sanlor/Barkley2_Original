/// scr_dustcloud_draw(dustcloud, drawX, drawY)

var dustcloud = argument0;
var drawX = argument1;
var drawY = argument2;

var PERSPECTIVE = 70;
var angle = dustcloud[? "angle"];
var tiltSin = dustcloud[? "tiltSin"];
var sprite = dustcloud[? "sprite"];
var particles = dustcloud[? "particles"];


var queue = ds_priority_create();

for (var i = 0; i < ds_list_size(particles); i++) {
    var p = particles[| i];
    var pAngle    = p[| 0];
    var pDist     = p[| 1];
    var pTilt     = p[| 2];
    var pRotMult  = p[| 3];
    var pTiltMult = p[| 4];
    var pImg      = p[| 5];
    var pImgRot   = p[| 6];
    var l1        = p[| 7];
    var l2        = p[| 8];
    
    pAngle += angle * pRotMult;
    var tilt = pTilt * sin(tiltSin * pTiltMult);
    
    var dx, dy, dz;
    dx = cos(degtorad(pAngle)) * sin(degtorad(tilt)) * pDist;
    dy = sin(degtorad(pAngle)) * sin(degtorad(tilt)) * pDist;
    dz = cos(degtorad(tilt)) * pDist;
    
    var dir = point_direction(0,0, dy, dz);
    var dist = point_distance(0,0, dy, dz);
    dir += PERSPECTIVE;
    
    dy = cos(degtorad(dir)) * dist;
    dz = sin(degtorad(dir)) * dist;
    
    l1[| 0] = dx;
    l1[| 1] = dz;
    l1[| 2] = pImg;
    l1[| 3] = pImgRot;
    ds_priority_add(queue, l1, -dy);
    
    l2[| 0] = -dx;
    l2[| 1] = -dz;
    l2[| 2] = pImg;
    l2[| 3] = pImgRot;
    ds_priority_add(queue, l2, dy);
}

while (ds_priority_size(queue) > 0) {
    var list = ds_priority_delete_max(queue);
    draw_sprite_ext(sprite, list[| 2], drawX + list[| 0], drawY + list[| 1], 1, 1, list[| 3], c_white, 1);
}

ds_priority_destroy(queue);

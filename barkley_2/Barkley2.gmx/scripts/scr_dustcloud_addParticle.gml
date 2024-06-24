/// scr_dustcloud_addParticle(dustcloud, dist, tilt, rotation_speed_multiplier, tilt_waverspeed_multiplier, image, image_angle)

var p = ds_list_create();

var dustcloud = argument0;
var dist = argument1;
var tilt = argument2;
var rotmult = argument3;
var tiltmult = argument4;
var img = argument5;
var imgrot = argument6;

p[| 0] = random(360);
p[| 1] = dist;
p[| 2] = tilt;
p[| 3] = rotmult;
p[| 4] = tiltmult;
p[| 5] = img;
p[| 6] = imgrot;
p[| 7] = ds_list_create(); // List used to pass drawing args for front render
p[| 8] = ds_list_create(); // List used to pass drawing args for back render

ds_list_add(dustcloud[? "particles"], p);

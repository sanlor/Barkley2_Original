/// scr_dustcloud_step(dustcloud)

var dustcloud = argument0;

dustcloud[? "angle"] += dt() * 6;
dustcloud[? "tiltSin"] += dt() * .08;

// Jitter particles a bit
//var particles = dustcloud[? "particles"];
//for (var i = 0; i < ds_list_size(particles); i++) {
//    var p = particles[| i];
//    p[| 0] += (random(10) - 5) * dt();
//}

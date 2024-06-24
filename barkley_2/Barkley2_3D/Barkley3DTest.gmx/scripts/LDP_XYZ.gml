///LDP_XYZ not working
//Length, Direction, Pitch
rx = (cos(degtorad(argument1)) * cos(degtorad(argument2)) * argument0);
ry = ((-sin(degtorad(argument1))) * cos(degtorad(argument2)) * argument0);
rz = (sin(degtorad(argument2 - 180)) * argument0);

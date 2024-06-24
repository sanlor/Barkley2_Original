var ball, vx, vy, vz;

ball = argument[0];

vx = abs(ball.vx);
vy = abs(ball.vy);
vz = abs(ball.vz);

return vx < .01 && vy < .01 && vz < .3;

var ball, startX, startY, endX, endY, startZ, endZ, vi;

ball = argument[0];
startX = argument[1];
startY = argument[2];
startZ = argument[3];
endX = argument[4];
endY = argument[5];
endZ = argument[6];

ball.active = false;

vi = 1;

ball.x = startX;
ball.y = startY;
ball.z = startZ;

var pAngle = -1;
var zAngle = -1;

while(pAngle == -1 || zAngle == -1)
{
    pAngle = arctan2(endY - startY, endX - startX);
    zAngle = scr_mg_tactics_ball_calculate2DTrajectory(
        0, startZ, point_distance(startX, startY, endX, endY), endZ, vi);
    
    if(pAngle == -1 || zAngle == -1) { vi+= 0.05; }
}

scr_mg_tactics_ball_stop(ball);

ball.vx = vi * cos(pAngle);
ball.vy = vi * sin(pAngle);
ball.vz = vi * sin(zAngle);

ball.active = true;

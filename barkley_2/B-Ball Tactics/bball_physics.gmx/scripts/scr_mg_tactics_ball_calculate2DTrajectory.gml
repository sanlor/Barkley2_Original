var startX, startY, endX, endY, x1, y1, x2, y2, dx, dy, g, root, vi;

startX = argument[0];
startY = argument[1];
endX = argument[2];
endY = argument[3];
vi = argument[4];

g = -TACTICS_GRAVITY;

x1 = startX / TACTICS_PXPERM;
y1 = startY / TACTICS_PXPERM;
x2 = endX / TACTICS_PXPERM;
y2 = endY / TACTICS_PXPERM;

dx = x2 - x1;
dy = y2 - y1;

var v = vi / TACTICS_PXPERM * 60 /// + ((endY - startY / TACTICS_PXPERM))) * 60;
var root = (v*v*v*v) - (g * (g * (dx*dx) + (2 * (dy) * (v*v))));

if(root < 0) 
{
    return -1;
}
else
{
    return arctan2(((v*v) + sqrt(root)), (g * dx));
}

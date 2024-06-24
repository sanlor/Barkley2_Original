/// Find camera point info
var cam;
with (oCameraPoint)
{
    if (nam == argument0)
    {
        cam = id;
    }
}
camDir = cam.dir;
camPit = cam.pit;
camX = cam.x;
camY = cam.y;
camZ = cam.z;

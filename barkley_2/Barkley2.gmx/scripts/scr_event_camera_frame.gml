///scr_event_camera_frame(object0, object1, ...)
//Throw objects in here
var objs = argument_count;
var hop = 0; //will be 1 if hoopz exists
camX = 0;
camY = 0;
var diaY = 140 / 2; //Threshold of dialog box, don't allow actors below this
for (var i = 0; i < objs; i += 1)
{
    if (argument[i] == o_hoopz) hop = 1;
    if (argument[i] == o_cts_hoopz) hop = 2;
    camX += argument[i].x / objs;
    camY += argument[i].y / objs;
}
camX = round(camX);
camY = round(camY);

//B2 works on centered already
camX = camX - (384 / 2);
camY = camY - (240 / 2);

for (var i = 0; i < objs; i += 1)
{
    //if (argument[i].y + 16 > camY + diaY) camY -= (argument[i].y
}

camY += 30; //Most objects are about 30 high off origin, so do 20

if (hop == 1) //Redo hoopz check if it exists
{
    if (o_hoopz.y + 4 > camY + 140) camY = o_hoopz.y + 4 - 140;
    if (o_hoopz.y - 44 < camY) camY = o_hoopz.y - 44;
}
if (hop == 2) //Redo hoopz check if it exists
{
    if (o_cts_hoopz.y + 4 > camY + 140) camY = o_cts_hoopz.y + 4 - 140;
    if (o_cts_hoopz.y - 44 < camY) camY = o_cts_hoopz.y - 44;
}

//B2 works on centered already, push back
camX = camX + (384 / 2);
camY = camY + (240 / 2);

//camX and camY have the values!
//view_xview[0] = camX;
//view_yview[0] = camY;

//1 Check that the dialogue box is only y - 16 above the InteractiveActor's origin, 
//and that the camera leaves y - 16 space above the top of the sprite.
//2 Then run the same check again for the Hoopz object and sprite, 
//essentially adjusting for him at the end to give him the priority.

/*
Required input vars from step script:
facing
*/

var subimg;
if (facing == 0 or facing == 1) {
    subimg = 6;
}
else if (facing == 2 or facing == 3) {
    subimg = 4;
}
else if (facing == 4 or facing == 5) {
    subimg = 2;
}
else {
    subimg = 0;
}

scr_draw_spr(s_HoopzStagger,subimg,dx,dy);

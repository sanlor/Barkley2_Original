/// draw_spr_tiled(x1,y1,x2,y2,bg,frame,alpha)

x1 = argument0;
x2 = argument2;
y1 = argument1;
y2 = argument3;

frame = argument5;
a = argument6;

w = x2 - x1;
h = y2 - y1;

b_spr = argument4;

b_w = sprite_get_width(b_spr);
b_h = sprite_get_height(b_spr);

iw = floor(w/b_w);
ih = floor(h/b_h);

for(ix=0;ix<iw;ix+=1;)
    for(iy=0;iy<ih;iy+=1;)
        draw_sprite_ext(b_spr,frame,x1+b_w*ix,y1+b_h*iy,1,1,0,c_white,a);
        
if (w/b_w) > iw
    for(iiy=0;iiy<ih;iiy+=1;)
        draw_sprite_part_ext(b_spr,frame,0,0,w mod b_w,b_h,x1+b_w*ix,y1+b_h*iiy,1,1,c_white,a);

if (h/b_h) > ih
    for(iix=0;iix<iw;iix+=1;)
        draw_sprite_part_ext(b_spr,frame,0,0,b_w,h mod b_h,x1+b_w*iix,y1+b_h*iy,1,1,c_white,a);
        
if  (w/b_w) > iw and (h/b_h) > ih
    draw_sprite_part_ext(b_spr,frame,0,0,w mod b_w,h mod b_h,x1+iw*b_w,y1+ih*b_h,1,1,c_white,a);

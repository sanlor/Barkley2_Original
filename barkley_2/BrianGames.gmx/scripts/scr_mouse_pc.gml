/// scr_mouse_pc(x1, y1, x2, y2)
if (global.controlType != "pc") return 0;
return (view_xview[0] + o_curs.x >= argument[0] && view_yview[0] + o_curs.y >= argument[1] && 
        view_xview[0] + o_curs.x <= argument[2] && view_yview[0] + o_curs.y <= argument[3]);

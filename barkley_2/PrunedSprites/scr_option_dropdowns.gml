/// scr_option_dropdowns()

last_option = b_hover;
obj = instance_create(xo+ar_op_button_x[i],yo+ar_op_button_y[i],o_dropdown);
obj.title = ar_op_button_str[b_hover];
obj.options = 3;
obj.dir = 0;
obj.w = 0;
obj.off = 0;

switch b_hover {
    case 1: 
        obj.s_option[0] = ar_op_selection[1,0];
        obj.s_option[1] = ar_op_selection[1,1];
        obj.s_option[2] = ar_op_selection[1,2];
        obj.selected = ar_op_selected[1];
        obj.off = 1;
        break;
    case 2: 
        if ar_op_selected[1] = 0 {
            ar_op_selection[2,0] = "Pixel Perfect";
            ar_op_selection[2,1] = "Proportional";
            ar_op_selection[2,2] = "Stretch Fill";
            obj.off = 1;
            }
        else {
            for(n=0;n<=global.screen_maxscale-2;n+=1)
                ar_op_selection[2,n] = string(n+2)+"x";
            obj.options = n;
        }
        for(i=0;i<obj.options;i+=1)
            obj.s_option[i] = ar_op_selection[2,i];
        obj.selected = min(ar_op_selected[2],obj.options-1);
        break;
    case 3:
        obj.s_option[0] = ar_op_selection[3,0];
        obj.s_option[1] = ar_op_selection[3,1];
        obj.selected = ar_op_selected[3];
        obj.options = 2;
        break;
    case 5:
        obj.options = 3;
        obj.s_option[0] = ar_op_selection[5,0];
        obj.s_option[1] = ar_op_selection[5,1];
        obj.s_option[2] = ar_op_selection[5,2];
        obj.selected = ar_op_selected[5];
        obj.off = 1;
        obj.dir = 1;
        break;
    case 9:
        obj.s_option[0] = ar_op_selection[9,0];
        obj.s_option[1] = ar_op_selection[9,1];
        obj.selected = ar_op_selected[9];
        obj.options = 2;
        obj.w = 1;
}

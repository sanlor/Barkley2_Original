/// D3DBlock(0 = x0, 1 = y0, 2 = z0, 3 = x1, 4 = y1, 5 = z1, tex);
xtr = abs(argument0 - argument3);
ytr = abs(argument1 - argument4);
ztr = abs(argument2 - argument5);
d3d_transform_set_scaling(xtr, ytr, ztr);
d3d_transform_add_translation(xt + argument0, yt + argument1, zt + argument2);
d3d_model_draw(global.modelBlock, 0, 0, 0, argument6);
//d3d_transform_set_identity();
//d3d_model_draw(global.modelBlock, xt + argument0, yt + argument1, zt + argument2, argument6);

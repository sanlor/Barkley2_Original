///Block Draw
//0 = ID, 1 = TOP / MID / BOT
_id = argument0;
if (argument1 == "mid")
{
    for (_i = 0; _i < 4; _i += 1)
    {
        _side = (_i * 2);
        d3d_primitive_begin_texture(pr_trianglestrip, blkTex[_id]);
        d3d_vertex_texture(blkX0[_id, _i], blkY0[_id, _i], blkZ0[_id, _i], blkTexX[_id, _side + 0], blkTexY[_id, _side + 0]);
        d3d_vertex_texture(blkX1[_id, _i], blkY1[_id, _i], blkZ1[_id, _i], blkTexX[_id, _side + 1], blkTexY[_id, _side + 0]);
        d3d_vertex_texture(blkX2[_id, _i], blkY2[_id, _i], blkZ2[_id, _i], blkTexX[_id, _side + 0], blkTexY[_id, _side + 1]);
        d3d_vertex_texture(blkX3[_id, _i], blkY3[_id, _i], blkZ3[_id, _i], blkTexX[_id, _side + 1], blkTexY[_id, _side + 1]);
        d3d_primitive_end();
    }
}
else
{
    if (argument1 == "top") 
    {
        _dz = blkTopZ[_id]; 
        _side = (4 * 2);
    }
    else 
    {
        _dz = blkBotZ[_id];
        _side = (5 * 2);
    }
    d3d_primitive_begin_texture(pr_trianglestrip, blkTex[_id]);
    d3d_vertex_texture(blkTopX0[_id], blkTopY0[_id], _dz, blkTexX[_id, _side + 0], blkTexY[_id, _side + 0]);
    d3d_vertex_texture(blkTopX1[_id], blkTopY1[_id], _dz, blkTexX[_id, _side + 1], blkTexY[_id, _side + 0]);
    d3d_vertex_texture(blkTopX2[_id], blkTopY2[_id], _dz, blkTexX[_id, _side + 0], blkTexY[_id, _side + 1]);
    d3d_vertex_texture(blkTopX3[_id], blkTopY3[_id], _dz, blkTexX[_id, _side + 1], blkTexY[_id, _side + 1]);
    d3d_primitive_end();
}

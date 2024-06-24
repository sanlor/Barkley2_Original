//
//PointDistance3D(
c = argument0;
d3d_primitive_begin_texture(pr_trianglelist, tex);
for (t = 0; t < triangleCount[c]; t += 1)
{
    d3d_vertex_texture_color(triangleX0[c, t], triangleY0[c, t], ht, thp, tvp, cl, alp);
    d3d_vertex_texture_color(triangleX1[c, t], triangleY1[c, t], ht, thp + ths, tvp, cl, alp);
    d3d_vertex_texture_color(triangleX2[c, t], triangleY2[c, t], ht, thp, tvp + tvs, cl, alp);
    
    d3d_vertex_texture_color(triangleX0[c, t], triangleY0[c, t], -ht, thp, tvp, cl, alp);
    d3d_vertex_texture_color(triangleX1[c, t], triangleY1[c, t], -ht, thp + ths, tvp, cl, alp);
    d3d_vertex_texture_color(triangleX2[c, t], triangleY2[c, t], -ht, thp, tvp + tvs, cl, alp);
    
    //Side 1
    d3d_vertex_texture_color(triangleX0[c, t], triangleY0[c, t], ht, thp, tvp, cv, alp);
    d3d_vertex_texture_color(triangleX0[c, t], triangleY0[c, t], -ht, thp, tvp + tvs, cv, alp);
    d3d_vertex_texture_color(triangleX1[c, t], triangleY1[c, t], ht, thp + ths, tvp, cv, alp);
    
    d3d_vertex_texture_color(triangleX1[c, t], triangleY1[c, t], ht, thp, tvp, cv, alp);
    d3d_vertex_texture_color(triangleX0[c, t], triangleY0[c, t], -ht, thp + ths, tvp, cv, alp);
    d3d_vertex_texture_color(triangleX1[c, t], triangleY1[c, t], -ht, thp, tvp + tvs, cv, alp);
    
    //Side 2
    d3d_vertex_texture_color(triangleX1[c, t], triangleY1[c, t], ht, thp, tvp, cd, alp);
    d3d_vertex_texture_color(triangleX1[c, t], triangleY1[c, t], -ht, thp, tvp + tvs, cd, alp);
    d3d_vertex_texture_color(triangleX2[c, t], triangleY2[c, t], ht, thp + ths, tvp, cd, alp);
    
    d3d_vertex_texture_color(triangleX2[c, t], triangleY2[c, t], ht, thp, tvp, cd, alp);
    d3d_vertex_texture_color(triangleX1[c, t], triangleY1[c, t], -ht, thp + ths, tvp, cd, alp);
    d3d_vertex_texture_color(triangleX2[c, t], triangleY2[c, t], -ht, thp, tvp + tvs, cd, alp);
    
    //Side 3
    d3d_vertex_texture_color(triangleX2[c, t], triangleY2[c, t], ht, thp, tvp, cf, alp);
    d3d_vertex_texture_color(triangleX2[c, t], triangleY2[c, t], -ht, thp, tvp + tvs, cf, alp);
    d3d_vertex_texture_color(triangleX0[c, t], triangleY0[c, t], ht, thp + ths, tvp, cf, alp);
    
    d3d_vertex_texture_color(triangleX0[c, t], triangleY0[c, t], ht, thp, tvp, cf, alp);
    d3d_vertex_texture_color(triangleX2[c, t], triangleY2[c, t], -ht, thp + ths, tvp, cf, alp);
    d3d_vertex_texture_color(triangleX0[c, t], triangleY0[c, t], -ht, thp, tvp + tvs, cf, alp);
}
d3d_primitive_end();

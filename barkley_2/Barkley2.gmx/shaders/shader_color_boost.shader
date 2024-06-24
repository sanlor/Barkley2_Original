attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~


varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float argRed; // -1 to +1
uniform float argGreen; // -1 to +1
uniform float argBlue; // -1 to +1

void main()
{
    vec4 retCol = texture2D(gm_BaseTexture, v_vTexcoord);
    
    retCol.r = clamp(retCol.r + argRed, 0.0, 1.0);
    retCol.g = clamp(retCol.g + argGreen, 0.0, 1.0);
    retCol.b = clamp(retCol.b + argBlue, 0.0, 1.0);
    gl_FragColor = retCol;
    if (v_vColour.a < 1.0) 
        gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
}

attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//Palette Swap Shader
//NOTE: turning on interpolation blends the palette colors together for some reason
varying vec2 v_vTexcoord;

uniform sampler2D colorTable;
uniform float paletteIndex;

void main()
{
    vec4 col = texture2D(gm_BaseTexture, v_vTexcoord);
    vec2 index = vec2(0, (col.r * 255.0) + paletteIndex);
    vec4 indexedColor = texture2D(colorTable, (index / 255.0));
    gl_FragColor = indexedColor;
    gl_FragColor.a = texture2D( gm_BaseTexture, v_vTexcoord ).a;
}

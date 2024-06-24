//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Color;                     // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColor;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColor = in_Color;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// simple color removal
//
uniform vec3 f_Color1;

varying vec2 v_vTexcoord;
varying vec4 v_vColor;

void main()
{
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    if( col.rgb == f_Color1.rgb )
    {
        col.a = 0.0;
    }
    gl_FragColor = v_vColor * col;
}

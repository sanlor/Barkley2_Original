//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
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

//######################_==_YOYO_SHADER_MARKER_==_######################@~
// Fragment
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 argCol;
uniform float argTim;

void main()
{
    vec4 basCol = texture2D(gm_BaseTexture, v_vTexcoord);
    if (basCol.r == basCol.g && basCol.g == basCol.b && basCol.r > 0.0)
    {
        //gl_FragColor = vec4(argCol.rgb * basCol.r, 1.0);
        gl_FragColor = vec4(argCol.rgb, 1.0);
        //gl_FragColor.rgb += mod(argTim, 1.0) / 4.0;
        gl_FragColor.rgb += abs(sin(argTim * 5.0) / 3.0);
    }
    else gl_FragColor = v_vColour * basCol;
}

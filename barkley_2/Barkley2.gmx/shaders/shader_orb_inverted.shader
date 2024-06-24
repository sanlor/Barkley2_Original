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

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//

#define M_PI 3.1415926535897932384626433832795
#define M_2PI 6.283185307179586476925286766559

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float spin;
uniform float perspective;

void main()
{
    vec2 lv = vec2((v_vTexcoord[0] - 0.5) * 2.0,
                   (v_vTexcoord[1] - 0.5) * 2.0);
    float l = length(lv);
    
    if (l < 1.0) {
        // Twist
        float Y = lv[1];
        float YR = sin(-acos(lv[0]));
        float ang = asin(Y/YR);
        ang += perspective;
        float Ynew = cos(ang) * YR;
    
        // Convert vector to texture coordinates
        float A = lv[0];
        //float R = sin(acos(lv[1]));
        float R = sin(acos(Ynew));
        float angle = -acos(A / R);
        vec2 tex = vec2(((angle * sign(sin(ang))) + spin) / M_2PI, (Ynew / 2.0) + 0.5);
        gl_FragColor = v_vColour * texture2D( gm_BaseTexture, tex );
    }
    else {
        vec4 c = vec4(0.0, 0.0, 0.0, 0.0);
        gl_FragColor = c;
    }
}


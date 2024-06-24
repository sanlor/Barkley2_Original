//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec2 v_vScreenPos;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vScreenPos = in_Position.xy;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Converts texture from sRGB to linear and adds noise
//
varying vec2 v_vTexcoord;
varying vec2 v_vScreenPos;
varying vec4 v_vColour;

uniform float time;

// Emulated input resolution.
#define resX 384.0
#define resY 240.0
const vec2 res = vec2(resX, resY);

// Static noise overlay
// 0.0 = None
// 0.2 = Slightly noticable
uniform float noise;

//------------------------------------------------------------------------

// sRGB to Linear.
// Assuing using sRGB typed textures this should not be needed.
float ToLinear1(float c){return(c<=0.04045)?c/12.92:pow((c+0.055)/1.055,2.4);}
vec3 ToLinear(vec3 c){return vec3(ToLinear1(c.r),ToLinear1(c.g),ToLinear1(c.b));}

vec3 Fetch(vec2 pos){
    return texture2D(gm_BaseTexture,pos.xy).rgb;
}

float rand(vec2 co){
  return 1.0 - noise * fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

// Entry point
void main(){
    gl_FragColor.rgb= ToLinear(Fetch(v_vTexcoord)) *
                      rand(fract(v_vScreenPos * time/1000.0));
    gl_FragColor.a=1.0;
}



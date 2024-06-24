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

// At 2X resolution we must offset the Y for scanlines to render nicely.
// 0.0       = No offset
// 0.2/240.0 = Good offset for 2X res
uniform float yOffset;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vScreenPos = in_Position.xy;
    v_vTexcoord = in_TextureCoord;
    v_vTexcoord.y += yOffset;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~/*
Converts texture from sRGB and merges with Bloom.
*/
varying vec2 v_vTexcoord;
varying vec2 v_vScreenPos;
varying vec4 v_vColour;

// Emulated input resolution.
// Fix resolution to set amount.
#define resX 384.0
#define resY 240.0
const vec2 res = vec2(resX, resY);

// Incoming texture size.
#define texW 512.0
#define texH 512.0
const vec2 texRes = vec2(texW, texH);

// Bloom sampler
uniform sampler2D bloom;

// Hardness of scanline.
//  -8.0 = soft
// -16.0 = medium
uniform float hardScan; 

// Amount of small bloom effect.
//  1.0/1.0 = only bloom
//  1.0/16.0 = what I think is a good amount of small bloom
//  0.0     = no bloom
uniform float bloomAmount;

//------------------------------------------------------------------------

// Linear to sRGB.
// Assuing using sRGB typed textures this should not be needed.
float ToSrgb1(float c){return(c<0.0031308?c*12.92:1.055*pow(abs(c),0.41666)-0.055);}
vec3 ToSrgb(vec3 c){return vec3(ToSrgb1(c.r),ToSrgb1(c.g),ToSrgb1(c.b));}

float when_eq(float x, float y) {
    return 1.0 - abs(sign(x - y));
}

// Nearest emulated sample given floating point position and texel offset.
// Also zero's off screen.
#define floating_point_error_correct 0.00001
vec3 Fetch(vec2 pos) {
    pos = floor(pos*res + floating_point_error_correct)/(texRes);
    return when_eq(floor(pos.x),0.0) *
           when_eq(floor(pos.y),0.0) *
           texture2D(gm_BaseTexture,pos.xy/*,-16.0*/).rgb;
}

// Nearest emulated sample given floating point position and texel offset.
// Also zero's off screen.
vec3 FetchBloom(vec2 pos) {
    pos = (pos*res + floating_point_error_correct)/(texRes);
    return when_eq(floor(pos.x),0.0) *
           when_eq(floor(pos.y),0.0) *
           texture2D(bloom, pos.xy).rgb;
}
  
// 1D Gaussian.
float Gaus(float pos,float scale) {
    return exp2(scale*pos*pos);
}

// Distance in emulated pixels to nearest texel.
vec2 Dist(vec2 pos) {
    return -(fract(pos*res) - vec2(0.5));
}

// Return scanline weight.
float Scan(vec2 pos) {
    float dst = Dist(pos).y;
    return Gaus(dst, hardScan);
}

// Entry point
void main() {
    gl_FragColor.rgb = ToSrgb(
            (Fetch(v_vTexcoord) * Scan(v_vTexcoord)) +
            (FetchBloom(v_vTexcoord) * bloomAmount));
    gl_FragColor.a = 1.0;
}




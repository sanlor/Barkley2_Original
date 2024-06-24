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

// Emulated input resolution.
// Fix resolution to set amount.
#define resX 384.0
#define resY 240.0
const vec2 res = vec2(resX, resY);

// Incoming texture size.
#define texW 512.0
#define texH 512.0
const vec2 texRes = vec2(texW, texH);

// Hardness of v-bloom
//  -1.0 = wide to the point of clipping (bad)
//  -1.5 = wide
//  -4.0 = not very wide at all
uniform float vbloomHard;

//------------------------------------------------------------------------

float when_eq(float x, float y) {
    return 1.0 - abs(sign(x - y));
}

// Nearest emulated sample given floating point position and texel offset.
// Also zero's off screen.
#define floating_point_error_correct 0.00001
vec3 Fetch(vec2 pos, vec2 off){
    pos = floor(pos*res + off + floating_point_error_correct)/(texRes);
    return when_eq(floor(pos.x),0.0) *
           when_eq(floor(pos.y),0.0) *
           texture2D(gm_BaseTexture,pos.xy/*,-16.0*/).rgb;
}

vec3 samples[5];
void fetchSamples(vec2 pos) {
    samples[0] = Fetch(pos, vec2(0.0, -2.0));
    samples[1] = Fetch(pos, vec2(0.0, -1.0));
    samples[2] = Fetch(pos, vec2(0.0,  0.0));
    samples[3] = Fetch(pos, vec2(0.0,  1.0));
    samples[4] = Fetch(pos, vec2(0.0,  2.0));
}

// Distance in emulated pixels to nearest texel.
vec2 Dist(vec2 pos) {
    return -(fract(pos*res) - vec2(0.5));
}

// 1D Gaussian.
float Gaus(float pos,float scale) {
    return exp2(scale*pos*pos);
}

// 5-tap Gaussian filter along horz line.
vec3 Horz5(vec2 pos){
  float dst = Dist(pos).y;
  float wa=Gaus(dst-2.0,vbloomHard);
  float wb=Gaus(dst-1.0,vbloomHard);
  float wc=Gaus(dst+0.0,vbloomHard);
  float wd=Gaus(dst+1.0,vbloomHard);
  float we=Gaus(dst+2.0,vbloomHard);
  // Return filtered sample.
  return (samples[0]*wa +
          samples[1]*wb +
          samples[2]*wc +
          samples[3]*wd +
          samples[4]*we) /
         (wa+wb+wc+wd+we);}

// Entry point
void main(){
    fetchSamples(v_vTexcoord);
    gl_FragColor.rgb = Horz5(v_vTexcoord);
    gl_FragColor.a = 1.0;
}



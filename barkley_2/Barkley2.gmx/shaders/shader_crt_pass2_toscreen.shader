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
uniform float u_yOffset;


void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vScreenPos = in_Position.xy;
    v_vTexcoord = in_TextureCoord;
    v_vTexcoord.y += u_yOffset;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// PUBLIC DOMAIN CRT STYLED SCAN-LINE SHADER
//
//   by Timothy Lottes
//
// This is more along the style of a really good CGA arcade monitor.
// With RGB inputs instead of NTSC.
// The shadow mask example has the mask rotated 90 degrees for less chromatic aberration.
//
// Left it unoptimized to show the theory behind the algorithm.
//
// It is an example what I personally would want as a display option for pixel art games.
// Please take and use, change, or whatever.
//

// Emulated input resolution.
// Fix resolution to set amount.
#define resX 384.0
#define resY 240.0
const vec2 res = vec2(resX, resY);

// Incoming texture size.
#define texW 512.0
#define texH 512.0
const vec2 texRes = vec2(texW, texH);

// Hardness of scanline.
//  -8.0 = soft
// -16.0 = medium
uniform float hardScan; //#define hardScan -12.0
uniform float hardVScan; //#define hardVScan -2.0

// Hardness of pixels in scanline.
// -2.0 = soft
// -4.0 = hard
uniform float hardPix; //#define hardPix -6.0

// Hardness of short vertical bloom.
//  -1.0 = wide to the point of clipping (bad)
//  -1.5 = wide
//  -4.0 = not very wide at all
uniform float hardBloomScan; //#define hardBloomScan -2.0

// Hardness of short horizontal bloom.
//  -0.5 = wide to the point of clipping (bad)
//  -1.0 = wide
//  -2.0 = not very wide at all
uniform float hardBloomPix; //#define hardBloomPix -1.5

// Amount of small bloom effect.
//  1.0/1.0 = only bloom
//  1.0/16.0 = what I think is a good amount of small bloom
//  0.0     = no bloom
uniform float bloomAmount; //#define bloomAmount 0.09

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
//#define floating_point_error_correct 0.00001
vec3 fetch(vec2 pos, vec2 off){
    pos = (pos*res + off /*+ floating_point_error_correct*/)/(texRes);
    return when_eq(floor(pos.x),0.0) *
           when_eq(floor(pos.y),0.0) *
           texture2D(gm_BaseTexture,pos.xy/*,-16.0*/).rgb;
}

vec3 samples[31];
void fetchSamples(vec2 pos) {
    samples[0] = fetch(pos, vec2(-2.0,-2.0));
    samples[1] = fetch(pos, vec2(-1.0,-2.0));
    samples[2] = fetch(pos, vec2( 0.0,-2.0));
    samples[3] = fetch(pos, vec2( 1.0,-2.0));
    samples[4] = fetch(pos, vec2( 2.0,-2.0));
    
    samples[5] = fetch(pos, vec2(-3.0,-1.0));
    samples[6] = fetch(pos, vec2(-2.0,-1.0));
    samples[7] = fetch(pos, vec2(-1.0,-1.0));
    samples[8] = fetch(pos, vec2( 0.0,-1.0));
    samples[9] = fetch(pos, vec2( 1.0,-1.0));
    samples[10] = fetch(pos, vec2( 2.0,-1.0));
    samples[11] = fetch(pos, vec2( 3.0,-1.0));

    samples[12] = fetch(pos, vec2(-3.0, 0.0));
    samples[13] = fetch(pos, vec2(-2.0, 0.0));
    samples[14] = fetch(pos, vec2(-1.0, 0.0));
    samples[15] = fetch(pos, vec2( 0.0, 0.0));
    samples[16] = fetch(pos, vec2( 1.0, 0.0));
    samples[17] = fetch(pos, vec2( 2.0, 0.0));
    samples[18] = fetch(pos, vec2( 3.0, 0.0));
    
    samples[19] = fetch(pos, vec2(-3.0, 1.0));
    samples[20] = fetch(pos, vec2(-2.0, 1.0));
    samples[21] = fetch(pos, vec2(-1.0, 1.0));
    samples[22] = fetch(pos, vec2( 0.0, 1.0));
    samples[23] = fetch(pos, vec2( 1.0, 1.0));
    samples[24] = fetch(pos, vec2( 2.0, 1.0));
    samples[25] = fetch(pos, vec2( 3.0, 1.0));
    
    samples[26] = fetch(pos, vec2(-2.0, 2.0));
    samples[27] = fetch(pos, vec2(-1.0, 2.0));
    samples[28] = fetch(pos, vec2( 0.0, 2.0));
    samples[29] = fetch(pos, vec2( 1.0, 2.0));
    samples[30] = fetch(pos, vec2( 2.0, 2.0));
}

// Distance in emulated pixels to nearest texel.
vec2 Dist(vec2 pos) {return -(fract(pos*res)-vec2(0.5));}
    
// 1D Gaussian.
float Gaus(float pos,float scale){return exp2(scale*pos*pos);}

// Return scanline weight.
float Scan(vec2 pos,float off){
  float dst=Dist(pos).y;
  return Gaus(dst+off,hardScan);}
float VScan(vec2 pos,float off){
  vec2 dst=Dist(pos);
  float vs=Gaus((dst.x)+off,hardVScan);
  return 1.0 - ((1.0-vs) * (abs(dst.y) * 2.0));}

// Return scanline weight for bloom.
float BloomScan(vec2 pos,float off){
  float dst=Dist(pos).y;
  return Gaus(dst+off,hardBloomScan);}

// 3-tap Gaussian filter along horz line.
vec3 Horz3(vec2 pos, int i){
  vec3 b=samples[i-1];
  vec3 c=samples[i];
  vec3 d=samples[i+1];
  float dst=Dist(pos).x;
  // Convert distance to weight.
  float scale=hardPix;
  float wb=Gaus(dst-1.0,scale);
  float wc=Gaus(dst+0.0,scale);
  float wd=Gaus(dst+1.0,scale);
  // Return filtered sample.
  return (b*wb+c*wc+d*wd)/(wb+wc+wd);}

// 3-tap Gaussian filter along horz.
vec3 Horz3VScan(vec2 pos, int i){
  vec3 b=samples[i-1];
  vec3 c=samples[i];
  vec3 d=samples[i+1];
  float dst=Dist(pos).x;
  // Convert distance to weight.
  float scale=hardPix;
  float wb=Gaus(dst-1.0,scale);
  float wc=Gaus(dst+0.0,scale);
  float wd=Gaus(dst+1.0,scale);
  float sb=VScan(pos,-1.0);
  float sc=VScan(pos,0.0);
  float sd=VScan(pos,1.0);
  // Return filtered sample.
  return (b*wb*sb+c*wc*sc+d*wd*sd)/(wb+wc+wd);}

// 5-tap Gaussian filter along horz line.
vec3 Horz5(vec2 pos, int i){
  vec3 a=samples[i-2];
  vec3 b=samples[i-1];
  vec3 c=samples[i];
  vec3 d=samples[i+1];
  vec3 e=samples[i+2];
  float dst=Dist(pos).x;
  // Convert distance to weight.
  float scale=hardPix;
  float wa=Gaus(dst-2.0,scale);
  float wb=Gaus(dst-1.0,scale);
  float wc=Gaus(dst+0.0,scale);
  float wd=Gaus(dst+1.0,scale);
  float we=Gaus(dst+2.0,scale);
  // Return filtered sample.
  return (a*wa+b*wb+c*wc+d*wd+e*we)/(wa+wb+wc+wd+we);}
  
// 3-tap Gaussian filter along horz.
vec3 Horz5VScan(vec2 pos, int i){
  vec3 a=samples[i-2];
  vec3 b=samples[i-1];
  vec3 c=samples[i];
  vec3 d=samples[i+1];
  vec3 e=samples[i+2];
  float dst=Dist(pos).x;
  // Convert distance to weight.
  float scale=hardPix;
  float wa=Gaus(dst-2.0,scale);
  float wb=Gaus(dst-1.0,scale);
  float wc=Gaus(dst+0.0,scale);
  float wd=Gaus(dst+1.0,scale);
  float we=Gaus(dst+2.0,scale);
  float sa=VScan(pos,-2.0);
  float sb=VScan(pos,-1.0);
  float sc=VScan(pos,0.0);
  float sd=VScan(pos,1.0);
  float se=VScan(pos,2.0);
  // Return filtered sample.
  return (a*wa*sa+b*wb*sb+c*wc*sc+d*wd*sd+e*we*se)/(wa+wb+wc+wd+we);}

// 7-tap Gaussian filter along horz line.
vec3 Horz7(vec2 pos, int i){
  vec3 a=samples[i-3];
  vec3 b=samples[i-2];
  vec3 c=samples[i-1];
  vec3 d=samples[i];
  vec3 e=samples[i+1];
  vec3 f=samples[i+2];
  vec3 g=samples[i+3];
  float dst=Dist(pos).x;
  // Convert distance to weight.
  float scale=hardBloomPix;
  float wa=Gaus(dst-3.0,scale);
  float wb=Gaus(dst-2.0,scale);
  float wc=Gaus(dst-1.0,scale);
  float wd=Gaus(dst+0.0,scale);
  float we=Gaus(dst+1.0,scale);
  float wf=Gaus(dst+2.0,scale);
  float wg=Gaus(dst+3.0,scale);
  // Return filtered sample.
  return (a*wa+b*wb+c*wc+d*wd+e*we+f*wf+g*wg)/(wa+wb+wc+wd+we+wf+wg);}

// Allow nearest three lines to effect pixel.
vec3 Tri(vec2 pos){
  vec3 a=Horz3VScan(pos, 8);
  vec3 b=Horz5VScan(pos, 15);
  vec3 c=Horz3VScan(pos, 22);
  float wa=Scan(pos,-1.0);
  float wb=Scan(pos, 0.0);
  float wc=Scan(pos, 1.0);
  return a*wa+b*wb+c*wc;}

// Small bloom.
vec3 Bloom(vec2 pos){
  vec3 a=Horz5(pos, 2);
  vec3 b=Horz7(pos, 8);
  vec3 c=Horz7(pos, 15);
  vec3 d=Horz7(pos, 22);
  vec3 e=Horz5(pos, 28);
  float wa=BloomScan(pos,-2.0);
  float wb=BloomScan(pos,-1.0);
  float wc=BloomScan(pos, 0.0);
  float wd=BloomScan(pos, 1.0);
  float we=BloomScan(pos, 2.0);
  return a*wa+b*wb+c*wc+d*wd+e*we;}

// Entry.
varying vec2 v_vTexcoord;
varying vec2 v_vScreenPos;
varying vec4 v_vColour;


void main(){
    fetchSamples(v_vTexcoord);
    gl_FragColor.rgb = Tri(v_vTexcoord);
    gl_FragColor.rgb += Bloom(v_vTexcoord) * bloomAmount;
    gl_FragColor.rgb = ToSrgb(gl_FragColor.rgb);
    gl_FragColor.a=1.0;
}




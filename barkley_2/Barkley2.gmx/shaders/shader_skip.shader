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
//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float argRan;
uniform float argTim;

//NoiseTrue - v1.05
float ranCou = 0.0;
float ran(float _max) 
{ 
    float _sed = abs(ranCou - 1.0) + sin(v_vTexcoord.x) + cos(v_vTexcoord.y) + abs(ranCou - 1.0) + cos(argRan * ranCou);
    _sed += fract(v_vTexcoord.x * 21.923);
    _sed += fract(v_vTexcoord.y * 87.654);
    _sed += sin(argRan * 12.24);
    _sed += cos(argRan * 44.45);
    _sed += fract(argRan * 24.267);
    ranCou += 1.28348;
    if (ranCou > 10000.0) ranCou -= 10000.0;
    return fract(sin(dot(vec2(_sed * 24.274, _sed * 56.328), vec2(12.989, 78.233))) * 43758.545) * _max; 
}

uniform float scrWid;// = 384.0;
uniform float scrHei;// = 240.0;
uniform float scrScl;
void main()
{
    vec4 col = v_vColour;
    vec2 edt = v_vTexcoord;
    float mdy = mod(v_vTexcoord.y, 0.1);
    float yrn = mdy * (scrHei / 1.5);
    //if (mdy > 0.15) yrn *= abs(1.0 - ((yrn - 0.15) * 20.0));
    edt.x -= (1.0 / scrWid) * ((((yrn * yrn * yrn) / 5000.0) + ran(1.0)) * scrScl);
    if (mdy > 0.185) edt.x = mix(edt.x, v_vTexcoord.x, (mdy - 0.185) * 75.0);
    if (edt.x < 0.0) col.rgb = vec3(0.0, 0.0, 0.0);
    vec4 colFin = col * texture2D(gm_BaseTexture, edt);
    float tnd = ran(0.01);
    if (edt.y > argTim - tnd && edt.y < argTim + tnd) colFin.rgb *= 10.0 + ran(2.0);
    float att = mod(argTim * 2.0, 1.0);
    tnd = ran(0.002);
    if (edt.y > att - tnd && edt.y < att + tnd) colFin.rgb *= 10.0 + ran(2.0);
    //edt.y += (1.0 / scrHei) * ran(1.0);
    gl_FragColor = colFin;
}


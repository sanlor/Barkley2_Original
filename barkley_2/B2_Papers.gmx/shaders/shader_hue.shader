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
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float argHue; //0 to 1 noise value

vec3 RGBToHSV(float rrr, float ggg, float bbb)
{
    float hhh, sss, vvv;
    float mn, mx, delta;
    mn = min(min(rrr, ggg), bbb);
    mx = max(max(rrr, ggg), bbb);
    vvv = mx;
    delta = mx - mn;
    if (mx != 0.0) sss = delta / mx;
    else 
    {
        sss = 0.0;
        hhh = -1.0; //Error prone
        return vec3(0.0, 0.0, 0.0);//, 1.0);
    }
    if (rrr == mx) hhh = (ggg - bbb) / delta; // between yellow & magenta
    else if (ggg == mx) hhh = 2.0 + (bbb - rrr) / delta; // between cyan & yellow
    else hhh = 4.0 + (rrr - ggg) / delta; // between magenta & cyan
    hhh *= 60.0; // degrees
    if (hhh < 0.0) hhh += 360.0;
    return vec3(hhh, sss, vvv);
}
vec3 RGBToHSV(vec4 col) { return RGBToHSV(col.x, col.y, col.z); } //Must go after

vec4 HSVToRGB(float hhh, float sss, float vvv)
{
    float fff, ppp, qqq, ttt, iii;
    if (sss == 0.0) { return vec4(vvv, vvv, vvv, 1.0); } //greyscale
    hhh /= 60.0; // sector 0 to 5
    iii = floor(hhh);
    fff = hhh - iii; // factorial part of h
    ppp = vvv * (1.0 - sss);
    qqq = vvv * (1.0 - sss * fff);
    ttt = vvv * (1.0 - sss * (1.0 - fff));
    if (iii == 0.0) return vec4(vvv, ttt, ppp, 1.0);
    else if (iii == 1.0) return vec4(qqq, vvv, ppp, 1.0);
    else if (iii == 2.0) return vec4(ppp, vvv, ttt, 1.0);
    else if (iii == 3.0) return vec4(ppp, qqq, vvv, 1.0);
    else if (iii == 4.0) return vec4(ttt, ppp, vvv, 1.0);
    else return vec4(vvv, ppp, qqq, 1.0);
}
vec4 HSVToRGB(vec4 col) { return HSVToRGB(col.x, col.y, col.z); } //Must go after

void main()
{
    // Get texure pixel and add blending
    vec4 retCol = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    float retA = retCol.a;
    
    //Hue shift
    vec3 hsvv = RGBToHSV(retCol.x, retCol.y, retCol.z);
    hsvv.x += argHue; 
    hsvv.x = mod(hsvv.x, 360.0);
    retCol = HSVToRGB(vec4(hsvv.x, hsvv.y, hsvv.z, 1.0));
    
    gl_FragColor = vec4(retCol.rgb, retA);
}


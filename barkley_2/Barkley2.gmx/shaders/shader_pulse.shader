//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 fragCoord;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    fragCoord = in_Position.xy;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~
//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 fragCoord;

uniform vec2      iResolution;           // viewport resolution (in pixels)
uniform vec2      iEffectPos;            //
uniform float     iEffectRadius;
uniform float     iEffectTime;
uniform sampler2D iChannel0;

vec2 getModifiedUV(vec2 actualUV, vec2 pointUV, float radius, float strength)
{
    vec2 vecToPoint = pointUV - actualUV;
    float distToPoint = length(vecToPoint);
    
    float mag = (1.0 - (distToPoint / radius)) * strength;
    mag *= step(distToPoint, radius);
    
    return actualUV + (mag * vecToPoint);
}

void main()
{
    float strength = 0.5;

    float minRes = min(iResolution.x, iResolution.y); 
    vec2 uv = fragCoord.xy / minRes;
// Uncomment this line to control with the mouse.
//pos = iMouse.xy / min(iResolution.x, iResolution.y);

    vec2 modifiedUV = getModifiedUV(uv,iEffectPos,iEffectRadius/minRes,strength);
    gl_FragColor = texture2D(iChannel0, modifiedUV);
}

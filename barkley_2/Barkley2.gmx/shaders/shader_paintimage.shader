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

uniform sampler2D imgToRepeat1;          // input channel. XX = 2D/Cube
uniform sampler2D imgToRepeat2;          // input channel. XX = 2D/Cube
uniform sampler2D imgToRepeat3;          // input channel. XX = 2D/Cube
uniform sampler2D imgToRepeat4;          // input channel. XX = 2D/Cube
uniform vec2      iResolution;           // viewport resolution (in pixels)
uniform vec2      iViewPos;             //
uniform float     iParallax;

void main()
{
    vec2 endcoord = mod(fragCoord + iViewPos*iParallax*1.5, iResolution) / iResolution;
    gl_FragColor = texture2D(imgToRepeat1 ,endcoord);
    
    if(gl_FragColor.a==0.0)
    {
        endcoord = mod(fragCoord + iViewPos*iParallax*1.0, iResolution) / iResolution;
        gl_FragColor = texture2D(imgToRepeat2 ,endcoord);
    }
    
    if(gl_FragColor.a==0.0)
    {
        endcoord = mod(fragCoord + iViewPos*iParallax*0.5, iResolution) / iResolution;
        gl_FragColor = texture2D(imgToRepeat3 ,endcoord);
    }
    
    if(gl_FragColor.a==0.0)
    {
        endcoord = mod(fragCoord + iViewPos*iParallax*0.0, iResolution) / iResolution;
        gl_FragColor = texture2D(imgToRepeat4 ,endcoord);
    }
    
    
    if ( gl_FragColor.a != texture2D( gm_BaseTexture, v_vTexcoord ).a ) { gl_FragColor.a = 0.0; }
    
}

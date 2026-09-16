varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_progress;

void main()
{
    vec4 col = texture2D(gm_BaseTexture,v_vTexcoord);

    col.rgb *= (1.0-u_progress);

    gl_FragColor = col;
}
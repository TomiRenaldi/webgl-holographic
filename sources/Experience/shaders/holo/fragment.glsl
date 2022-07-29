#define M_PI 3.1415926535897932384626433832795

precision highp float;

uniform float uTime;

varying vec2 vUv;

vec2 getRadialUv(vec2 uv)
{
    float angle = atan(uv.x, uv.y);

    vec2 radialUv = vec2(0.0);
    radialUv.x = angle / (M_PI * 2.0) + 0.5;
    radialUv.y = length(uv);

    return radialUv;
}

void main()
{
    vec2 uv = vUv;
    uv -= 0.5;

    vec2 radialUv = getRadialUv(uv);

    vec3 color = vec3(radialUv, 1.0);

    gl_FragColor = vec4(color, 1.0);
}
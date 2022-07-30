#define M_PI 3.1415926535897932384626433832795

precision highp float;
precision highp int;

uniform float uTime;

varying vec2 vUv;

#include ../partials/perlin2d.glsl;
#include ../partials/getRadialUv.glsl;
#include ../partials/getElevation.glsl;
#include ../partials/getTerrainColor.glsl;
#include ../partials/getWaterColor.glsl;
#include ../partials/getShadow.glsl;
#include ../partials/getSun.glsl;

void main()
{
    vec2 uv = vUv;
    uv -= 0.5;

    vec2 radialUv = getRadialUv(uv);
    vec2 animatedRadialUv = radialUv;
    animatedRadialUv.y -= uTime * 0.01;
    animatedRadialUv.x -= uTime * 0.002;

    float elevation = getElevation(animatedRadialUv);

    vec3 color = vec3(0.0);

    float shadow = getShadow(elevation, animatedRadialUv);
    if(elevation > 0.0)
    {
        color = getTerrainColor(elevation);
        color -= shadow * 0.2;
    }
    else
    {
        color = getWaterColor(elevation);
        color -= shadow * 0.5;
    }

    vec4 sunColor = getSun(radialUv);
    color = mix(color, sunColor.rgb, sunColor.a);

    gl_FragColor = vec4(color, 1.0);
}
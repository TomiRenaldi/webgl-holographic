// Transform UV to Radial UV
vec2 getRadialUv(vec2 uv)
{
    float angle = atan(uv.x, uv.y);

    vec2 radialUv = vec2(0.0);
    radialUv.x = angle / (M_PI * 2.0) + 0.5;
    radialUv.y = 1.0 - pow(1.0 - length(uv), 4.0);

    return radialUv;
}
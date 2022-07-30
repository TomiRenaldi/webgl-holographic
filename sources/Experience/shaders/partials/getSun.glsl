vec4 getSun(vec2 radialUv)
{
    vec3 innerColor = vec3(1.0); // White
    vec3 outerColor = vec3(1.0, 1.0, 0.0); // Yellow

    float strength = 1.0 - radialUv.y;
    strength += clamp(perlin2d(vec2(radialUv.x * 10.0, uTime * 0.2)), 0.0, 1.0);
    vec3 color = mix(outerColor, innerColor, strength * 0.5);

    return vec4(color, strength * 1.0);
}
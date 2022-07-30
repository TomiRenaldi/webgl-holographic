// Get water color
vec3 getWaterColor(float elevation)
{
    vec3 depthColor = vec3(0.2, 0.54, 0.75) * 0.2;
    vec3 shoreColor = vec3(0.2, 0.54, 0.75);

    float strength = - elevation;

    vec3 color = mix(shoreColor, depthColor, strength);

    return color;
}
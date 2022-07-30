// Get Terrain Color
vec3 getTerrainColor(float elevation)
{
    // Set color
    vec3 sandColor = vec3(0.96, 0.64, 0.38); // SandyBrown
    vec3 forestColor = vec3(0.0, 0.4, 0.0); // Green
    vec3 neltedSnowColor = vec3(0.7, 0.9, 1.0); // Nelted
    vec3 snowColor = vec3(1.0); // SnowColor

    // Get sand and forest mix
    vec3 color = mix(sandColor, forestColor, elevation);

    if(elevation > 0.7)
    {
        color = mix(neltedSnowColor, snowColor, (elevation - 0.7) / 0.3);
    }

    return color;
}
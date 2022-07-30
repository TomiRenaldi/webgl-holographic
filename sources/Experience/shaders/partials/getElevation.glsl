// Get the elevation using perlin noise
float getElevation(vec2 uv)
{
    float elevation = perlin2d(uv * 15.0);
    elevation += perlin2d(uv * 80.0) * 0.2;
    elevation += perlin2d(uv * 200.0) * 0.1;
    elevation += abs(perlin2d(uv * 900.0) * 0.15);

    return elevation;
}
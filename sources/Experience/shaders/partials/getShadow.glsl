float getShadow(float elevation, vec2 uv)
{
    vec2 towardSun = normalize(- uv);

    float iterations = 4.0;
    float shadow = 0.0;

    for(float i = 1.0; i <= iterations; i++)
    {
        float towardElevation = getElevation(uv + towardSun / iterations * 0.01 * i);

        if(towardElevation > elevation)
        {
            shadow += 1.0 / iterations;
        }
    }

    return shadow;
}
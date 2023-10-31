@registerParametersBegin
@registerParameterFloat(fakeTime, "Time", 0.0f, 0.0f, 100000.0f)
@registerParametersEnd
#define iResolution vec2(1920, 1080)

float colorIt(float y)
{
    return smoothstep(0.4, 0.0, y);
}


void fragmentMain()
{
	float iTime = userParametersFS.fakeTime;
	vec2 uv = (viz_getPositionCS().xy / vec2(370.0, 210.0));
	float aR = 210.0 / 370.0;
	uv.y *= aR;	
	
	float y = distance(vec2(0.0), sin(uv * iTime) * abs(cos(iTime))*1.1);
    y = smoothstep(0.4, 0.4, y);

	vec3 color = vec3(y);
	float red = colorIt(y);
    color = (1.0 - red) * color + red * cos(iTime+uv.xyx+vec3(0,2,4));
	
	viz_setFragment(vec4(color, 0.0));
}
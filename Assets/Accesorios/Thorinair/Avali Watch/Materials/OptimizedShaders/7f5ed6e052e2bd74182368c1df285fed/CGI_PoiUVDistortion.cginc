#ifndef POI_UV_DISTORTION
#define POI_UV_DISTORTION
#if defined(PROP_DISTORTIONFLOWTEXTURE) || !defined(OPTIMIZER_ENABLED)
	UNITY_DECLARE_TEX2D_NOSAMPLER(_DistortionFlowTexture); float4 _DistortionFlowTexture_ST;
#endif
#if defined(PROP_DISTORTIONFLOWTEXTURE1) || !defined(OPTIMIZER_ENABLED)
	UNITY_DECLARE_TEX2D_NOSAMPLER(_DistortionFlowTexture1); float4 _DistortionFlowTexture1_ST;
#endif
#if defined(PROP_DISTORTIONMASK) || !defined(OPTIMIZER_ENABLED)
	POI_TEXTURE_NOSAMPLER(_DistortionMask);
#endif
half _DistortionStrength;
half _DistortionStrength1;
half2 _DistortionSpeed;
half2 _DistortionSpeed1;
#ifdef POI_AUDIOLINK
    half _EnableDistortionAudioLink;
	half2 _DistortionStrengthAudioLink;
	half _DistortionStrengthAudioLinkBand;
	half2 _DistortionStrength1AudioLink;
	half _DistortionStrength1AudioLinkBand;
#endif
float2 getTorusUv(float2 uv)
{
	float phi = 6.28318530718f * uv.x;
	float theta = 6.28318530718f * uv.y;
	float3 c = cos(float3(phi, phi + 1.57079632679f, theta));
	float2 result = float2(c.x * c.z, -c.y * c.z);
	return result * 0.5 + 0.5;
}
float2 calculateDistortionUV(float2 uv)
{
	#if defined(PROP_DISTORTIONFLOWTEXTURE) || !defined(OPTIMIZER_ENABLED)
		float4 flowVector = UNITY_SAMPLE_TEX2D_SAMPLER(_DistortionFlowTexture, _MainTex, TRANSFORM_TEX(poiMesh.uv[0], _DistortionFlowTexture) + _Time.x * float4(0.5,0.5,0,0)) * 2 - 1;
	#else
		float4 flowVector = 0;
	#endif
	#if defined(PROP_DISTORTIONFLOWTEXTURE1) || !defined(OPTIMIZER_ENABLED)
		float4 flowVector1 = UNITY_SAMPLE_TEX2D_SAMPLER(_DistortionFlowTexture1, _MainTex, TRANSFORM_TEX(poiMesh.uv[0], _DistortionFlowTexture1) + _Time.x * float4(0.5,0.5,0,0)) * 2 - 1;
	#else
		float4 flowVector1 = 0;
	#endif
	#if defined(PROP_DISTORTIONMASK) || !defined(OPTIMIZER_ENABLED)
		half distortionMask = POI2D_SAMPLER_PAN(_DistortionMask, _MainTex, poiMesh.uv[float(0)], float4(0,0,0,0)).r;
	#else
		half distortionMask = 1;
	#endif
    half distortionStrength = float(0.5);
    half distortionStrength1 = float(0.5);
	#ifdef POI_AUDIOLINK
		if (poiMods.audioLinkTextureExists && float(0))
		{
            distortionStrength += lerp(float4(0,0,0,0).x, float4(0,0,0,0).y, poiMods.audioLink[float(0)]);
            distortionStrength1 += lerp(float4(0,0,0,0).x, float4(0,0,0,0).y, poiMods.audioLink[float(0)]);
		}
	#endif
	flowVector *= distortionStrength;
	flowVector1 *= distortionStrength1;
	return uv + ((flowVector.xy + flowVector1.xy) / 2) * distortionMask;
}
#endif

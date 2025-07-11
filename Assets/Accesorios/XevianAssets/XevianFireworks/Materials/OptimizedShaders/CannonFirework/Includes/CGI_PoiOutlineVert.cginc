#ifndef OutlineVert
#define OutlineVert
#include "CGI_PoiV2F.cginc"
float _OutlineMode;
float4 _OutlinePersonaDirection;
float4 _OutlineDropShadowOffset;
float _OutlineUseVertexColors;
float _OutlineFixedSize;
float _commentIfZero_EnableOutlinePass;
float _OutlinesMaxDistance;
sampler2D _OutlineMask; float4 _OutlineMask_ST; float2 _OutlineMaskPan; float _OutlineMaskUV;
float _VertexManipulationHeightUV;
float3 CreateBinormal(half3 normal, half3 tangent, half tangentSign)
{
	half sign = tangentSign * unity_WorldTransformParams.w;
	return cross(normal, tangent) * sign;
}
v2f vert(appdata v)
{
	UNITY_SETUP_INSTANCE_ID(v);
	v2f o;
	UNITY_INITIALIZE_OUTPUT(v2f, o);
	UNITY_TRANSFER_INSTANCE_ID(v, o);
	UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
	#ifdef RALIV_PENETRATION
		applyRalivDynamicOrifaceSystem(v);
	#endif
	o.uv0.xy = v.uv0.xy;
	o.uv0.zw = v.uv1.xy;
	o.uv1.xy = v.uv2.xy;
	o.uv1.zw = v.uv3.xy;
	float2 uvArray[4];
	uvArray[0] = o.uv0.xy;
	uvArray[1] = o.uv0.zw;
	uvArray[2] = o.uv1.xy;
	uvArray[3] = o.uv1.zw;
	float2 uvToUse = uvArray[float(0)];
	#ifdef POI_MIRROR
		applyMirrorRenderVert(v.vertex);
	#endif
	o.uv0.xy = v.uv0 + _OutlineGlobalPan.xy * _Time.y;
	float outlineMask = 1;
	outlineMask = poiMax(tex2Dlod(_OutlineMask, float4(TRANSFORM_TEX(uvArray[float(0)], _OutlineMask) + _Time.x * float4(0,0,0,0), 0, 0)).rgb);
	
	if (float(2) == 2)
	{
		outlineMask *= v.color.r;
	}
	
	if (float(2) != 1)
	{
		o.normal = UnityObjectToWorldNormal(v.normal);
	}
	else
	{
		o.normal = UnityObjectToWorldNormal(v.color);
	}
	float4 localPos = v.vertex;
	#ifdef RALIV_PENETRATION
		applyRalivDynamicPenetrationSystem(localPos.rgb, o.normal.rgb, v);
	#endif
	o.tangent = float4(UnityObjectToWorldDir(v.tangent.xyz), v.tangent.w);
	o.binormal.rgb = CreateBinormal(o.normal.xyz, o.tangent.xyz, o.tangent.w);
	half offsetMultiplier = 1;
	half distanceOffset = 1;
	
	if (float(0))
	{
		distanceOffset *= min(distance(_WorldSpaceCameraPos, mul(unity_ObjectToWorld, localPos).xyz), float(9999));
	}
	float3 offset = o.normal * (float(0.1) * float(1) / 100) * outlineMask * distanceOffset;
	
	if (float(0) == 2)
	{
		float3 lightDirection = poiLight.direction = normalize(_WorldSpaceLightPos0 + unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz);
		offsetMultiplier = saturate(dot(lightDirection, o.normal));
		offset *= offsetMultiplier;
		offset *= distanceOffset;
	}
	else if (float(0) == 3)
	{
		half3 viewNormal = mul((float3x3)UNITY_MATRIX_V, o.normal);
		offsetMultiplier = saturate(dot(viewNormal.xy, normalize(float4(1,0,0,0).xy)));
		offset *= offsetMultiplier;
		offset *= distanceOffset;
	}
	else if (float(0) == 4)
	{
		offset = mul((float3x3)transpose(UNITY_MATRIX_V), float4(1,0,0,0));
		offset *= distanceOffset;
	}
	o.worldPos = mul(unity_ObjectToWorld, localPos) + float4(offset, 0);
	o.modelPos = mul(unity_ObjectToWorld, float4(0, 0, 0, 1));
	o.pos = UnityWorldToClipPos(o.worldPos);
	o.grabPos = ComputeGrabScreenPos(o.pos);
	o.angleAlpha = 1;
	#ifdef POI_RANDOM
		o.angleAlpha = ApplyAngleBasedRendering(o.modelPos, o.worldPos);
	#endif
	UNITY_TRANSFER_SHADOW(o, o.uv0);
	UNITY_TRANSFER_FOG(o, o.pos);
	return o;
}
#endif

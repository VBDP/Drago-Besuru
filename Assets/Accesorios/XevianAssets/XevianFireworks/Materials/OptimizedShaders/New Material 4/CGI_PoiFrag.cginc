#ifndef POIFRAG
#define POIFRAG
float _MainEmissionStrength;
float _IgnoreFog;
half _GIEmissionMultiplier;
float _IridescenceTime;
float _AlphaToMask;
float _ForceOpaque;
float _commentIfZero_EnableGrabpass;
float _AlphaPremultiply;
float2 _MainTexPan;
float _MainTextureUV;
float _LightingAdditiveEnable;
float _PPLightingMultiplier;
float _PPEmissionMultiplier;
float4 frag(v2f i, uint facing: SV_IsFrontFace): SV_Target
{
	#ifdef FORWARD_ADD_PASS
		#if !defined(POI_LIGHTING)
			return 0;
		#endif
		
		if ((1.0 /*_LightingAdditiveEnable*/) == 0)
		{
			return 0;
		}
	#endif
	UNITY_SETUP_INSTANCE_ID(i);
	float4 albedo = 1;
	float4 finalColor = 1;
	float bakedCubemap = 0; // Whether or not metallic should run before or after lighting multiplication
	float3 finalSpecular0 = 0;
	float3 finalSpecular1 = 0;
	float3 finalSSS = 0;
	fixed lightingAlpha = 1;
	float3 finalEnvironmentalRim = 0;
	float3 finalEmission = 0;
	float3 finalLighting = 1;
	float3 emissionLighting = 1;
	float3 IridescenceEmission = 0;
	float3 spawnInEmission = 0;
	float3 voronoiEmission = 0;
	float3 matcapEmission = 0;
	float3 depthTouchEmission = 0;
	float3 decalEmission = 0;
	float3 glitterEmission = 0;
	float3 panosphereEmission = 0;
	float3 backFaceEmission = 0;
	float3 dissolveEmission = 0;
	float3 rimLightEmission = 0;
	float3 flipbookEmission = 0;
	float3 textOverlayEmission = 0;
	float3 videoEmission = 0;
	float3 pathEmission = 0;
	calculateAttenuation(i);
	InitializeMeshData(i, facing);
	initializeCamera(i);
	calculateTangentData();
	#ifdef POI_BLACKLIGHT
		createBlackLightMask();
		
		if (_BlackLightMaskDebug)
		{
			return float4(blackLightMask.rgb, 1);
		}
	#endif
	#ifdef POI_PARALLAX
		calculateandApplyParallax();
	#endif
	float4 mainTexture = UNITY_SAMPLE_TEX2D(_MainTex, TRANSFORM_TEX(poiMesh.uv[(0.0 /*_MainTextureUV*/)], _MainTex) + _Time.x * float4(0,0,0,0));
	half3 detailMask = 1;
	calculateNormals(detailMask);
	calculateVertexLightingData(i);
	#ifdef POI_DATA
		calculateLightingData(i);
	#endif
	#ifdef POI_LIGHTING
		calculateBasePassLightMaps();
	#endif
	initTextureData(albedo, mainTexture, backFaceEmission, dissolveEmission, detailMask);
	#ifdef POI_PATHING
		applyPathing(albedo, pathEmission);
	#endif
	#ifdef POI_DECAL
		applyDecals(albedo, decalEmission);
	#endif
	#ifdef POI_IRIDESCENCE
		
		if (_IridescenceTime == 0)
		{
			applyIridescence(albedo, IridescenceEmission);
		}
	#endif
	#ifdef POI_VORONOI
		applyVoronoi(albedo, voronoiEmission);
	#endif
	#ifdef POI_MSDF
		ApplyTextOverlayColor(albedo, textOverlayEmission);
	#endif
	#ifdef POI_ENVIRONMENTAL_RIM
		finalEnvironmentalRim = calculateEnvironmentalRimLighting(albedo);
	#endif
	#if defined(POI_METAL) || defined(POI_CLEARCOAT)
		CalculateReflectionData();
	#endif
	#ifdef POI_DATA
		distanceFade(albedo);
	#endif
	#ifdef POI_RANDOM
		albedo.a *= i.angleAlpha;
	#endif
	#ifdef MATCAP
		applyMatcap(albedo, matcapEmission);
	#endif
	#ifdef PANOSPHERE
		applyPanosphereColor(albedo, panosphereEmission);
	#endif
	#ifdef POI_FLIPBOOK
		applyFlipbook(albedo, flipbookEmission);
	#endif
	#ifdef POI_GLITTER
		applyGlitter(albedo, glitterEmission);
	#endif
	#ifdef POI_RIM
		applyRimLighting(albedo, rimLightEmission);
	#endif
	#ifdef POI_DEPTH_COLOR
		applyDepthColor(albedo, depthTouchEmission, finalEmission, i.worldDirection);
	#endif
	#ifdef POI_IRIDESCENCE
		
		if (_IridescenceTime == 1)
		{
			applyIridescence(albedo, IridescenceEmission);
		}
	#endif
	#ifdef POI_VIDEO
		applyScreenEffect(albedo, videoEmission);
	#endif
	applySpawnIn(albedo, spawnInEmission, poiMesh.uv[0], poiMesh.localPos);
	
	if ((0.0 /*_Mode*/) == 1)
	{
		
		if ((0.0 /*_AlphaToMask*/) == 0)
		{
			applyDithering(albedo);
		}
	}
	albedo.a = max((0.0 /*_ForceOpaque*/), albedo.a);
	
	if ((0.0 /*_Mode*/) == 0)
	{
		albedo.a = 1;
	}
	
	if ((0.0 /*_Mode*/) >= 1)
	{
		clip(albedo.a - (0.5 /*_Cutoff*/));
	}
	
	if ((0.0 /*_AlphaPremultiply*/))
	{
		albedo.rgb *= saturate(albedo.a + 0.0000000001);
	}
	#ifdef POI_LIGHTING
		finalLighting = calculateFinalLighting(albedo.rgb, finalColor);
		finalLighting = max(finalLighting *= (1.0 /*_PPLightingMultiplier*/), 0);
		if (!(0.0 /*_LightingUncapped*/))
		{
			finalLighting = saturate(finalLighting);
		}
		#ifdef SUBSURFACE
			finalSSS = calculateSubsurfaceScattering();
		#endif
	#endif
	float4 finalColorBeforeLighting = albedo;
	finalColor = finalColorBeforeLighting;
	#ifdef POI_SPECULAR
		finalSpecular0 = calculateSpecular(finalColorBeforeLighting);
	#endif
	#ifdef POI_PARALLAX
		calculateAndApplyInternalParallax(finalColor);
	#endif
	#ifdef POI_ALPHA_TO_COVERAGE
		ApplyAlphaToCoverage(finalColor);
	#endif
	
	if ((0.0 /*_Mode*/) == 1)
	{
		
		if ((0.0 /*_AlphaToMask*/) == 1)
		{
			applyDithering(finalColor);
		}
	}
	#ifdef POI_METAL
		calculateMetallicness();
		bool probeExists = shouldMetalHappenBeforeLighting();
		
		if (!probeExists)
		{
			ApplyMetallicsFake(finalColor, albedo);
		}
	#endif
	#ifdef POI_LIGHTING
		emissionLighting = finalLighting;
		#if defined(FORWARD_ADD_PASS) && defined(POI_METAL)
			finalLighting *= 1 - metalicMap;
		#endif
		applyLighting(finalColor, finalLighting);
	#endif
	#ifdef POI_BRDF
		poiBRDF(finalColor, finalColorBeforeLighting);
	#endif
	#ifdef POI_METAL
		
		if (probeExists)
		{
			ApplyMetallics(finalColor, albedo);
		}
	#endif
	finalColor.rgb += finalSpecular0 + finalEnvironmentalRim + finalSSS;
	#ifdef FORWARD_BASE_PASS
		#ifdef POI_CLEARCOAT
			calculateAndApplyClearCoat(finalColor);
		#endif
	#endif
	finalColor.a = saturate(finalColor.a);
	finalEmission += finalColorBeforeLighting.rgb * (20.0 /*_MainEmissionStrength*/) * albedo.a;
	finalEmission += wireframeEmission;
	finalEmission += IridescenceEmission;
	finalEmission += spawnInEmission;
	finalEmission += voronoiEmission;
	finalEmission += matcapEmission;
	finalEmission += depthTouchEmission;
	finalEmission += decalEmission;
	finalEmission += glitterEmission;
	finalEmission += panosphereEmission;
	finalEmission += backFaceEmission;
	finalEmission += rimLightEmission;
	finalEmission += flipbookEmission;
	finalEmission += videoEmission;
	finalEmission += textOverlayEmission;
	finalEmission += dissolveEmission;
	finalEmission += pathEmission;
	#ifdef POI_EMISSION
		finalEmission += calculateEmissionNew(finalColorBeforeLighting.rgb, finalColor);
	#endif
	finalEmission = max(finalEmission * (1.0 /*_PPEmissionMultiplier*/), 0);
	#if defined(FORWARD_ADD_PASS)
		finalEmission *= emissionLighting; // TODO: add in vertex lights
	#else
		finalEmission *= max(1, emissionLighting);
	#endif
	#ifdef POI_META_PASS
		UnityMetaInput meta;
		UNITY_INITIALIZE_OUTPUT(UnityMetaInput, meta);
		meta.Emission = finalEmission * (1.0 /*_GIEmissionMultiplier*/);
		meta.Albedo = saturate(finalColor.rgb);
		#ifdef POI_SPECULAR
			meta.SpecularColor = poiLight.color.rgb * float4(1,1,1,1).rgb * lerp(1, albedo.rgb, (0.0 /*_SpecularMetallic*/)) * float4(1,1,1,1).a;
		#else
			meta.SpecularColor = poiLight.color.rgb * albedo.rgb;
		#endif
		return UnityMetaFragment(meta);
	#endif
	finalColor.rgb += finalEmission;
	
	if (_commentIfZero_EnableGrabpass)
	{
		applyGrabEffects(finalColor);
	}
	#ifdef FORWARD_BASE_PASS
		
		if ((0.0 /*_IgnoreFog*/) == 0)
		{
			UNITY_APPLY_FOG(i.fogCoord, finalColor);
		}
	#endif
	#ifdef FORWARD_ADD_PASS
		if ((0.0 /*_Mode*/) > 0)
		{
			finalColor.rgb *= finalColor.a;
		}
	#endif
	
	if ((0.0 /*_Mode*/) == 0)
	{
		finalColor.a = 1;
	}
	#ifdef FORWARD_ADD_PASS
	#endif
	#ifdef POI_DEBUG
		displayDebugInfo(finalColor);
	#endif
	#ifdef POI_AUDIOLINK
		
		if ((0.0 /*_AudioLinkTextureVisualization*/))
		{
			finalColor = poiMods.audioLinkTexture;
		}
	#endif
	#ifdef FORWARD_ADD_PASS
		#if defined(_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A) && defined(DIRECTIONAL)
			return finalColor + albedo * 0.00001;;
		#endif
	#endif
	return finalColor + mainTexture * 0.00001;
}
#endif

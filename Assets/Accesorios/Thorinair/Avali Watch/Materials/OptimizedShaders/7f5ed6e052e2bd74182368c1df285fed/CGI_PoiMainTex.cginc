#ifndef POI_MAINTEXTURE
#define POI_MAINTEXTURE
#if defined(PROP_CLIPPINGMASK) || !defined(OPTIMIZER_ENABLED)
    POI_TEXTURE_NOSAMPLER(_ClippingMask);
#endif
#if defined(PROP_MAINFADETEXTURE) || !defined(OPTIMIZER_ENABLED)
    POI_TEXTURE_NOSAMPLER(_MainFadeTexture);
#endif
float _Inverse_Clipping;
float4 _Color;
float _MainVertexColoring;
float _MainVertexColoringLinearSpace;
float _MainUseVertexColorAlpha;
float _Saturation;
float _MainDistanceFadeMin;
float _MainDistanceFadeMax;
half _MainMinAlpha;
half _MainMaxAlpha;
float _MainHueShift;
float _MainFadeType;
#ifdef COLOR_GRADING_HDR
    #if defined(PROP_MAINCOLORADJUSTTEXTURE) || !defined(OPTIMIZER_ENABLED)
        POI_TEXTURE_NOSAMPLER(_MainColorAdjustTexture);
    #endif
    float _MainHueShiftToggle;
    float _MainHueShiftSpeed;
    float _MainHueShiftReplace;
    float _MainSaturationShift;
    float _MainBrightness;
#endif
#ifdef FINALPASS
    #if defined(PROP_DETAILTEX) || !defined(OPTIMIZER_ENABLED)
        POI_TEXTURE_NOSAMPLER(_DetailTex);
    #endif
    half _DetailTexIntensity;
    half3 _DetailTint;
    float _DetailBrightness;
#endif
float alphaMask;
half3 diffColor;
#include "/CGI_PoiBackFace.cginc"
float3 wireframeEmission;
inline FragmentCommonData SpecularSetup(float4 i_tex, inout float4 albedo)
{
    half4 specGloss = 0;
    half3 specColor = specGloss.rgb;
    half smoothness = specGloss.a;
    half oneMinusReflectivity;
    diffColor = EnergyConservationBetweenDiffuseAndSpecular(albedo.rgb, specColor, /*out*/ oneMinusReflectivity);
    FragmentCommonData o = (FragmentCommonData)0;
    o.diffColor = diffColor;
    o.specColor = specColor;
    o.oneMinusReflectivity = oneMinusReflectivity;
    o.smoothness = smoothness;
    return o;
}
inline FragmentCommonData FragmentSetup(float4 i_tex, half3 i_viewDirForParallax, float3 i_posWorld, inout float4 albedo)
{
    i_tex = i_tex;
    FragmentCommonData o = SpecularSetup(i_tex, albedo);
    o.normalWorld = float3(0, 0, 0);
    o.eyeVec = poiCam.viewDir;
    o.posWorld = i_posWorld;
    o.diffColor = PreMultiplyAlpha(o.diffColor, 1, o.oneMinusReflectivity, /*out*/ o.alpha);
    return o;
}
void initTextureData(inout float4 albedo, inout float4 mainTexture, inout float3 backFaceEmission, inout float3 dissolveEmission, in half3 detailMask)
{
    dissolveEmission = 0;
    #if (defined(FORWARD_BASE_PASS) || defined(FORWARD_ADD_PASS))
        #ifdef POI_MIRROR
            applyMirrorTexture(mainTexture);
        #endif
    #endif
    #if defined(PROP_CLIPPINGMASK) || !defined(OPTIMIZER_ENABLED)
        alphaMask = POI2D_SAMPLER_PAN(_ClippingMask, _MainTex, poiMesh.uv[float(0)], float4(0,0,0,0)).r;
    #else
        alphaMask = 1;
    #endif
    if (float(0))
    {
        alphaMask = 1 - alphaMask;
    }
    mainTexture.a *= alphaMask;
    #ifndef POI_SHADOW
        float3 vertexColor = poiMesh.vertexColor.rgb;
        if(float(1))
        {
            vertexColor = GammaToLinearSpace(poiMesh.vertexColor.rgb);
        }
        albedo = float4(mainTexture.rgb * max(float4(0.1887741,0.01284029,0,0.6862745).rgb, float3(0.000000001, 0.000000001, 0.000000001)) * lerp(1, vertexColor, float(0)), mainTexture.a * max(float4(0.1887741,0.01284029,0,0.6862745).a, 0.0000001));
        #if defined(POI_LIGHTING) && defined(FORWARD_BASE_PASS)
            applyShadeMaps(albedo);
        #endif
        albedo *= lerp(1, poiMesh.vertexColor.a, float(0));
        #ifdef POI_RGBMASK
            albedo.rgb = calculateRGBMask(albedo.rgb);
        #endif
        albedo.a = saturate(float(-1) + albedo.a);
        wireframeEmission = 0;
        #ifdef POI_WIREFRAME
            applyWireframe(wireframeEmission, albedo);
        #endif
        float backFaceDetailIntensity = 1;
        float mixedHueShift = float(0);
        applyBackFaceTexture(backFaceDetailIntensity, mixedHueShift, albedo, backFaceEmission);
        #ifdef POI_FUR
            calculateFur();
        #endif
        #ifdef COLOR_GRADING_HDR
            #if defined(PROP_MAINCOLORADJUSTTEXTURE) || !defined(OPTIMIZER_ENABLED)
                float4 hueShiftAlpha = POI2D_SAMPLER_PAN(_MainColorAdjustTexture, _MainTex, poiMesh.uv[float(0)], float4(0,0,0,0));
            #else
                float4 hueShiftAlpha = 1;
            #endif
            if (float(1))
            {
                albedo.rgb = lerp(albedo.rgb, hueShift(albedo.rgb, mixedHueShift + float(0) * _Time.x), hueShiftAlpha.r);
            }
            else
            {
                albedo.rgb = hueShift(albedo.rgb, frac((mixedHueShift - (1 - hueShiftAlpha.r) + float(0) * _Time.x)));
            }
            albedo.rgb = lerp(albedo.rgb, dot(albedo.rgb, float3(0.3, 0.59, 0.11)), -float(0) * hueShiftAlpha.b);
            albedo.rgb = saturate(albedo.rgb + float(0) * hueShiftAlpha.g);
        #endif
        #ifdef FINALPASS
            #if defined(PROP_DETAILTEX) || !defined(OPTIMIZER_ENABLED)
                half3 detailTexture = POI2D_SAMPLER_PAN(_DetailTex, _MainTex, poiMesh.uv[float(0)], float4(0,0,0,0)).rgb * float4(1,1,1,1).rgb;
            #else
                half3 detailTexture = 0.21763764082 * float4(1,1,1,1).rgb;
            #endif
            albedo.rgb *= LerpWhiteTo(detailTexture * float(1) * unity_ColorSpaceDouble.rgb, detailMask.r * float(1) * backFaceDetailIntensity);
        #endif
        albedo.rgb = saturate(albedo.rgb);
        #ifdef POI_HOLOGRAM
            ApplyHoloAlpha(albedo);
        #endif
        s = FragmentSetup(float4(poiMesh.uv[0], 1, 1), poiCam.viewDir, poiMesh.worldPos, albedo);
    #endif
    #ifdef DISTORT
        calculateDissolve(albedo, dissolveEmission);
    #endif
}
void distanceFade(inout float4 albedo)
{
    #if defined(PROP_MAINFADETEXTURE) || !defined(OPTIMIZER_ENABLED)
        half fadeMap = POI2D_SAMPLER_PAN(_MainFadeTexture, _MainTex, poiMesh.uv[float(0)], float4(0,0,0,0)).r;
    #else
        half fadeMap = 1;
    #endif
    if (fadeMap)
    {
        float fadeDistance = float(1) ? poiCam.distanceToVert : poiCam.distanceToModel;
        half fadeValue = lerp(float(0), float(1), smoothstep(float(0), float(0), fadeDistance));
        albedo.a *= fadeValue;
    }
}
#endif

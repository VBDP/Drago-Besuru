#ifndef PANOSPHERE
    #define PANOSPHERE
    float _PanoEmission;
    float _PanoBlend;
    float4 _PanosphereColor;
    float3 _PanospherePan;
    float _PanoToggle;
    float _PanoCubeMapToggle;
    float _PanoInfiniteStereoToggle;
    float3 panoColor;
    float panoMask;
    #if defined(PROP_PANOSPHERETEXTURE) || !defined(OPTIMIZER_ENABLED)
        sampler2D _PanosphereTexture; float4 _PanosphereTexture_ST;
    #endif
    #if defined(PROP_PANOCUBEMAP) || !defined(OPTIMIZER_ENABLED)
        samplerCUBE _PanoCubeMap; half4 _PanoCubeMap_HDR;
    #endif
    #if defined(PROP_PANOMASK) || !defined(OPTIMIZER_ENABLED)
        POI_TEXTURE_NOSAMPLER(_PanoMask);
    #endif
    float2 projectIt(float3 coords)
    {
        float3 normalizedCoords = normalize(coords);
        float latitude = acos(normalizedCoords.y);
        float longitude = atan2(normalizedCoords.z, normalizedCoords.x);
        float2 sphereCoords = float2(longitude + _Time.y * float4(0,0,0,0).x, latitude + _Time.y * float4(0,0,0,0).y) * float2(1.0 / UNITY_PI, 1.0 / UNITY_PI);
        sphereCoords = float2(1.0, 1.0) - sphereCoords;
        return(sphereCoords + float4(0, 1 - unity_StereoEyeIndex, 1, 1.0).xy) * float4(0, 1 - unity_StereoEyeIndex, 1, 1.0).zw;
    }
    void applyPanosphereColor(inout float4 albedo, inout float3 panosphereEmission)
    {
        #if defined(PROP_PANOMASK) || !defined(OPTIMIZER_ENABLED)
            panoMask = POI2D_SAMPLER_PAN(_PanoMask, _MainTex, poiMesh.uv[float(0)], float4(0,0,0,0));
        #else
            panoMask = 1;
        #endif
        #ifdef POI_BLACKLIGHT
            if (_BlackLightMaskPanosphere != 4)
            {
                panoMask *= blackLightMask[_BlackLightMaskPanosphere];
            }
        #endif
        if(float(0))
        {
            #if defined(PROP_PANOCUBEMAP) || !defined(OPTIMIZER_ENABLED)
                float3 cubeUV = mul(poiRotationMatrixFromAngles(float4(0,0,0,0).xyz * _Time.y), float4(-poiCam.viewDir, 1));
                half4 cubemap = texCUBE(_PanoCubeMap, cubeUV);
                panoColor = DecodeHDR(cubemap, _PanoCubeMap_HDR) * float4(1,1,1,1).rgb;
            #else
                panoColor = float4(1,1,1,1).rgb;
            #endif
        }
        else
        {
            float2 uv = projectIt(normalize(lerp(getCameraPosition().xyz, poiCam.worldPos.xyz, float(0)) - poiMesh.worldPos.xyz) * - 1);
            float2 ddxuv = ddx(uv);
            float2 ddyuv = ddy(uv);
            if(any(fwidth(uv) > .5))
            {
                ddxuv = ddyuv = 0.001;
            }
            #if defined(PROP_PANOSPHERETEXTURE) || !defined(OPTIMIZER_ENABLED)
                panoColor = tex2D(_PanosphereTexture, TRANSFORM_TEX(uv, _PanosphereTexture), ddxuv, ddyuv).rgb * float4(1,1,1,1).rgb;
            #else
                panoColor = float4(1,1,1,1).rgb;
            #endif
        }
        panosphereEmission = panoColor * float(0) * panoMask * float(0);
        albedo.rgb = lerp(albedo.rgb, panoColor, float(0) * .9999999 * panoMask);
    }
#endif

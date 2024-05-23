// Made with Amplify Shader Editor v1.9.1.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "LightDiskShader"
{
	Properties
	{
		[NoScaleOffset]_Albido("Albido", 2D) = "white" {}
		[NoScaleOffset]_Emission("Emission", 2D) = "black" {}
		[NoScaleOffset]_Metallic("Metallic", 2D) = "white" {}
		[NoScaleOffset]_Roughness("Roughness", 2D) = "white" {}
		[NoScaleOffset][Normal]_Normal("Normal", 2D) = "white" {}
		[NoScaleOffset]_AO("AO", 2D) = "white" {}
		[NoScaleOffset][SingleLineTexture]_Lines("Lines", 2D) = "white" {}
		[HDR]_InnerRing("Inner Ring", Color) = (0,0,0,0)
		[HDR]_OuterRing("Outer Ring", Color) = (0,0,0,0)
		[HDR]_Dots("Dots", Color) = (0,0,0,0)
		[HDR]_RevealColor("Reveal Color", Color) = (0,0,0,0)
		_OuterRingIntensity("Outer Ring Intensity", Range( 0 , 50)) = 1
		_OuterRingOpacity("Outer Ring Opacity", Range( 0 , 1)) = 1
		_DotsIntensity("Dots Intensity", Range( 0 , 50)) = 1
		_RevealProgress("Reveal Progress", Range( 0 , 1)) = 0
		_RevealScale("Reveal Scale", Float) = 5
		[NoScaleOffset]_RevealNoise("Reveal Noise", 2D) = "white" {}
		_InnerRingProgress("Inner Ring Progress", Range( 0 , 1)) = 0
		[ToggleUI]_ActivateAudiolink("Activate Audiolink", Range( 0 , 1)) = 0
		_AudiolinkOverdrive("Audiolink Overdrive", Range( 1 , 10)) = 1
		_WaveformScanner("Waveform Scanner", Range( 1 , 4)) = 1
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+1" "IgnoreProjector" = "True" }
		Cull Off
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf StandardCustomLighting keepalpha noshadow vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
			float4 screenPosition;
			float3 worldNormal;
			INTERNAL_DATA
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform sampler2D _RevealNoise;
		uniform float _RevealScale;
		uniform float _RevealProgress;
		uniform float _OuterRingOpacity;
		uniform float4 _RevealColor;
		uniform sampler2D _Albido;
		uniform sampler2D _Normal;
		uniform sampler2D _Emission;
		uniform sampler2D _Metallic;
		uniform sampler2D _Roughness;
		uniform sampler2D _AO;
		uniform float4 _Dots;
		uniform float _DotsIntensity;
		uniform float4 _InnerRing;
		uniform sampler2D _Lines;
		uniform float _InnerRingProgress;
		uniform float _ActivateAudiolink;
		uniform float _WaveformScanner;
		uniform sampler2D _AudioTexture;
		uniform float _AudiolinkOverdrive;
		uniform float _OuterRingIntensity;
		uniform float4 _OuterRing;
		uniform float _Cutoff = 0.5;


		inline float Dither8x8Bayer( int x, int y )
		{
			const float dither[ 64 ] = {
				 1, 49, 13, 61,  4, 52, 16, 64,
				33, 17, 45, 29, 36, 20, 48, 32,
				 9, 57,  5, 53, 12, 60,  8, 56,
				41, 25, 37, 21, 44, 28, 40, 24,
				 3, 51, 15, 63,  2, 50, 14, 62,
				35, 19, 47, 31, 34, 18, 46, 30,
				11, 59,  7, 55, 10, 58,  6, 54,
				43, 27, 39, 23, 42, 26, 38, 22};
			int r = y * 8 + x;
			return dither[r] / 64; // same # of instructions as pre-dividing due to compiler magic
		}


		float2 voronoihash63( float2 p )
		{
			
			p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
			return frac( sin( p ) *43758.5453);
		}


		float voronoi63( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
		{
			float2 n = floor( v );
			float2 f = frac( v );
			float F1 = 8.0;
			float F2 = 8.0; float2 mg = 0;
			for ( int j = -2; j <= 2; j++ )
			{
				for ( int i = -2; i <= 2; i++ )
			 	{
			 		float2 g = float2( i, j );
			 		float2 o = voronoihash63( n + g );
					o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
					float d = 0.5 * dot( r, r );
			 		if( d<F1 ) {
			 			F2 = F1;
			 			F1 = d; mg = g; mr = r; id = o;
			 		} else if( d<F2 ) {
			 			F2 = d;
			
			 		}
			 	}
			}
			return F2;
		}


		float4 CalculateContrast( float contrastValue, float4 colorTarget )
		{
			float t = 0.5 * ( 1.0 - contrastValue );
			return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
		}

		struct Gradient
		{
			int type;
			int colorsLength;
			int alphasLength;
			float4 colors[8];
			float2 alphas[8];
		};


		Gradient NewGradient(int type, int colorsLength, int alphasLength, 
		float4 colors0, float4 colors1, float4 colors2, float4 colors3, float4 colors4, float4 colors5, float4 colors6, float4 colors7,
		float2 alphas0, float2 alphas1, float2 alphas2, float2 alphas3, float2 alphas4, float2 alphas5, float2 alphas6, float2 alphas7)
		{
			Gradient g;
			g.type = type;
			g.colorsLength = colorsLength;
			g.alphasLength = alphasLength;
			g.colors[ 0 ] = colors0;
			g.colors[ 1 ] = colors1;
			g.colors[ 2 ] = colors2;
			g.colors[ 3 ] = colors3;
			g.colors[ 4 ] = colors4;
			g.colors[ 5 ] = colors5;
			g.colors[ 6 ] = colors6;
			g.colors[ 7 ] = colors7;
			g.alphas[ 0 ] = alphas0;
			g.alphas[ 1 ] = alphas1;
			g.alphas[ 2 ] = alphas2;
			g.alphas[ 3 ] = alphas3;
			g.alphas[ 4 ] = alphas4;
			g.alphas[ 5 ] = alphas5;
			g.alphas[ 6 ] = alphas6;
			g.alphas[ 7 ] = alphas7;
			return g;
		}


		float4 SampleGradient( Gradient gradient, float time )
		{
			float3 color = gradient.colors[0].rgb;
			UNITY_UNROLL
			for (int c = 1; c < 8; c++)
			{
			float colorPos = saturate((time - gradient.colors[c-1].w) / ( 0.00001 + (gradient.colors[c].w - gradient.colors[c-1].w)) * step(c, (float)gradient.colorsLength-1));
			color = lerp(color, gradient.colors[c].rgb, lerp(colorPos, step(0.01, colorPos), gradient.type));
			}
			#ifndef UNITY_COLORSPACE_GAMMA
			color = half3(GammaToLinearSpaceExact(color.r), GammaToLinearSpaceExact(color.g), GammaToLinearSpaceExact(color.b));
			#endif
			float alpha = gradient.alphas[0].x;
			UNITY_UNROLL
			for (int a = 1; a < 8; a++)
			{
			float alphaPos = saturate((time - gradient.alphas[a-1].y) / ( 0.00001 + (gradient.alphas[a].y - gradient.alphas[a-1].y)) * step(a, (float)gradient.alphasLength-1));
			alpha = lerp(alpha, gradient.alphas[a].x, lerp(alphaPos, step(0.01, alphaPos), gradient.type));
			}
			return float4(color, alpha);
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float4 ase_screenPos = ComputeScreenPos( UnityObjectToClipPos( v.vertex ) );
			o.screenPosition = ase_screenPos;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float grayscale90 = dot(tex2D( _RevealNoise, ( i.uv_texcoord * _RevealScale ) ).rgb, float3(0.299,0.587,0.114));
			float temp_output_78_0 = ( grayscale90 - (0.7 + (_RevealProgress - 0.0) * (-1.1 - 0.7) / (1.0 - 0.0)) );
			float4 color2_g47 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
			float temp_output_123_9 = saturate( ( 1.0 - ( ( distance( color2_g47.rgb , i.vertexColor.rgb ) - 0.5 ) / max( 0.0 , 1E-05 ) ) ) );
			float4 color3_g47 = IsGammaSpace() ? float4(0,0,1,0) : float4(0,0,1,0);
			float temp_output_123_10 = saturate( ( 1.0 - ( ( distance( color3_g47.rgb , i.vertexColor.rgb ) - 0.5 ) / max( 0.0 , 1E-05 ) ) ) );
			float4 color4_g47 = IsGammaSpace() ? float4(0,1,1,0) : float4(0,1,1,0);
			float temp_output_123_11 = saturate( ( 1.0 - ( ( distance( color4_g47.rgb , i.vertexColor.rgb ) - 0.5 ) / max( 0.0 , 1E-05 ) ) ) );
			float4 color1_g47 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
			float4 ase_screenPos = i.screenPosition;
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 clipScreen133 = ase_screenPosNorm.xy * _ScreenParams.xy;
			float dither133 = Dither8x8Bayer( fmod(clipScreen133.x, 8), fmod(clipScreen133.y, 8) );
			float time63 = 0.0;
			float2 voronoiSmoothId63 = 0;
			float2 panner60 = ( -1.0 * _Time.y * float2( 1,0 ) + float2( 0,0 ));
			float2 uv_TexCoord61 = i.uv_texcoord * float2( 1,5.61 ) + panner60;
			float2 coords63 = uv_TexCoord61 * 1.0;
			float2 id63 = 0;
			float2 uv63 = 0;
			float fade63 = 0.5;
			float voroi63 = 0;
			float rest63 = 0;
			for( int it63 = 0; it63 <5; it63++ ){
			voroi63 += fade63 * voronoi63( coords63, time63, id63, uv63, 0,voronoiSmoothId63 );
			rest63 += fade63;
			coords63 *= 2;
			fade63 *= 0.5;
			}//Voronoi63
			voroi63 /= rest63;
			float temp_output_55_0 = ( 1.0 - i.uv_texcoord.x );
			float temp_output_65_0 = saturate( ( ( voroi63 * temp_output_55_0 * 0.15 ) - 0.01 ) );
			float temp_output_51_0 = saturate( ( temp_output_65_0 + ( temp_output_65_0 * saturate( ( temp_output_55_0 - 0.7 ) ) * 10.0 ) ) );
			float Edge137 = temp_output_51_0;
			float4 temp_cast_9 = (Edge137).xxxx;
			dither133 = step( dither133, saturate( ( temp_output_123_9 + temp_output_123_10 + temp_output_123_11 + ( saturate( CalculateContrast(50.0,temp_cast_9) ) * _RevealProgress * _OuterRingOpacity ) ) ).r );
			float4 color3_g40 = IsGammaSpace() ? float4(0,0,1,0) : float4(0,0,1,0);
			float temp_output_22_10 = saturate( ( 1.0 - ( ( distance( color3_g40.rgb , i.vertexColor.rgb ) - 0.5 ) / max( 0.0 , 1E-05 ) ) ) );
			SurfaceOutputStandard s1 = (SurfaceOutputStandard ) 0;
			float2 uv_Albido3 = i.uv_texcoord;
			s1.Albedo = tex2D( _Albido, uv_Albido3 ).rgb;
			float2 uv_Normal17 = i.uv_texcoord;
			s1.Normal = normalize( WorldNormalVector( i , UnpackNormal( tex2D( _Normal, uv_Normal17 ) ) ) );
			float2 uv_Emission7 = i.uv_texcoord;
			s1.Emission = tex2D( _Emission, uv_Emission7 ).rgb;
			float2 uv_Metallic8 = i.uv_texcoord;
			s1.Metallic = tex2D( _Metallic, uv_Metallic8 ).r;
			float2 uv_Roughness10 = i.uv_texcoord;
			s1.Smoothness = tex2D( _Roughness, uv_Roughness10 ).r;
			float2 uv_AO13 = i.uv_texcoord;
			s1.Occlusion = tex2D( _AO, uv_AO13 ).r;

			data.light = gi.light;

			UnityGI gi1 = gi;
			#ifdef UNITY_PASS_FORWARDBASE
			Unity_GlossyEnvironmentData g1 = UnityGlossyEnvironmentSetup( s1.Smoothness, data.worldViewDir, s1.Normal, float3(0,0,0));
			gi1 = UnityGlobalIllumination( data, s1.Occlusion, s1.Normal, g1 );
			#endif

			float3 surfResult1 = LightingStandard ( s1, viewDir, gi1 ).rgb;
			surfResult1 += s1.Emission;

			#ifdef UNITY_PASS_FORWARDADD//1
			surfResult1 -= s1.Emission;
			#endif//1
			float4 color4_g40 = IsGammaSpace() ? float4(0,1,1,0) : float4(0,1,1,0);
			float2 uv_Lines66 = i.uv_texcoord;
			float4 temp_cast_21 = (( tex2D( _Lines, uv_Lines66 ).g - 0.25 )).xxxx;
			Gradient gradient29 = NewGradient( 1, 8, 2, float4( 1, 1, 1, 0.1100023 ), float4( 0.9, 0.9, 0.9, 0.2333867 ), float4( 0.8, 0.8, 0.8, 0.3577478 ), float4( 0.7, 0.7, 0.7, 0.4923323 ), float4( 0.6, 0.6, 0.6, 0.6269169 ), float4( 0.5, 0.5, 0.5, 0.7495689 ), float4( 0.4, 0.4, 0.4, 0.87393 ), float4( 0.3, 0.3, 0.3, 1 ), float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
			float4 temp_cast_22 = (( 1.0 - (-26.0 + (_InnerRingProgress - 0.0) * (26.0 - -26.0) / (1.0 - 0.0)) )).xxxx;
			float ALActivation91_g32 = _ActivateAudiolink;
			float DefaultIntensity115_g32 = 1.0;
			float2 uv_TexCoord24_g32 = i.uv_texcoord * float2( 0,0 ) + float2( 0.1173,0.455 );
			float grayscale20_g32 = dot(tex2D( _AudioTexture, uv_TexCoord24_g32 ).rgb, float3(0.299,0.587,0.114));
			float ALController41_g32 = ( _ActivateAudiolink * 1.0 * _AudiolinkOverdrive );
			float temp_output_37_0_g32 = ( grayscale20_g32 * ALController41_g32 );
			float LMids56_g32 = temp_output_37_0_g32;
			float2 uv_TexCoord16_g32 = i.uv_texcoord * float2( 0,0 ) + float2( 0.1173,0.44 );
			float grayscale18_g32 = dot(tex2D( _AudioTexture, uv_TexCoord16_g32 ).rgb, float3(0.299,0.587,0.114));
			float temp_output_36_0_g32 = ( grayscale18_g32 * ALController41_g32 );
			float Bass55_g32 = temp_output_36_0_g32;
			float clampResult78_g32 = clamp( _WaveformScanner , 3.0 , 4.0 );
			float lerpResult64_g32 = lerp( LMids56_g32 , Bass55_g32 , (0.0 + (clampResult78_g32 - 3.0) * (1.0 - 0.0) / (4.0 - 3.0)));
			float2 uv_TexCoord32_g32 = i.uv_texcoord * float2( 0,0 ) + float2( 0.1173,0.485 );
			float grayscale30_g32 = dot(tex2D( _AudioTexture, uv_TexCoord32_g32 ).rgb, float3(0.299,0.587,0.114));
			float temp_output_39_0_g32 = ( grayscale30_g32 * ALController41_g32 );
			float Treble58_g32 = temp_output_39_0_g32;
			float2 uv_TexCoord28_g32 = i.uv_texcoord * float2( 0,0 ) + float2( 0.1173,0.47 );
			float grayscale26_g32 = dot(tex2D( _AudioTexture, uv_TexCoord28_g32 ).rgb, float3(0.299,0.587,0.114));
			float temp_output_38_0_g32 = ( grayscale26_g32 * ALController41_g32 );
			float HMids57_g32 = temp_output_38_0_g32;
			float clampResult77_g32 = clamp( _WaveformScanner , 1.0 , 2.0 );
			float lerpResult63_g32 = lerp( Treble58_g32 , HMids57_g32 , (0.0 + (clampResult77_g32 - 1.0) * (1.0 - 0.0) / (2.0 - 1.0)));
			float ifLocalVar84_g32 = 0;
			if( _WaveformScanner > 2.9 )
				ifLocalVar84_g32 = lerpResult64_g32;
			else if( _WaveformScanner < 2.9 )
				ifLocalVar84_g32 = lerpResult63_g32;
			float ifLocalVar112_g32 = 0;
			if( 0.5 > ALActivation91_g32 )
				ifLocalVar112_g32 = DefaultIntensity115_g32;
			else if( 0.5 < ALActivation91_g32 )
				ifLocalVar112_g32 = ifLocalVar84_g32;
			float4 color2_g33 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
			float4 color1_g33 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
			float Reveal127 = saturate( (-0.2 + (_RevealProgress - 0.0) * (1.0 - -0.2) / (1.0 - 0.0)) );
			c.rgb = ( ( saturate( ( ( 1.0 - temp_output_78_0 ) - 0.05 ) ) * _RevealColor * temp_output_22_10 ) + ( float4( ( surfResult1 * temp_output_22_10 ) , 0.0 ) + ( _Dots * saturate( ( 1.0 - ( ( distance( color4_g40.rgb , i.vertexColor.rgb ) - 0.5 ) / max( 0.0 , 1E-05 ) ) ) ) * _DotsIntensity ) + ( ( ( _InnerRing * ( saturate( CalculateContrast(2.0,temp_cast_21) ) * ( saturate( saturate( ( CalculateContrast(50.0,SampleGradient( gradient29, ( 1.0 - i.uv_texcoord.y ) )) - temp_cast_22 ) ) ) * ifLocalVar112_g32 ) ) ) * saturate( ( 1.0 - ( ( distance( color2_g33.rgb , i.vertexColor.rgb ) - 0.5 ) / max( 0.0 , 1E-05 ) ) ) ) ) + ( saturate( ( 1.0 - ( ( distance( color1_g33.rgb , i.vertexColor.rgb ) - 0.5 ) / max( 0.0 , 1E-05 ) ) ) ) * saturate( ( temp_output_51_0 * Reveal127 * _OuterRingIntensity ) ) * _OuterRing ) ) ) ).rgb;
			c.a = 1;
			clip( ( ( ( temp_output_78_0 * ( temp_output_123_9 + temp_output_123_10 + temp_output_123_11 ) ) + saturate( ( 1.0 - ( ( distance( color1_g47.rgb , i.vertexColor.rgb ) - 0.5 ) / max( 0.0 , 1E-05 ) ) ) ) ) * dither133 ) - _Cutoff );
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			o.Normal = float3(0,0,1);
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19108
Node;AmplifyShaderEditor.CustomStandardSurface;1;-540.5037,264.8509;Inherit;False;Metallic;Tangent;6;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,1;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-1010.468,1714.708;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;24;-1235.468,1413.708;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GradientSampleNode;25;-2149.47,1331.708;Inherit;True;2;0;OBJECT;;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;26;-2589.47,1384.708;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;27;-2345.47,1424.708;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-856.3775,1491.314;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GradientNode;29;-2584.47,1307.708;Inherit;False;1;8;2;1,1,1,0.1100023;0.9,0.9,0.9,0.2333867;0.8,0.8,0.8,0.3577478;0.7,0.7,0.7,0.4923323;0.6,0.6,0.6,0.6269169;0.5,0.5,0.5,0.7495689;0.4,0.4,0.4,0.87393;0.3,0.3,0.3,1;1,0;1,1;0;1;OBJECT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;30;-1640.468,1372.708;Inherit;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;31;-1455.567,1376.743;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;32;-1844.525,1344.371;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;50;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;33;-1836.7,1528.69;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;34;-2049.255,1577.95;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-26;False;4;FLOAT;26;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;39;-460.6211,1488.166;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-472.7211,1939.267;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;42;-271.2204,1529.766;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;43;-1139.62,1956.167;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;54;-2085.629,2985.673;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;55;-1854.828,3008.873;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;56;-1632.466,3019.387;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;58;-1782.428,2497.273;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-1947.429,2798.273;Inherit;False;Constant;_Float2;Float 1;5;0;Create;True;0;0;0;False;0;False;0.15;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;60;-2398.431,2559.273;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;1,0;False;1;FLOAT;-1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;61;-2210.431,2493.273;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,5.61;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;62;-1561.864,2496.587;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;63;-1973.829,2494.973;Inherit;True;1;0;1;1;5;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.RangedFloatNode;64;-1676.264,2778.688;Inherit;False;Constant;_Float3;Float 2;6;0;Create;True;0;0;0;False;0;False;0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;65;-1289.056,2505.072;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;67;-1150.939,1298.422;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;68;-1467.939,1130.422;Inherit;True;2;1;COLOR;0,0,0,0;False;0;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;69;-1606.939,1130.422;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.25;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;70;-1529.263,1674.988;Inherit;False;AudioLinkBreakoutBoard;18;;32;93b201c8e07859e4492c8e3122af15be;0;0;8;FLOAT;130;FLOAT;0;FLOAT;13;FLOAT;74;FLOAT;31;FLOAT;27;FLOAT;21;FLOAT;14
Node;AmplifyShaderEditor.ColorNode;72;-518.3504,675.9024;Inherit;False;Property;_Dots;Dots;9;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,9.848229,68.59351,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;75;-736.2452,1606.879;Inherit;False;Vertex_Mask_RGBCMY;-1;;33;4719ed29f2b417d458af6e4d8ab99fdf;0;0;6;FLOAT;0;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13
Node;AmplifyShaderEditor.TFHCGrayscale;90;-47.17712,-56.15024;Inherit;False;1;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;78;236.8229,-35.15024;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;91;468.8229,-114.1502;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;83;733.8229,250.8498;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;97;840.8229,169.8498;Inherit;False;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;100;869.8229,-49.15024;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;119;-712.7742,-156.8999;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;102;-482.1771,-55.15024;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;1039.813,113.9751;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;121;1001.413,454.7748;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;74;-189.5908,573.8694;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;71;181.2093,267.9948;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;22;-529.1957,480.8734;Inherit;False;Vertex_Mask_RGBCMY;-1;;40;4719ed29f2b417d458af6e4d8ab99fdf;0;0;6;FLOAT;0;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13
Node;AmplifyShaderEditor.FunctionNode;123;292.6126,528.3752;Inherit;False;Vertex_Mask_RGBCMY;-1;;47;4719ed29f2b417d458af6e4d8ab99fdf;0;0;6;FLOAT;0;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13
Node;AmplifyShaderEditor.SimpleAddOpNode;122;731.0109,395.5753;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;128;-1011.899,2784.765;Inherit;False;127;Reveal;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;131;56.11749,188.3627;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-1028.503,-129.1494;Inherit;True;Property;_Albido;Albido;0;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;11683e9785f7aae41a3bf89c3ecaaee7;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;7;-1015.591,269.5345;Inherit;True;Property;_Emission;Emission;1;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;8;-1017.275,458.0785;Inherit;True;Property;_Metallic;Metallic;2;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;cc2f4c7e1b7f2be4095794c755e4ae99;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;10;-1014.434,653.9195;Inherit;True;Property;_Roughness;Roughness;3;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;155caec4262400d4789915b63ee5e44a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;13;-1018.503,856.8508;Inherit;True;Property;_AO;AO;5;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;219e64d7dc6e674459a8b57a53fa9416;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;66;-1909.992,1081.184;Inherit;True;Property;_Lines;Lines;6;2;[NoScaleOffset];[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;None;5d7e3e9198db6334dbcfd61d51d86e3b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;98;509.8229,148.8498;Inherit;False;Property;_RevealColor;Reveal Color;10;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,3.155892,23.96863,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;132;-664.4048,1415.724;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;37;-923.2559,1264.95;Inherit;False;Property;_InnerRing;Inner Ring;7;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,25.37745,102.7557,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;77;-331.1771,-54.15024;Inherit;True;Property;_TextureFade;Texture Fade;18;2;[HDR];[Gamma];Create;True;0;0;0;False;0;False;-1;None;64111079ee503e74a8fe5d7c2ef3784b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;117;-671.7742,-440.8999;Inherit;True;Property;_RevealNoise;Reveal Noise;16;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;64111079ee503e74a8fe5d7c2ef3784b;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;35;-2373.47,1572.708;Inherit;False;Property;_InnerRingProgress;Inner Ring Progress;17;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;103;-661.1771,-29.15024;Inherit;False;Property;_RevealScale;Reveal Scale;15;0;Create;True;0;0;0;False;0;False;5;4.18;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-398.8494,147.2005;Inherit;False;Property;_RevealProgress;Reveal Progress;14;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1469.214,15.32834;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;LightDiskShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Masked;0.5;True;False;1;False;TransparentCutout;;AlphaTest;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;0;5;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;25;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;134;1209.307,455.3524;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;135;629.0478,660.1065;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;136;767.0764,659.0878;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;144;487.4955,859.978;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;-698.6658,2579.589;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;137;-384.3,2486.737;Inherit;False;Edge;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;141;-1011.403,2865.681;Inherit;False;Property;_OuterRingIntensity;Outer Ring Intensity;11;0;Create;True;0;0;0;False;0;False;1;1;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;145;-520.3903,863.8496;Inherit;False;Property;_DotsIntensity;Dots Intensity;13;0;Create;True;0;0;0;False;0;False;1;1;0;50;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;51;-888.4656,2495.087;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;146;-564.579,2577.998;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;52;-786.7433,1935.012;Inherit;False;Property;_OuterRing;Outer Ring;8;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,2.041815,19.46857,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-282.5521,266.6207;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;138;145.4075,853.064;Inherit;False;137;Edge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;127;187.8385,186.0918;Inherit;False;Reveal;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;53;-1097.499,2500.575;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;57;-1391.276,3007.463;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;149;-1265.699,2779.15;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;150;-1487.699,2845.15;Inherit;False;Constant;_Float4;Float 4;19;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DitheringNode;133;1061.143,651.6474;Inherit;False;1;False;4;0;FLOAT;0;False;1;SAMPLER2D;;False;2;FLOAT4;0,0,0,0;False;3;SAMPLERSTATE;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;139;307.7504,858.7927;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;50;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;99;633.8229,-132.1502;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;148;633.5496,909.3575;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;152;346.5109,1017.217;Inherit;False;Property;_OuterRingOpacity;Outer Ring Opacity;12;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;125;51.9586,18.66451;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.7;False;4;FLOAT;-1.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;130;-117.8825,181.3627;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-0.2;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;17;-1024.407,71.92033;Inherit;True;Property;_TextureSample0;Texture Sample 0;7;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;15;-1260.409,70.46455;Inherit;True;Property;_Normal;Normal;4;2;[NoScaleOffset];[Normal];Create;True;0;0;0;False;0;False;None;83c64bff8a6c3d642b5bcd33fe14eaf9;True;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
WireConnection;1;0;3;0
WireConnection;1;1;17;0
WireConnection;1;2;7;0
WireConnection;1;3;8;0
WireConnection;1;4;10;0
WireConnection;1;5;13;0
WireConnection;23;0;24;0
WireConnection;23;1;70;74
WireConnection;24;0;31;0
WireConnection;25;0;29;0
WireConnection;25;1;27;0
WireConnection;27;0;26;2
WireConnection;28;0;67;0
WireConnection;28;1;23;0
WireConnection;30;0;32;0
WireConnection;30;1;33;0
WireConnection;31;0;30;0
WireConnection;32;1;25;0
WireConnection;33;0;34;0
WireConnection;34;0;35;0
WireConnection;39;0;132;0
WireConnection;39;1;75;9
WireConnection;41;0;75;0
WireConnection;41;1;146;0
WireConnection;41;2;52;0
WireConnection;42;0;39;0
WireConnection;42;1;41;0
WireConnection;55;0;54;1
WireConnection;56;0;55;0
WireConnection;58;0;63;0
WireConnection;58;1;55;0
WireConnection;58;2;59;0
WireConnection;61;1;60;0
WireConnection;62;0;58;0
WireConnection;62;1;64;0
WireConnection;63;0;61;0
WireConnection;65;0;62;0
WireConnection;67;0;68;0
WireConnection;68;1;69;0
WireConnection;69;0;66;2
WireConnection;90;0;77;0
WireConnection;78;0;90;0
WireConnection;78;1;125;0
WireConnection;91;0;78;0
WireConnection;83;0;97;0
WireConnection;83;1;71;0
WireConnection;97;0;100;0
WireConnection;97;1;98;0
WireConnection;97;2;22;10
WireConnection;100;0;99;0
WireConnection;102;0;119;0
WireConnection;102;1;103;0
WireConnection;120;0;78;0
WireConnection;120;1;122;0
WireConnection;121;0;120;0
WireConnection;121;1;123;0
WireConnection;74;0;72;0
WireConnection;74;1;22;11
WireConnection;74;2;145;0
WireConnection;71;0;19;0
WireConnection;71;1;74;0
WireConnection;71;2;42;0
WireConnection;122;0;123;9
WireConnection;122;1;123;10
WireConnection;122;2;123;11
WireConnection;131;0;130;0
WireConnection;132;0;37;0
WireConnection;132;1;28;0
WireConnection;77;0;117;0
WireConnection;77;1;102;0
WireConnection;0;10;134;0
WireConnection;0;13;83;0
WireConnection;134;0;121;0
WireConnection;134;1;133;0
WireConnection;135;0;123;9
WireConnection;135;1;123;10
WireConnection;135;2;123;11
WireConnection;135;3;148;0
WireConnection;136;0;135;0
WireConnection;144;0;139;0
WireConnection;50;0;51;0
WireConnection;50;1;128;0
WireConnection;50;2;141;0
WireConnection;137;0;51;0
WireConnection;51;0;53;0
WireConnection;146;0;50;0
WireConnection;19;0;1;0
WireConnection;19;1;22;10
WireConnection;127;0;131;0
WireConnection;53;0;65;0
WireConnection;53;1;149;0
WireConnection;57;0;56;0
WireConnection;149;0;65;0
WireConnection;149;1;57;0
WireConnection;149;2;150;0
WireConnection;133;0;136;0
WireConnection;139;1;138;0
WireConnection;99;0;91;0
WireConnection;148;0;144;0
WireConnection;148;1;79;0
WireConnection;148;2;152;0
WireConnection;125;0;79;0
WireConnection;130;0;79;0
WireConnection;17;0;15;0
ASEEND*/
//CHKSM=3EA7DF5A543F9320573E06141E54D878CCABF5A3
// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SpellSystem/Shield"
{
	Properties
	{
		_NoiseScale("Noise Scale", Float) = 1
		_Offset("Offset", Float) = 0.5
		_Value("Value", Range( 0 , 0.8)) = 0.8
		_TimeScale("Time Scale", Float) = 1
		_Float0("Float 0", Float) = 0.02
		_Edge("Edge", Range( 0 , 1)) = 0.21
		_InnerOpacity("Inner Opacity", Range( 0 , 1)) = 0.5
		_EdgeEmission("Edge Emission", Float) = 1
		_EmissionColor("Emission Color", Color) = (1,0,0,0)
		_InnerEmission("Inner Emission", Float) = 1
		_EdgeColor("Edge Color", Color) = (1,1,1,0)
		_VoronoiSpeed("Voronoi Speed", Float) = 1
		_VoronoiSize("Voronoi Size", Float) = 1
		_VoronoiRemap("Voronoi Remap", Vector) = (0.25,1,0,0)
		_StepOffset("StepOffset", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit alpha:fade keepalpha noshadow noambient novertexlights 
		struct Input
		{
			float2 uv_texcoord;
			float4 screenPos;
		};

		uniform float _VoronoiSize;
		uniform float _VoronoiSpeed;
		uniform float2 _VoronoiRemap;
		uniform float4 _EmissionColor;
		uniform float _InnerEmission;
		uniform float _TimeScale;
		uniform float _NoiseScale;
		uniform float _Float0;
		uniform float _Edge;
		uniform float _Value;
		uniform float _EdgeEmission;
		uniform float4 _EdgeColor;
		uniform float _InnerOpacity;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _Offset;
		uniform float _StepOffset;


		float2 voronoihash87( float2 p )
		{
			
			p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
			return frac( sin( p ) *43758.5453);
		}


		float voronoi87( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
		{
			float2 n = floor( v );
			float2 f = frac( v );
			float F1 = 8.0;
			float F2 = 8.0; float2 mg = 0;
			for ( int j = -1; j <= 1; j++ )
			{
				for ( int i = -1; i <= 1; i++ )
			 	{
			 		float2 g = float2( i, j );
			 		float2 o = voronoihash87( n + g );
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
			return F1;
		}


		float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }

		float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }

		float snoise( float2 v )
		{
			const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
			float2 i = floor( v + dot( v, C.yy ) );
			float2 x0 = v - i + dot( i, C.xx );
			float2 i1;
			i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
			float4 x12 = x0.xyxy + C.xxzz;
			x12.xy -= i1;
			i = mod2D289( i );
			float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
			float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
			m = m * m;
			m = m * m;
			float3 x = 2.0 * frac( p * C.www ) - 1.0;
			float3 h = abs( x ) - 0.5;
			float3 ox = floor( x + 0.5 );
			float3 a0 = x - ox;
			m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
			float3 g;
			g.x = a0.x * x0.x + h.x * x0.y;
			g.yz = a0.yz * x12.xz + h.yz * x12.yw;
			return 130.0 * dot( m, g );
		}


		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float mulTime86 = _Time.y * _VoronoiSpeed;
			float time87 = mulTime86;
			float2 voronoiSmoothId87 = 0;
			float2 coords87 = i.uv_texcoord * _VoronoiSize;
			float2 id87 = 0;
			float2 uv87 = 0;
			float voroi87 = voronoi87( coords87, time87, id87, uv87, 0, voronoiSmoothId87 );
			float temp_output_88_0 = (_VoronoiRemap.x + (voroi87 - 0.0) * (_VoronoiRemap.y - _VoronoiRemap.x) / (1.0 - 0.0));
			float mulTime37 = _Time.y * _TimeScale;
			float2 temp_cast_0 = (mulTime37).xx;
			float2 uv_TexCoord22 = i.uv_texcoord + temp_cast_0;
			float simplePerlin2D20 = snoise( uv_TexCoord22*_NoiseScale );
			float2 temp_output_48_0 = ( ( simplePerlin2D20 * _Float0 ) + i.uv_texcoord );
			float clampResult77 = clamp( ( ( _Edge * -1.0 ) + _Value ) , 0.0 , 1000.0 );
			float2 appendResult11_g8 = (float2(clampResult77 , clampResult77));
			float temp_output_17_0_g8 = length( ( (temp_output_48_0*2.0 + -1.0) / appendResult11_g8 ) );
			float temp_output_43_0 = saturate( ( ( 1.0 - temp_output_17_0_g8 ) / fwidth( temp_output_17_0_g8 ) ) );
			float2 appendResult11_g7 = (float2(_Value , _Value));
			float temp_output_17_0_g7 = length( ( (temp_output_48_0*2.0 + -1.0) / appendResult11_g7 ) );
			float temp_output_55_0 = ( saturate( ( ( 1.0 - temp_output_17_0_g7 ) / fwidth( temp_output_17_0_g7 ) ) ) - temp_output_43_0 );
			o.Emission = ( temp_output_88_0 * ( ( _EmissionColor * ( _InnerEmission * temp_output_43_0 ) ) + ( ( temp_output_55_0 * _EdgeEmission ) * _EdgeColor ) ) ).rgb;
			float clampResult58 = clamp( ( temp_output_43_0 - ( 1.0 - _InnerOpacity ) ) , 0.0 , 1.0 );
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float eyeDepth98 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float temp_output_105_0 = ( 1.0 - ( ( eyeDepth98 * 1.0 ) - ( ase_screenPos.w - _Offset ) ) );
			o.Alpha = ( ( temp_output_88_0 * ( ( temp_output_88_0 * clampResult58 ) + ( temp_output_55_0 + ( temp_output_55_0 + ( temp_output_43_0 * ( 1.0 - step( temp_output_105_0 , _StepOffset ) ) ) ) ) ) ) + 0.0 );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18935
475;73;1452;768;1532.434;851.2924;2.620867;True;True
Node;AmplifyShaderEditor.RangedFloatNode;40;-2570.183,-481.5432;Inherit;False;Property;_TimeScale;Time Scale;3;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;103;-2221.824,1556.458;Inherit;True;Property;_Offset;Offset;1;0;Create;True;0;0;0;False;0;False;0.5;0.6;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;99;-2335.319,1314.044;Float;True;1;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenDepthNode;98;-2278.368,956.5177;Inherit;False;0;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;100;-2271.983,1087.874;Inherit;True;Constant;_Float1;Float 1;0;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;37;-2355.837,-456.234;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;54;-1981.135,282.459;Inherit;False;Property;_Edge;Edge;5;0;Create;True;0;0;0;False;0;False;0.21;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;22;-2138.343,-497.1984;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;39;-2148.691,-211.3932;Inherit;False;Property;_NoiseScale;Noise Scale;0;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;102;-1968.871,1351.936;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;-2077.876,1035.529;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;104;-1748.2,1322.645;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;-1652.714,299.8742;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;49;-1410.449,557.7305;Inherit;False;Property;_Value;Value;2;0;Create;True;0;0;0;False;0;False;0.8;0;0;0.8;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-1782.031,-215.763;Inherit;False;Property;_Float0;Float 0;4;0;Create;True;0;0;0;False;0;False;0.02;0.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NoiseGeneratorNode;20;-1848.282,-439.0396;Inherit;False;Simplex2D;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;42;-1821.978,13.67558;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-1584.08,-378.2388;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;75;-1442.364,137.9987;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;105;-1540.796,1320.468;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-1529.202,987.0576;Inherit;False;Property;_StepOffset;StepOffset;14;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;77;-1231.514,55.47424;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1000;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;57;-1065.419,130.687;Inherit;False;Property;_InnerOpacity;Inner Opacity;6;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-310.8506,-848.9919;Inherit;False;Property;_VoronoiSpeed;Voronoi Speed;11;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;110;-1262.035,964.7183;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;48;-1389.083,-149.7855;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;43;-914.5728,-99.43777;Inherit;False;Ellipse;-1;;8;3ba94b7b3cfd5f447befde8107c04d52;0;3;2;FLOAT2;0,0;False;7;FLOAT;0.5;False;9;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;86;-55.18848,-668.7048;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;52;-945.7048,359.3099;Inherit;False;Ellipse;-1;;7;3ba94b7b3cfd5f447befde8107c04d52;0;3;2;FLOAT2;0,0;False;7;FLOAT;0.5;False;9;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;59;-803.6134,128.3099;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;112;-995.2607,936.8076;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;92;147.1494,-795.9919;Inherit;False;Property;_VoronoiSize;Voronoi Size;12;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;55;-641.7048,299.3099;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;108;-710.3601,860.5421;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;56;-588.7048,-6.690063;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;87;413.217,-661.9137;Inherit;False;0;0;1;0;1;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;1;False;2;FLOAT;5;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.Vector2Node;94;276.1494,-250.9919;Inherit;False;Property;_VoronoiRemap;Voronoi Remap;13;0;Create;True;0;0;0;False;0;False;0.25,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TFHCRemapNode;88;601.217,-268.9137;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.25;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-413.4979,832.5057;Inherit;False;Property;_EdgeEmission;Edge Emission;7;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;114;-441.8941,613.7724;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;64;-694.7048,-394.6901;Inherit;False;Property;_InnerEmission;Inner Emission;9;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;58;-356.7048,80.30994;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;81;-218.6803,855.7807;Inherit;False;Property;_EdgeColor;Edge Color;10;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;60;-189.9923,559.3439;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;115;-181.8153,303.0978;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;90;-47.70293,59.42869;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;65;-422.4832,-244.5883;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;68;-331.342,-494.1711;Inherit;False;Property;_EmissionColor;Emission Color;8;0;Create;True;0;0;0;False;0;False;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;67;-96.53933,-366.1169;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;51;186.0408,268.993;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;80;131.5967,700.7047;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;89;874.7626,226.1476;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;66;501.3781,41.59847;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;106;652.498,578.4094;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;109;-1176.702,1295.212;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;107;1235.75,300.2258;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;85;184.0898,-525.6389;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;84;883.89,-110.8388;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1554.915,-19.74524;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;SpellSystem/Shield;False;False;False;False;True;True;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;False;0;False;Transparent;;Transparent;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;37;0;40;0
WireConnection;22;1;37;0
WireConnection;102;0;99;4
WireConnection;102;1;103;0
WireConnection;101;0;98;0
WireConnection;101;1;100;0
WireConnection;104;0;101;0
WireConnection;104;1;102;0
WireConnection;79;0;54;0
WireConnection;20;0;22;0
WireConnection;20;1;39;0
WireConnection;47;0;20;0
WireConnection;47;1;33;0
WireConnection;75;0;79;0
WireConnection;75;1;49;0
WireConnection;105;0;104;0
WireConnection;77;0;75;0
WireConnection;110;0;105;0
WireConnection;110;1;111;0
WireConnection;48;0;47;0
WireConnection;48;1;42;0
WireConnection;43;2;48;0
WireConnection;43;7;77;0
WireConnection;43;9;77;0
WireConnection;86;0;91;0
WireConnection;52;2;48;0
WireConnection;52;7;49;0
WireConnection;52;9;49;0
WireConnection;59;0;57;0
WireConnection;112;0;110;0
WireConnection;55;0;52;0
WireConnection;55;1;43;0
WireConnection;108;0;43;0
WireConnection;108;1;112;0
WireConnection;56;0;43;0
WireConnection;56;1;59;0
WireConnection;87;1;86;0
WireConnection;87;2;92;0
WireConnection;88;0;87;0
WireConnection;88;3;94;1
WireConnection;88;4;94;2
WireConnection;114;0;55;0
WireConnection;114;1;108;0
WireConnection;58;0;56;0
WireConnection;60;0;55;0
WireConnection;60;1;61;0
WireConnection;115;0;55;0
WireConnection;115;1;114;0
WireConnection;90;0;88;0
WireConnection;90;1;58;0
WireConnection;65;0;64;0
WireConnection;65;1;43;0
WireConnection;67;0;68;0
WireConnection;67;1;65;0
WireConnection;51;0;90;0
WireConnection;51;1;115;0
WireConnection;80;0;60;0
WireConnection;80;1;81;0
WireConnection;89;0;88;0
WireConnection;89;1;51;0
WireConnection;66;0;67;0
WireConnection;66;1;80;0
WireConnection;109;0;105;0
WireConnection;107;0;89;0
WireConnection;85;1;86;0
WireConnection;84;0;88;0
WireConnection;84;1;66;0
WireConnection;0;2;84;0
WireConnection;0;9;107;0
ASEEND*/
//CHKSM=6805EA496B6A51E38BF13D2804399FF531C62393
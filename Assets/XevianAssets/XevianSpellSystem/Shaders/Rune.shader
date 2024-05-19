// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SpellSystem/Rune"
{
	Properties
	{
		_Texture0("Texture 0", 2D) = "white" {}
		_Color0("_Color0", Color) = (1,0.4980392,0,0)
		_RotationSpeed("Rotation Speed", Float) = 0
		_Replace("Replace", Float) = 0.44
		_NewColor("New Color", Color) = (1,0,0,0)
		_Alpha("Alpha", Range( 0 , 1)) = 1
		_Brightness("Brightness", Float) = 1
		_Texture1("Texture 1", 2D) = "black" {}
		_Texture2("Texture 2", 2D) = "black" {}
		_SwapTexture("Swap Texture", Int) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Off
		CGINCLUDE
		#include "UnityShaderVariables.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _Replace;
		uniform int _SwapTexture;
		uniform sampler2D _Texture2;
		uniform float4 _Texture2_ST;
		uniform sampler2D _Texture1;
		uniform float4 _Texture1_ST;
		uniform float4 _Color0;
		uniform sampler2D _Texture0;
		uniform float4 _Texture0_ST;
		uniform float _RotationSpeed;
		uniform float4 _NewColor;
		uniform float _Brightness;
		uniform float _Alpha;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float temp_output_2_0_g1 = 100.0;
			float cosSides12_g1 = cos( ( UNITY_PI / temp_output_2_0_g1 ) );
			float2 appendResult18_g1 = (float2(( _Replace * cosSides12_g1 ) , ( _Replace * cosSides12_g1 )));
			float2 break23_g1 = ( (i.uv_texcoord*2.0 + -1.0) / appendResult18_g1 );
			float polarCoords30_g1 = atan2( break23_g1.x , -break23_g1.y );
			float temp_output_52_0_g1 = ( 6.28318548202515 / temp_output_2_0_g1 );
			float2 appendResult25_g1 = (float2(break23_g1.x , -break23_g1.y));
			float2 finalUVs29_g1 = appendResult25_g1;
			float temp_output_44_0_g1 = ( cos( ( ( floor( ( 0.5 + ( polarCoords30_g1 / temp_output_52_0_g1 ) ) ) * temp_output_52_0_g1 ) - polarCoords30_g1 ) ) * length( finalUVs29_g1 ) );
			float temp_output_13_0 = saturate( ( ( 1.0 - temp_output_44_0_g1 ) / fwidth( temp_output_44_0_g1 ) ) );
			float2 uv_Texture2 = i.uv_texcoord * _Texture2_ST.xy + _Texture2_ST.zw;
			float2 uv_Texture1 = i.uv_texcoord * _Texture1_ST.xy + _Texture1_ST.zw;
			float temp_output_44_0 = ( (float)_SwapTexture == 1.0 ? tex2D( _Texture2, uv_Texture2 ).a : tex2D( _Texture1, uv_Texture1 ).a );
			float2 uv_Texture0 = i.uv_texcoord * _Texture0_ST.xy + _Texture0_ST.zw;
			float mulTime10 = _Time.y * _RotationSpeed;
			float cos8 = cos( mulTime10 );
			float sin8 = sin( mulTime10 );
			float2 rotator8 = mul( uv_Texture0 - float2( 0.5,0.5 ) , float2x2( cos8 , -sin8 , sin8 , cos8 )) + float2( 0.5,0.5 );
			float4 tex2DNode2 = tex2D( _Texture0, rotator8 );
			float4 clampResult41 = clamp( ( ( temp_output_13_0 * temp_output_44_0 * _Color0 ) + ( ( tex2DNode2.a * _Color0 ) * temp_output_13_0 ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float temp_output_23_0 = ( 1.0 - temp_output_13_0 );
			float4 clampResult40 = clamp( ( ( tex2DNode2.a * _NewColor * temp_output_23_0 ) + ( temp_output_23_0 * _NewColor * temp_output_44_0 ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float4 temp_output_27_0 = ( ( clampResult41 + clampResult40 ) * _Brightness );
			o.Albedo = temp_output_27_0.rgb;
			o.Emission = temp_output_27_0.rgb;
			o.Alpha = ( ( tex2DNode2.a + temp_output_44_0 ) * _Alpha );
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard alpha:fade keepalpha fullforwardshadows 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			sampler3D _DitherMaskLOD;
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				half alphaRef = tex3D( _DitherMaskLOD, float3( vpos.xy * 0.25, o.Alpha * 0.9375 ) ).a;
				clip( alphaRef - 0.01 );
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18935
429;73;1480;765;2449.059;437.1424;1.141013;True;True
Node;AmplifyShaderEditor.RangedFloatNode;12;-1933.988,282.6256;Inherit;False;Property;_RotationSpeed;Rotation Speed;3;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;1;-2068.929,-230.5833;Inherit;True;Property;_Texture0;Texture 0;0;0;Create;True;0;0;0;False;0;False;38e6b1e645d2576499cd7e6e30fd8d9b;90eac594f90584b4f8c7af4d308b33c6;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleTimeNode;10;-1754.622,249.4671;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-1735.008,18.38134;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;45;-1747.964,1161.53;Inherit;True;Property;_Texture2;Texture 2;9;0;Create;True;0;0;0;False;0;False;497ef588262a65a459eef814ceb0686a;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RotatorNode;8;-1506.939,83.29313;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-1194.287,320.9998;Inherit;False;Constant;_Float6;Float 6;4;0;Create;True;0;0;0;False;0;False;100;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;29;-1746.698,1360.726;Inherit;True;Property;_Texture1;Texture 1;8;0;Create;True;0;0;0;False;0;False;4a216798c278ba645a60b98d543d1f48;None;False;black;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;15;-1209.76,490.7451;Inherit;False;Property;_Replace;Replace;4;0;Create;True;0;0;0;False;0;False;0.44;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-1307.423,-219.8069;Inherit;True;Property;_TextureSample0;Texture Sample 0;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;13;-909.2568,414.2508;Inherit;True;Polygon;-1;;1;6906ef7087298c94c853d6753e182169;0;4;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;47;-1529.602,1061.264;Inherit;False;Property;_SwapTexture;Swap Texture;10;0;Create;True;0;0;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.SamplerNode;46;-1517.242,1161;Inherit;True;Property;_TextureSample2;Texture Sample 2;9;0;Create;True;0;0;0;False;0;False;-1;497ef588262a65a459eef814ceb0686a;497ef588262a65a459eef814ceb0686a;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;3;-924.0353,52.43018;Inherit;False;Property;_Color0;_Color0;1;0;Create;True;0;0;0;False;0;False;1,0.4980392,0,0;1,0.5019608,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;30;-1517.614,1360.534;Inherit;True;Property;_TextureSample1;Texture Sample 1;9;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;17;-863.778,647.0116;Inherit;False;Property;_NewColor;New Color;5;0;Create;True;0;0;0;False;0;False;1,0,0,0;1,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;35;-639.7413,-158.345;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.Compare;44;-1169.662,1058.758;Inherit;True;0;4;0;INT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;37;-671.8706,-258.0239;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;-605.3485,-64.34009;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;23;-626.1024,465.7714;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-316.9276,117.2929;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-315.1931,467.6315;Inherit;True;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;-307.9692,-154.0941;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;31;-317.1985,851.6245;Inherit;True;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;38;-61.04584,163.6231;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;33;-73.75204,605.4482;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;61;-978.9713,876.7338;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;26;-750.6363,1261.717;Inherit;False;Property;_Alpha;Alpha;6;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;40;145.7672,632.3629;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;39;-716.706,1063.095;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;41;156.0234,218.3658;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-460.3287,1122.9;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;22;319.0437,309.1767;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;28;324.9716,584.7784;Inherit;False;Property;_Brightness;Brightness;7;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;5;-915.0353,231.4302;Inherit;False;Property;_Color1;Color 1;2;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;7;-914.2671,-204.7989;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;60;487.0622,1028.654;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-585.9488,181.2244;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;534.076,351.4144;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;835.3458,110.2123;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;SpellSystem/Rune;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;True;0;False;Transparent;;Transparent;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;10;0;12;0
WireConnection;9;2;1;0
WireConnection;8;0;9;0
WireConnection;8;2;10;0
WireConnection;2;0;1;0
WireConnection;2;1;8;0
WireConnection;13;2;14;0
WireConnection;13;3;15;0
WireConnection;13;4;15;0
WireConnection;46;0;45;0
WireConnection;30;0;29;0
WireConnection;35;0;3;0
WireConnection;44;0;47;0
WireConnection;44;2;46;4
WireConnection;44;3;30;4
WireConnection;37;0;13;0
WireConnection;4;0;2;4
WireConnection;4;1;3;0
WireConnection;23;0;13;0
WireConnection;24;0;4;0
WireConnection;24;1;13;0
WireConnection;16;0;2;4
WireConnection;16;1;17;0
WireConnection;16;2;23;0
WireConnection;34;0;37;0
WireConnection;34;1;44;0
WireConnection;34;2;35;0
WireConnection;31;0;23;0
WireConnection;31;1;17;0
WireConnection;31;2;44;0
WireConnection;38;0;34;0
WireConnection;38;1;24;0
WireConnection;33;0;16;0
WireConnection;33;1;31;0
WireConnection;61;0;2;4
WireConnection;40;0;33;0
WireConnection;39;0;61;0
WireConnection;39;1;44;0
WireConnection;41;0;38;0
WireConnection;25;0;39;0
WireConnection;25;1;26;0
WireConnection;22;0;41;0
WireConnection;22;1;40;0
WireConnection;7;0;2;4
WireConnection;60;0;25;0
WireConnection;6;0;7;0
WireConnection;6;1;5;0
WireConnection;27;0;22;0
WireConnection;27;1;28;0
WireConnection;0;0;27;0
WireConnection;0;2;27;0
WireConnection;0;9;60;0
ASEEND*/
//CHKSM=6826B32BACCBC983216E425277F0FD13C5E705B4
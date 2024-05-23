// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SpellSystem/PowerForceField"
{
	Properties
	{
		_Offset("Offset", Float) = 0.5
		_Fresnel("Fresnel", Float) = 5
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_Speed("Speed", Vector) = (0.1,0.1,0,0)
		_TextureSample1("Texture Sample 1", 2D) = "white" {}
		_TextureSample2("Texture Sample 2", 2D) = "black" {}
		_ScanSpeed("ScanSpeed", Float) = -0.3
		_Fill("Fill", Float) = 0.03
		_Float2("Float 2", Float) = 0.03
		_Hue("Hue", Range( 0 , 1)) = 0
		_Saturation("Saturation", Range( -1 , 1)) = 1
		_Value("Value", Range( -1 , 1)) = 1
		_HDR("HDR", Range( -10 , 10)) = 2
		_Float5("Float 5", Range( 0 , 2)) = 0.6933233
		_RotateSpeed2("Rotate Speed 2", Float) = -0.1
		_Texture0("Texture 0", 2D) = "white" {}
		_Texture1("Texture 1", 2D) = "white" {}
		_RotateSpeed1("Rotate Speed 1", Float) = 0.1
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
		#pragma surface surf Unlit alpha:fade keepalpha noshadow exclude_path:deferred 
		struct Input
		{
			float2 uv_texcoord;
			half ASEVFace : VFACE;
			float3 worldPos;
			float3 worldNormal;
			float4 screenPos;
		};

		uniform float _Hue;
		uniform float _Saturation;
		uniform float _Value;
		uniform float _HDR;
		uniform sampler2D _TextureSample1;
		uniform float2 _Speed;
		uniform float4 _TextureSample1_ST;
		uniform float _Float2;
		uniform sampler2D _TextureSample2;
		uniform float _ScanSpeed;
		uniform float4 _TextureSample2_ST;
		uniform sampler2D _TextureSample0;
		uniform float4 _TextureSample0_ST;
		uniform float _Fresnel;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _Offset;
		uniform float _Fill;
		uniform sampler2D _Texture0;
		uniform float _RotateSpeed1;
		uniform float4 _Texture0_ST;
		uniform sampler2D _Texture1;
		uniform float _RotateSpeed2;
		uniform float4 _Texture1_ST;
		uniform float _Float5;


		float3 HSVToRGB( float3 c )
		{
			float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
			float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
			return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
		}


		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float3 hsvTorgb59 = HSVToRGB( float3(_Hue,_Saturation,_Value) );
			o.Emission = ( hsvTorgb59 * _HDR );
			float2 uv_TextureSample1 = i.uv_texcoord * _TextureSample1_ST.xy + _TextureSample1_ST.zw;
			float2 panner58 = ( _Time.y * _Speed + uv_TextureSample1);
			float4 tex2DNode39 = tex2D( _TextureSample1, panner58 );
			float2 temp_cast_0 = (_ScanSpeed).xx;
			float2 uv_TextureSample2 = i.uv_texcoord * _TextureSample2_ST.xy + _TextureSample2_ST.zw;
			float2 panner45 = ( _Time.y * temp_cast_0 + uv_TextureSample2);
			float2 uv_TextureSample0 = i.uv_texcoord * _TextureSample0_ST.xy + _TextureSample0_ST.zw;
			float2 panner32 = ( _Time.y * _Speed + uv_TextureSample0);
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = i.worldNormal;
			float fresnelNdotV18 = dot( ase_worldNormal, ase_worldViewDir );
			float fresnelNode18 = ( 0.0 + 1.0 * pow( 1.0 - fresnelNdotV18, _Fresnel ) );
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float eyeDepth1 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float smoothstepResult17 = smoothstep( 0.0 , 1.0 , ( 1.0 - ( ( eyeDepth1 * 1.0 ) - ( ase_screenPos.w - _Offset ) ) ));
			float4 appendResult103 = (float4(_RotateSpeed1 , 0.0 , 0.0 , 0.0));
			float2 uv_Texture0 = i.uv_texcoord * _Texture0_ST.xy + _Texture0_ST.zw;
			float2 panner84 = ( _Time.y * appendResult103.xy + uv_Texture0);
			float4 appendResult104 = (float4(_RotateSpeed2 , 0.0 , 0.0 , 0.0));
			float2 uv_Texture1 = i.uv_texcoord * _Texture1_ST.xy + _Texture1_ST.zw;
			float2 panner93 = ( _Time.y * appendResult104.xy + uv_Texture1);
			float4 clampResult67 = clamp( ( ( ( tex2DNode39 * _Float2 ) + ( ( ( ( tex2DNode39 * tex2D( _TextureSample2, panner45 ) ) * 2.0 ) + ( tex2D( _TextureSample0, panner32 ) * ( (  ( i.ASEVFace - 0.0 > 1.0 ? 0.0 : i.ASEVFace - 0.0 <= 1.0 && i.ASEVFace + 0.0 >= 1.0 ? 1.0 : 0.0 )  == 1.0 ? fresnelNode18 : 0.0 ) + smoothstepResult17 ) ) ) * 2.0 ) ) + _Fill + ( tex2D( _Texture0, panner84 ).a * 0.5 ) + ( tex2D( _Texture1, panner93 ).a * 0.5 ) ) , float4( 0,0,0,0 ) , float4( 1,0,0,0 ) );
			float2 uv_TexCoord69 = i.uv_texcoord * float2( 0,1 ) + float2( 0,0.5 );
			float2 appendResult10_g1 = (float2(1.0 , _Float5));
			float2 temp_output_11_0_g1 = ( abs( (uv_TexCoord69*2.0 + -1.0) ) - appendResult10_g1 );
			float2 break16_g1 = ( 1.0 - ( temp_output_11_0_g1 / fwidth( temp_output_11_0_g1 ) ) );
			float4 appendResult77 = (float4(0.0 , ( ( 1.0 - _Float5 ) / 2.0 ) , 0.0 , 0.0));
			float2 uv_TexCoord72 = i.uv_texcoord * float2( 0,1 ) + appendResult77.xy;
			float2 appendResult10_g2 = (float2(1.0 , 0.01));
			float2 temp_output_11_0_g2 = ( abs( (uv_TexCoord72*2.0 + -1.0) ) - appendResult10_g2 );
			float2 break16_g2 = ( 1.0 - ( temp_output_11_0_g2 / fwidth( temp_output_11_0_g2 ) ) );
			o.Alpha = ( ( clampResult67 * saturate( min( break16_g1.x , break16_g1.y ) ) ) + saturate( min( break16_g2.x , break16_g2.y ) ) ).r;
		}

		ENDCG
	}
	Fallback "Standard"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18935
469;73;1440;765;646.8502;665.5708;1.914864;True;True
Node;AmplifyShaderEditor.ScreenPosInputsNode;12;-495.1921,331.8068;Float;True;1;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;14;-381.6973,574.2213;Inherit;True;Property;_Offset;Offset;0;0;Create;True;0;0;0;False;0;False;0.5;0.6;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenDepthNode;1;-438.2405,-25.71982;Inherit;False;0;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-431.8561,105.6363;Inherit;True;Constant;_Float0;Float 0;0;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-237.7487,53.29211;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;13;-128.7433,369.6992;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;42;430.1878,-1132.497;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FaceVariableNode;23;-158.7725,-371.7498;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;46;482.7309,-1254.019;Inherit;False;Property;_ScanSpeed;ScanSpeed;6;0;Create;True;0;0;0;False;0;False;-0.3;-0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;34;-284.4549,-772.3011;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;44;551.8351,-1416.134;Inherit;False;0;41;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;38;-313.5361,-921.8711;Inherit;False;Property;_Speed;Speed;3;0;Create;True;0;0;0;False;0;False;0.1,0.1;0.1,0.1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;19;-107.692,-50.6566;Inherit;False;Property;_Fresnel;Fresnel;1;0;Create;True;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;15;124.326,340.4081;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;48;531.3198,-1727.937;Inherit;False;0;39;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;58;821.6337,-1673.779;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;1,1;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;37;-161.3412,-1053.005;Inherit;False;0;35;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;45;818.8658,-1305.404;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;1,1;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FresnelNode;18;66.20872,-141.4528;Inherit;True;Standard;WorldNormal;ViewDir;False;False;5;0;FLOAT3;0,0,1;False;4;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;16;332.4507,339.78;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCIf;21;32.39987,-371.9452;Inherit;True;6;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;1;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;17;547.9824,311.7499;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;41;1074.034,-1322.554;Inherit;True;Property;_TextureSample2;Texture Sample 2;5;0;Create;True;0;0;0;False;0;False;41;f8fdf9c7ef95ce048a169db8f5dd7988;f8fdf9c7ef95ce048a169db8f5dd7988;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;27;489.3456,-128.6872;Inherit;True;0;4;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;39;1099.941,-1594.355;Inherit;True;Property;_TextureSample1;Texture Sample 1;4;0;Create;True;0;0;0;False;0;False;35;1f5e93120ca90fd40b61e5713c0fa200;1f5e93120ca90fd40b61e5713c0fa200;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;32;104.223,-945.2082;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;1,1;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;26;777.7959,49.93024;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;106;803.9586,1078.891;Inherit;False;Property;_RotateSpeed2;Rotate Speed 2;15;0;Create;True;0;0;0;False;0;False;-0.1;-0.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;1434.081,-1163.555;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;50;1311.341,-500.2975;Inherit;False;Constant;_Float1;Float 1;8;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;97;956.8181,335.6118;Inherit;True;Property;_Texture0;Texture 0;16;0;Create;True;0;0;0;False;0;False;90eac594f90584b4f8c7af4d308b33c6;90eac594f90584b4f8c7af4d308b33c6;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;105;773.1647,644.3536;Inherit;False;Property;_RotateSpeed1;Rotate Speed 1;18;0;Create;True;0;0;0;False;0;False;0.1;0.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;98;884.3651,800.0345;Inherit;True;Property;_Texture1;Texture 1;17;0;Create;True;0;0;0;False;0;False;90eac594f90584b4f8c7af4d308b33c6;90eac594f90584b4f8c7af4d308b33c6;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SamplerNode;35;376.2798,-979.512;Inherit;True;Property;_TextureSample0;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;39;None;208dbbd0dd49c5c45a8af40d03eb3334;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;87;1198.975,690.7452;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;49;1471.064,-514.9557;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;1082.824,17.30154;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;104;1063.997,1085.734;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;94;1134.137,951.2881;Inherit;False;0;35;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;85;1201.372,400.4334;Inherit;False;0;35;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;103;1055.443,557.1039;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleTimeNode;95;1007.024,1260.992;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;84;1431.636,503.3979;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;-0.1,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;57;1534.884,274.066;Inherit;False;Constant;_Float3;Float 3;10;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;54;1500.476,-150.5246;Inherit;False;Property;_Float2;Float 2;8;0;Create;True;0;0;0;False;0;False;0.03;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;47;1350.047,17.39309;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PannerNode;93;1395.702,1088.085;Inherit;True;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;73;1623.019,-783.2938;Inherit;False;Property;_Float5;Float 5;14;0;Create;True;0;0;0;False;0;False;0.6933233;2;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;78;1899.58,-817.7649;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;83;1685.398,272.1684;Inherit;True;Property;_TextureSample3;Texture Sample 3;7;0;Create;True;0;0;0;False;0;False;41;90eac594f90584b4f8c7af4d308b33c6;edadf3a2a3bb74942a8e316ce7381a87;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;53;1675.779,-192.7666;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;1618.833,37.7552;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;92;1620.074,805.7596;Inherit;True;Property;_TextureSample4;Texture Sample 4;6;0;Create;True;0;0;0;False;0;False;41;90eac594f90584b4f8c7af4d308b33c6;edadf3a2a3bb74942a8e316ce7381a87;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;56;1874.355,34.93168;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;79;2012.554,-740.8824;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;102;1996.371,721.3386;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;1984.396,350.0996;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;52;2240.733,388.6822;Inherit;True;Property;_Fill;Fill;7;0;Create;True;0;0;0;False;0;False;0.03;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;51;2164.12,26.67952;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;77;2108.423,-882.8137;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;69;2277.19,-585.7867;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;0,1;False;1;FLOAT2;0,0.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;68;2569.647,-588.5779;Inherit;True;Rectangle;-1;;1;6b23e0c975270fb4084c354b2c83366a;0;3;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;72;2255.547,-875.5775;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;0,1;False;1;FLOAT2;0,0.5;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;67;2578.823,78.0749;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;61;1808.13,-467.9239;Inherit;False;Property;_Hue;Hue;9;0;Create;True;0;0;0;False;0;False;0;0.149;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;62;1809.949,-371.2719;Inherit;False;Property;_Saturation;Saturation;10;0;Create;True;0;0;0;False;0;False;1;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;63;1815.403,-278.5451;Inherit;False;Property;_Value;Value;11;0;Create;True;0;0;0;False;0;False;1;1;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;65;2054.177,-56.13576;Inherit;False;Property;_HDR;HDR;12;0;Create;True;0;0;0;False;0;False;2;2;-10;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;74;2548.004,-878.3687;Inherit;True;Rectangle;-1;;2;6b23e0c975270fb4084c354b2c83366a;0;3;1;FLOAT2;0,0;False;2;FLOAT;1;False;3;FLOAT;0.01;False;1;FLOAT;0
Node;AmplifyShaderEditor.HSVToRGBNode;59;2060.208,-318.0182;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;71;2873.913,44.62788;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;70;2300.862,-445.1033;Inherit;False;Property;_Float4;Float 4;13;0;Create;True;0;0;0;False;0;False;1.137441;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;20;340.2943,234.993;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;66;2416.876,-167.9359;Inherit;True;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;81;3212.855,69.84081;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;9;3487.477,-200.3455;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;SpellSystem/PowerForceField;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;False;0;False;Transparent;;Transparent;ForwardOnly;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;1;1,1,1,0;VertexOffset;False;False;Spherical;False;True;Relative;0;Standard;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;10;0;1;0
WireConnection;10;1;11;0
WireConnection;13;0;12;4
WireConnection;13;1;14;0
WireConnection;15;0;10;0
WireConnection;15;1;13;0
WireConnection;58;0;48;0
WireConnection;58;2;38;0
WireConnection;58;1;34;0
WireConnection;45;0;44;0
WireConnection;45;2;46;0
WireConnection;45;1;42;0
WireConnection;18;3;19;0
WireConnection;16;0;15;0
WireConnection;21;0;23;0
WireConnection;17;0;16;0
WireConnection;41;1;45;0
WireConnection;27;0;21;0
WireConnection;27;2;18;0
WireConnection;39;1;58;0
WireConnection;32;0;37;0
WireConnection;32;2;38;0
WireConnection;32;1;34;0
WireConnection;26;0;27;0
WireConnection;26;1;17;0
WireConnection;40;0;39;0
WireConnection;40;1;41;0
WireConnection;35;1;32;0
WireConnection;49;0;40;0
WireConnection;49;1;50;0
WireConnection;36;0;35;0
WireConnection;36;1;26;0
WireConnection;104;0;106;0
WireConnection;94;2;98;0
WireConnection;85;2;97;0
WireConnection;103;0;105;0
WireConnection;84;0;85;0
WireConnection;84;2;103;0
WireConnection;84;1;87;0
WireConnection;47;0;49;0
WireConnection;47;1;36;0
WireConnection;93;0;94;0
WireConnection;93;2;104;0
WireConnection;93;1;95;0
WireConnection;78;0;73;0
WireConnection;83;0;97;0
WireConnection;83;1;84;0
WireConnection;53;0;39;0
WireConnection;53;1;54;0
WireConnection;55;0;47;0
WireConnection;55;1;57;0
WireConnection;92;0;98;0
WireConnection;92;1;93;0
WireConnection;56;0;53;0
WireConnection;56;1;55;0
WireConnection;79;0;78;0
WireConnection;102;0;92;4
WireConnection;101;0;83;4
WireConnection;51;0;56;0
WireConnection;51;1;52;0
WireConnection;51;2;101;0
WireConnection;51;3;102;0
WireConnection;77;1;79;0
WireConnection;68;1;69;0
WireConnection;68;3;73;0
WireConnection;72;1;77;0
WireConnection;67;0;51;0
WireConnection;74;1;72;0
WireConnection;59;0;61;0
WireConnection;59;1;62;0
WireConnection;59;2;63;0
WireConnection;71;0;67;0
WireConnection;71;1;68;0
WireConnection;66;0;59;0
WireConnection;66;1;65;0
WireConnection;81;0;71;0
WireConnection;81;1;74;0
WireConnection;9;2;66;0
WireConnection;9;9;81;0
ASEEND*/
//CHKSM=6186DD3AD81B6389C957A09A1842E9A4A76BC906
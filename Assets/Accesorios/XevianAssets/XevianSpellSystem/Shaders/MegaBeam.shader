// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SpellSystem/MegaBeam"
{
	Properties
	{
		_TimeScale("Time Scale", Float) = 1
		_Strength("Strength", Float) = 0.5
		_Offset("Offset", Float) = 0.5
		[HDR]_Color("Color", Color) = (0.9866247,1,0,0)
		_Scale("Scale", Float) = 1
		_AngleScale("Angle Scale", Float) = 1
		_YScaleFactor("Y Scale Factor", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Off
		GrabPass{ }
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 3.0
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#pragma surface surf Unlit alpha:fade keepalpha noshadow noambient 
		struct Input
		{
			float2 uv_texcoord;
			float4 screenPos;
		};

		uniform float4 _Color;
		uniform float _Scale;
		uniform float _AngleScale;
		uniform float _YScaleFactor;
		uniform float _TimeScale;
		ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
		uniform float _Strength;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _Offset;


		float2 voronoihash1( float2 p )
		{
			
			p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
			return frac( sin( p ) *43758.5453);
		}


		float voronoi1( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
		{
			float2 n = floor( v );
			float2 f = frac( v );
			float F1 = 8.0;
			float F2 = 8.0; float2 mg = 0;
			for ( int j = -3; j <= 3; j++ )
			{
				for ( int i = -3; i <= 3; i++ )
			 	{
			 		float2 g = float2( i, j );
			 		float2 o = voronoihash1( n + g );
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
			return (F2 + F1) * 0.5;
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


		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float mulTime29 = _Time.y * _AngleScale;
			float time1 = mulTime29;
			float2 voronoiSmoothId1 = 0;
			float3 ase_parentObjectScale = (1.0/float3( length( unity_WorldToObject[ 0 ].xyz ), length( unity_WorldToObject[ 1 ].xyz ), length( unity_WorldToObject[ 2 ].xyz ) ));
			float4 appendResult35 = (float4(1.0 , ( ase_parentObjectScale.y * _YScaleFactor ) , 0.0 , 0.0));
			float mulTime21 = _Time.y * _TimeScale;
			float4 appendResult22 = (float4(0.0 , mulTime21 , 0.0 , 0.0));
			float2 uv_TexCoord3 = i.uv_texcoord * appendResult35.xy + appendResult22.xy;
			float2 coords1 = uv_TexCoord3 * _Scale;
			float2 id1 = 0;
			float2 uv1 = 0;
			float voroi1 = voronoi1( coords1, time1, id1, uv1, 0, voronoiSmoothId1 );
			Gradient gradient4 = NewGradient( 0, 3, 2, float4( 0, 0, 0, 0 ), float4( 1, 1, 1, 0.5000076 ), float4( 0, 0, 0, 1 ), 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
			Gradient gradient31 = NewGradient( 0, 2, 2, float4( 1, 1, 1, 0 ), float4( 0, 0, 0, 1 ), 0, 0, 0, 0, 0, 0, float2( 1, 0 ), float2( 1, 1 ), 0, 0, 0, 0, 0, 0 );
			float4 temp_output_6_0 = ( voroi1 * SampleGradient( gradient4, uv_TexCoord3.x ) * SampleGradient( gradient31, i.uv_texcoord.y ) );
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float4 blendOpSrc16 = ase_screenPosNorm;
			float4 blendOpDest16 = ( 1.0 - ( temp_output_6_0 * _Strength ) );
			float4 screenColor10 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,( saturate( ( blendOpSrc16 * blendOpDest16 ) )).rg);
			o.Emission = ( ( _Color * temp_output_6_0 ) + screenColor10 ).rgb;
			float eyeDepth42 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float smoothstepResult51 = smoothstep( 0.0 , 1.0 , ( ( eyeDepth42 * 1.0 ) - ( ase_screenPos.w - _Offset ) ));
			o.Alpha = smoothstepResult51;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18935
429;73;1480;765;294.9296;-101.9236;2.807441;True;True
Node;AmplifyShaderEditor.RangedFloatNode;23;-2417.285,-51.22632;Inherit;False;Property;_TimeScale;Time Scale;0;0;Create;True;0;0;0;False;0;False;1;-2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ObjectScaleNode;34;-2656.519,258.0201;Inherit;False;True;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;37;-2640.206,483.3644;Inherit;False;Property;_YScaleFactor;Y Scale Factor;6;0;Create;True;0;0;0;False;0;False;1;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-2384.206,320.3644;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;21;-2217.784,-36.3594;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;35;-2081.519,282.0201;Inherit;False;FLOAT4;4;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;22;-2018.285,13.77368;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;30;-1859.285,-230.2263;Inherit;False;Property;_AngleScale;Angle Scale;5;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;33;-1855.088,750.5593;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GradientNode;4;-1890.649,330.5817;Inherit;False;0;3;2;0,0,0,0;1,1,1,0.5000076;0,0,0,1;1,0;1,1;0;1;OBJECT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3;-1853.049,30.68167;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;28;-1618.285,138.7737;Inherit;False;Property;_Scale;Scale;4;0;Create;True;0;0;0;False;0;False;1;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GradientNode;31;-1897.536,610.6358;Inherit;False;0;2;2;1,1,1,0;0,0,0,1;1,0;1,1;0;1;OBJECT;0
Node;AmplifyShaderEditor.SimpleTimeNode;29;-1636.285,-148.2263;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GradientSampleNode;32;-1590.962,646.7957;Inherit;True;2;0;OBJECT;;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GradientSampleNode;5;-1616.649,340.5817;Inherit;True;2;0;OBJECT;;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VoronoiNode;1;-1476.4,32.82727;Inherit;True;2;0;1;3;1;False;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;10;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-1279.649,265.5817;Inherit;True;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-1275.864,488.764;Inherit;False;Property;_Strength;Strength;1;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-1045.285,351.7737;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;41;-1155.146,1332.205;Float;True;1;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenDepthNode;42;-1098.195,974.6786;Inherit;False;0;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;9;-1224.685,640.4615;Float;True;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;40;-1041.651,1574.619;Inherit;True;Property;_Offset;Offset;2;0;Create;True;0;0;0;False;0;False;0.5;-0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;18;-875.2763,352.197;Inherit;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;43;-1091.81,1106.035;Inherit;True;Constant;_Float1;Float 1;0;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;16;-673.7965,658.0528;Inherit;True;Multiply;True;3;0;FLOAT4;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;44;-788.6976,1370.097;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;45;-897.7026,1053.69;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;26;-1220.285,-9.226318;Inherit;False;Property;_Color;Color;3;1;[HDR];Create;True;0;0;0;False;0;False;0.9866247,1,0,0;95.87451,72.28236,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-918.2852,-1.226318;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScreenColorNode;10;-333.0502,646.523;Inherit;False;Global;_GrabScreen0;Grab Screen 0;0;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;46;-568.0267,1340.806;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;78;1002.124,730.9722;Inherit;False;vertexOutput vert(vertexInput input)$            {$                // The world position of the center of the object$                float3 worldPos = mul(unity_ObjectToWorld, float4(0, 0, 0, 1)).xyz@$ $                // Distance between the camera and the center$                float3 dist = _WorldSpaceCameraPos - worldPos@$ $                // atan2(dist.x, dist.z) = atan (dist.x / dist.z)$                // With atan the tree inverts when the camera has the same z position$                float angle = atan2(dist.x, dist.z)@$ $                float3x3 rotMatrix@$                float cosinus = cos(angle)@$                float sinus = sin(angle)@$       $                // Rotation matrix in Y$                rotMatrix[0].xyz = float3(cosinus, 0, sinus)@$                rotMatrix[1].xyz = float3(0, 1, 0)@$                rotMatrix[2].xyz = float3(- sinus, 0, cosinus)@$ $                // The position of the vertex after the rotation$                float4 newPos = float4(mul(rotMatrix, input.vertex * float4(_ScaleX, _ScaleY, 0, 0)), 1)@$ $                // The model matrix without the rotation and scale$                float4x4 matrix_M_noRot = unity_ObjectToWorld@$                matrix_M_noRot[0][0] = 1@$                matrix_M_noRot[0][1] = 0@$                matrix_M_noRot[0][2] = 0@$ $                matrix_M_noRot[1][0] = 0@$                matrix_M_noRot[1][1] = 1@$                matrix_M_noRot[1][2] = 0@$ $                matrix_M_noRot[2][0] = 0@$                matrix_M_noRot[2][1] = 0@$                matrix_M_noRot[2][2] = 1@$ $                vertexOutput output@$ $                // The position of the vertex in clip space ignoring the rotation and scale of the object$                #if IGNORE_ROTATION_AND_SCALE$                output.pos = mul(UNITY_MATRIX_VP, mul(matrix_M_noRot, newPos))@$                #else$                output.pos = mul(UNITY_MATRIX_VP, mul(unity_ObjectToWorld, newPos))@$                #endif$ $                output.tex = TRANSFORM_TEX(input.tex, _MainTex)@$ $                return output@$            };7;Create;1;True;In0;FLOAT;0;In;;Inherit;False;My Custom Expression;False;False;0;;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;7;-615.655,231.9518;Inherit;True;Normal From Height;-1;;1;1942fe2c5f1a1f94881a33d532e4afeb;0;2;20;FLOAT;0;False;110;FLOAT;1;False;2;FLOAT3;40;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;48;-349.0287,1005.219;Inherit;False;Property;_StepOffset;StepOffset;7;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;27;-167.2852,350.7737;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SmoothstepOpNode;51;187.2796,858.6252;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.BillboardNode;77;1050.124,554.9722;Inherit;False;Cylindrical;False;True;0;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;20;2668.6,383.9706;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;SpellSystem/MegaBeam;False;False;False;False;True;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;False;0;False;Transparent;;Transparent;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Spherical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;36;0;34;2
WireConnection;36;1;37;0
WireConnection;21;0;23;0
WireConnection;35;1;36;0
WireConnection;22;1;21;0
WireConnection;3;0;35;0
WireConnection;3;1;22;0
WireConnection;29;0;30;0
WireConnection;32;0;31;0
WireConnection;32;1;33;2
WireConnection;5;0;4;0
WireConnection;5;1;3;1
WireConnection;1;0;3;0
WireConnection;1;1;29;0
WireConnection;1;2;28;0
WireConnection;6;0;1;0
WireConnection;6;1;5;0
WireConnection;6;2;32;0
WireConnection;24;0;6;0
WireConnection;24;1;15;0
WireConnection;18;0;24;0
WireConnection;16;0;9;0
WireConnection;16;1;18;0
WireConnection;44;0;41;4
WireConnection;44;1;40;0
WireConnection;45;0;42;0
WireConnection;45;1;43;0
WireConnection;25;0;26;0
WireConnection;25;1;6;0
WireConnection;10;0;16;0
WireConnection;46;0;45;0
WireConnection;46;1;44;0
WireConnection;7;20;6;0
WireConnection;27;0;25;0
WireConnection;27;1;10;0
WireConnection;51;0;46;0
WireConnection;20;2;27;0
WireConnection;20;9;51;0
ASEEND*/
//CHKSM=122B5DE7CE13D4F6B0AAC6B9037EC5502B8AAA09
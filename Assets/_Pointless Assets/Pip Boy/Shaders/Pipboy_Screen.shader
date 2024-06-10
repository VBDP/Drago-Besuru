// Made with Amplify Shader Editor v1.9.3.3
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Pipboy_Screen"
{
	Properties
	{
		[NoScaleOffset][SingleLineTexture]_Tex("Tex", 2D) = "white" {}
		[NoScaleOffset][SingleLineTexture]_Mask("Mask", 2D) = "white" {}
		[NoScaleOffset][SingleLineTexture]_Numbers("Numbers", 2D) = "white" {}
		[ToggleUI]_ScreenSelection("Screen Selection", Float) = 0
		[HDR]_Color("Color", Color) = (0,0,0,0)
		[Toggle]_GamerMode("Gamer Mode", Float) = 0
		_GamerSpeed("Gamer Speed", Float) = 0
		[ToggleUI]_ChangePlayerCamTex("Change Player Cam Tex", Float) = 0
		_PlayerCamSlotContrast("Player Cam Slot Contrast", Float) = 1
		[NoScaleOffset]_PlayerCamSlot("Player Cam Slot", 2D) = "white" {}
		[NoScaleOffset]_PlayerCamSlotStatic("Player Cam Slot Static", 2D) = "white" {}
		[ToggleUI]_ChangeMinimapTex("Change Minimap Tex", Float) = 0
		_MinimapCamSlotContrast("Minimap Cam Slot Contrast", Float) = 1
		[NoScaleOffset]_MinimapCamSlot("Minimap Cam Slot", 2D) = "white" {}
		[NoScaleOffset]_MinimapCamSlotStatic("Minimap Cam Slot Static", 2D) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Cutout" }
	LOD 0

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend Off
		AlphaToMask Off
		Cull Back
		ColorMask RGBA
		ZWrite on
		ZTest LEqual
		Offset 0 , 0
		
		
		
		Pass
		{
			Name "Unlit"

			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_FRAG_COLOR
			#include "Packages/com.llealloo.audiolink/Runtime/Shaders/AudioLink.cginc"


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform float _GamerMode;
			uniform float4 _Color;
			uniform float _GamerSpeed;
			uniform float _ScreenSelection;
			uniform sampler2D _Mask;
			uniform sampler2D _Numbers;
			uniform sampler2D _Tex;
			uniform float _PlayerCamSlotContrast;
			uniform float _ChangePlayerCamTex;
			uniform sampler2D _PlayerCamSlot;
			uniform sampler2D _PlayerCamSlotStatic;
			uniform float _MinimapCamSlotContrast;
			uniform float _ChangeMinimapTex;
			uniform sampler2D _MinimapCamSlot;
			uniform sampler2D _MinimapCamSlotStatic;
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
					float2 voronoihash212( float2 p )
					{
						p = p - 1 * floor( p / 1 );
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi212( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
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
						 		float2 o = voronoihash212( n + g );
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
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float2 texCoord68 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float cos1_g4 = cos( radians( 0.0 ) );
				float sin1_g4 = sin( radians( 0.0 ) );
				float2 rotator1_g4 = mul( texCoord68 - float2( 0.5,0.5 ) , float2x2( cos1_g4 , -sin1_g4 , sin1_g4 , cos1_g4 )) + float2( 0.5,0.5 );
				float2 temp_output_10_0_g4 = ( float2( 2,2 ) / 1.0 );
				float2 panner19_g4 = ( _Time.y * float2( 0,0 ) + float2( 0,0 ));
				float2 _Vector2 = float2(0.5,0.5);
				float2 vertexToFrag7_g4 = ( ( ( ( rotator1_g4 * temp_output_10_0_g4 ) + panner19_g4 ) + float2( 0.6,0 ) ) - ( ( temp_output_10_0_g4 * _Vector2 ) - _Vector2 ) );
				o.ase_texcoord1.xy = vertexToFrag7_g4;
				float2 texCoord71 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float cos1_g5 = cos( radians( 0.0 ) );
				float sin1_g5 = sin( radians( 0.0 ) );
				float2 rotator1_g5 = mul( texCoord71 - float2( 0.5,0.5 ) , float2x2( cos1_g5 , -sin1_g5 , sin1_g5 , cos1_g5 )) + float2( 0.5,0.5 );
				float2 temp_output_10_0_g5 = ( float2( 2,2 ) / 1.0 );
				float2 panner19_g5 = ( _Time.y * float2( 0,0 ) + float2( 0,0 ));
				float2 vertexToFrag7_g5 = ( ( ( ( rotator1_g5 * temp_output_10_0_g5 ) + panner19_g5 ) + float2( 0,0 ) ) - ( ( temp_output_10_0_g5 * _Vector2 ) - _Vector2 ) );
				o.ase_texcoord1.zw = vertexToFrag7_g5;
				float2 texCoord74 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float cos1_g6 = cos( radians( 0.0 ) );
				float sin1_g6 = sin( radians( 0.0 ) );
				float2 rotator1_g6 = mul( texCoord74 - float2( 0.5,0.5 ) , float2x2( cos1_g6 , -sin1_g6 , sin1_g6 , cos1_g6 )) + float2( 0.5,0.5 );
				float2 temp_output_10_0_g6 = ( float2( 2,2 ) / 1.0 );
				float2 panner19_g6 = ( _Time.y * float2( 0,0 ) + float2( 0,0 ));
				float2 vertexToFrag7_g6 = ( ( ( ( rotator1_g6 * temp_output_10_0_g6 ) + panner19_g6 ) + float2( -0.6,0 ) ) - ( ( temp_output_10_0_g6 * _Vector2 ) - _Vector2 ) );
				o.ase_texcoord2.xy = vertexToFrag7_g6;
				
				o.ase_color = v.color;
				o.ase_texcoord2.zw = v.ase_texcoord.xy;
				o.ase_texcoord3.xy = v.ase_texcoord2.xy;
				o.ase_texcoord3.zw = v.ase_texcoord3.xy;
				o.ase_texcoord4.xy = v.ase_texcoord1.xy;
				o.ase_texcoord5 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float3 hsvTorgb117 = RGBToHSV( _Color.rgb );
				float mulTime120 = _Time.y * _GamerSpeed;
				float3 hsvTorgb118 = HSVToRGB( float3(( hsvTorgb117.x * mulTime120 ),hsvTorgb117.y,hsvTorgb117.z) );
				float2 vertexToFrag7_g4 = i.ase_texcoord1.xy;
				float2 temp_output_78_8 = vertexToFrag7_g4;
				float2 appendResult10 = (float2(i.ase_color.r , i.ase_color.g));
				float2 break16 = floor( ( appendResult10 * 10.0 ) );
				float temp_output_18_0 = ( break16.x == 3.0 ? 1.0 : 0.0 );
				float localGetInstanceTime1_g2 = ( AudioLinkDecodeDataAsSeconds( ALPASS_GENERALVU_INSTANCE_TIME ) );
				float4x4 break108 = unity_ObjectToWorld;
				float temp_output_91_0 = round( ( ( temp_output_18_0 * ( break16.y == round( 0.0 ) ? localGetInstanceTime1_g2 : 0.0 ) ) + ( ( break16.y == round( 1.0 ) ? 1.0 : 0.0 ) * _Time.y ) + ( ( break16.y == round( 2.0 ) ? 1.0 : 0.0 ) * abs( break108[ 0 ][ 3 ] ) ) + ( ( break16.y == round( 3.0 ) ? 1.0 : 0.0 ) * abs( break108[ 1 ][ 3 ] ) ) + ( ( break16.y == round( 4.0 ) ? 1.0 : 0.0 ) * abs( break108[ 2 ][ 3 ] ) ) + ( ( break16.y == round( 5.0 ) ? 1.0 : 0.0 ) * unity_DeltaTime.w ) ) );
				// *** BEGIN Flipbook UV Animation vars ***
				// Total tiles of Flipbook Texture
				float fbtotaltiles66 = 5.0 * 2.0;
				// Offsets for cols and rows of Flipbook Texture
				float fbcolsoffset66 = 1.0f / 5.0;
				float fbrowsoffset66 = 1.0f / 2.0;
				// Speed of animation
				float fbspeed66 = _Time[ 1 ] * 0.0;
				// UV Tiling (col and row offset)
				float2 fbtiling66 = float2(fbcolsoffset66, fbrowsoffset66);
				// UV Offset - calculate current tile linear index, and convert it to (X * coloffset, Y * rowoffset)
				// Calculate current tile linear index
				float fbcurrenttileindex66 = round( fmod( fbspeed66 + floor( ( temp_output_91_0 / 100.0 ) ), fbtotaltiles66) );
				fbcurrenttileindex66 += ( fbcurrenttileindex66 < 0) ? fbtotaltiles66 : 0;
				// Obtain Offset X coordinate from current tile linear index
				float fblinearindextox66 = round ( fmod ( fbcurrenttileindex66, 5.0 ) );
				// Multiply Offset X by coloffset
				float fboffsetx66 = fblinearindextox66 * fbcolsoffset66;
				// Obtain Offset Y coordinate from current tile linear index
				float fblinearindextoy66 = round( fmod( ( fbcurrenttileindex66 - fblinearindextox66 ) / 5.0, 2.0 ) );
				// Reverse Y to get tiles from Top to Bottom
				fblinearindextoy66 = (int)(2.0-1) - fblinearindextoy66;
				// Multiply Offset Y by rowoffset
				float fboffsety66 = fblinearindextoy66 * fbrowsoffset66;
				// UV Offset
				float2 fboffset66 = float2(fboffsetx66, fboffsety66);
				// Flipbook UV
				half2 fbuv66 = temp_output_78_8 * fbtiling66 + fboffset66;
				// *** END Flipbook UV Animation vars ***
				float2 vertexToFrag7_g5 = i.ase_texcoord1.zw;
				float2 temp_output_77_8 = vertexToFrag7_g5;
				float fbtotaltiles69 = 5.0 * 2.0;
				float fbcolsoffset69 = 1.0f / 5.0;
				float fbrowsoffset69 = 1.0f / 2.0;
				float fbspeed69 = _Time[ 1 ] * 0.0;
				float2 fbtiling69 = float2(fbcolsoffset69, fbrowsoffset69);
				float fbcurrenttileindex69 = round( fmod( fbspeed69 + floor( ( temp_output_91_0 / 10.0 ) ), fbtotaltiles69) );
				fbcurrenttileindex69 += ( fbcurrenttileindex69 < 0) ? fbtotaltiles69 : 0;
				float fblinearindextox69 = round ( fmod ( fbcurrenttileindex69, 5.0 ) );
				float fboffsetx69 = fblinearindextox69 * fbcolsoffset69;
				float fblinearindextoy69 = round( fmod( ( fbcurrenttileindex69 - fblinearindextox69 ) / 5.0, 2.0 ) );
				fblinearindextoy69 = (int)(2.0-1) - fblinearindextoy69;
				float fboffsety69 = fblinearindextoy69 * fbrowsoffset69;
				float2 fboffset69 = float2(fboffsetx69, fboffsety69);
				half2 fbuv69 = temp_output_77_8 * fbtiling69 + fboffset69;
				float2 vertexToFrag7_g6 = i.ase_texcoord2.xy;
				float2 temp_output_76_8 = vertexToFrag7_g6;
				float fbtotaltiles72 = 5.0 * 2.0;
				float fbcolsoffset72 = 1.0f / 5.0;
				float fbrowsoffset72 = 1.0f / 2.0;
				float fbspeed72 = _Time[ 1 ] * 0.0;
				float2 fbtiling72 = float2(fbcolsoffset72, fbrowsoffset72);
				float fbcurrenttileindex72 = round( fmod( fbspeed72 + temp_output_91_0, fbtotaltiles72) );
				fbcurrenttileindex72 += ( fbcurrenttileindex72 < 0) ? fbtotaltiles72 : 0;
				float fblinearindextox72 = round ( fmod ( fbcurrenttileindex72, 5.0 ) );
				float fboffsetx72 = fblinearindextox72 * fbcolsoffset72;
				float fblinearindextoy72 = round( fmod( ( fbcurrenttileindex72 - fblinearindextox72 ) / 5.0, 2.0 ) );
				fblinearindextoy72 = (int)(2.0-1) - fblinearindextoy72;
				float fboffsety72 = fblinearindextoy72 * fbrowsoffset72;
				float2 fboffset72 = float2(fboffsetx72, fboffsety72);
				half2 fbuv72 = temp_output_76_8 * fbtiling72 + fboffset72;
				float Number_Mask98 = temp_output_18_0;
				float temp_output_102_0 = ( 1.0 - Number_Mask98 );
				float2 texCoord2 = i.ase_texcoord2.zw * float2( 1,1 ) + float2( 0,0 );
				float4 tex2DNode1 = tex2D( _Tex, texCoord2 );
				float3 objToWorldDir124 = mul( unity_ObjectToWorld, float4( float3(0,1,0), 0 ) ).xyz;
				float2 texCoord128 = i.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float2 appendResult133 = (float2(( ( 11.0 / 15.0 ) * texCoord128.x ) , ( ( texCoord128.y * 2.0 ) - ( ( 1.0 / 13.0 ) * 2.0 ) )));
				float2 break138 = appendResult133;
				float2 appendResult140 = (float2(( ( atan2( objToWorldDir124.x , objToWorldDir124.z ) / 6.28318 ) + break138.x + -0.023 ) , break138.y));
				float2 texCoord153 = i.ase_texcoord3.zw * float2( 1,1 ) + float2( 0,0 );
				float grayscale152 = dot(CalculateContrast(_PlayerCamSlotContrast,(( _ChangePlayerCamTex )?( tex2D( _PlayerCamSlotStatic, texCoord153 ) ):( tex2D( _PlayerCamSlot, texCoord153 ) ))).rgb, float3(0.299,0.587,0.114));
				float2 texCoord3 = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord160 = i.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord156 = i.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float grayscale163 = Luminance(( tex2D( _Tex, texCoord3 ) + ( tex2D( _Tex, texCoord160 ).b * CalculateContrast(_MinimapCamSlotContrast,(( _ChangeMinimapTex )?( tex2D( _MinimapCamSlotStatic, texCoord156 ) ):( tex2D( _MinimapCamSlot, texCoord156 ) ))) ) ).rgb);
				float time212 = 0.0;
				float2 voronoiSmoothId212 = 0;
				float mulTime227 = _Time.y * 0.005;
				float2 appendResult215 = (float2(0.0 , (i.ase_texcoord5.xyz.z*1.0 + mulTime227)));
				float2 coords212 = appendResult215 * 250.0;
				float2 id212 = 0;
				float2 uv212 = 0;
				float voroi212 = voronoi212( coords212, time212, id212, uv212, 0, voronoiSmoothId212 );
				
				
				finalColor = ( (( _GamerMode )?( float4( hsvTorgb118 , 0.0 ) ):( _Color )) * ( ( 0.5 * (( _ScreenSelection )?( grayscale163 ):( saturate( ( ( ( ( tex2D( _Mask, temp_output_78_8 ).r * tex2D( _Numbers, fbuv66 ).r ) + ( tex2D( _Mask, temp_output_77_8 ).r * tex2D( _Numbers, fbuv69 ).r ) + ( tex2D( _Mask, temp_output_76_8 ).r * tex2D( _Numbers, fbuv72 ).r ) ) * Number_Mask98 ) + ( temp_output_102_0 * tex2DNode1.g ) + ( temp_output_102_0 * tex2DNode1.r * tex2D( _Tex, appendResult140 ).g ) + ( tex2DNode1.b * temp_output_102_0 * grayscale152 ) ) ) )) ) + ( (( _ScreenSelection )?( grayscale163 ):( saturate( ( ( ( ( tex2D( _Mask, temp_output_78_8 ).r * tex2D( _Numbers, fbuv66 ).r ) + ( tex2D( _Mask, temp_output_77_8 ).r * tex2D( _Numbers, fbuv69 ).r ) + ( tex2D( _Mask, temp_output_76_8 ).r * tex2D( _Numbers, fbuv72 ).r ) ) * Number_Mask98 ) + ( temp_output_102_0 * tex2DNode1.g ) + ( temp_output_102_0 * tex2DNode1.r * tex2D( _Tex, appendResult140 ).g ) + ( tex2DNode1.b * temp_output_102_0 * grayscale152 ) ) ) )) * voroi212 * 5.0 ) ) );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	Fallback Off
}
/*ASEBEGIN
Version=19303
Node;AmplifyShaderEditor.VertexColorNode;7;-2032,304;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;10;-1856,304;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-1856,400;Inherit;False;Constant;_Float0;Float 0;2;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-1696,304;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FloorOpNode;9;-1552,304;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ObjectToWorldMatrixNode;112;-1936,880;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.BreakToComponentsNode;16;-1440,304;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RoundOpNode;19;-1472,480;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RoundOpNode;21;-1472,640;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;122;-1648,528;Inherit;False;AudioLinkTime;-1;;2;2a2489b8c1c55014d8221ae490666389;0;0;3;FLOAT;0;FLOAT;3;FLOAT;5
Node;AmplifyShaderEditor.RoundOpNode;23;-1472,800;Inherit;False;1;0;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RoundOpNode;25;-1472,976;Inherit;False;1;0;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RoundOpNode;27;-1472,1136;Inherit;False;1;0;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.RoundOpNode;35;-1472,1312;Inherit;False;1;0;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;108;-1760,880;Inherit;False;FLOAT4x4;1;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.Compare;18;-1088,304;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;3;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;14;-1088,448;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;22;-1088,608;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;97;-1504,720;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;24;-1088,768;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;26;-1088,944;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;28;-1088,1104;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;34;-1088,1280;Inherit;False;0;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DeltaTime;105;-1376,1472;Inherit;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.AbsOpNode;230;-1552,1056;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;231;-1552,1216;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;229;-1552,880;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;-928,608;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;65;-928,432;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-928,768;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-928,944;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;43;-928,1104;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;-928,1280;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;63;-688,800;Inherit;False;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;130;1104,2112;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;13;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;128;960,1952;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;126;1200,1840;Inherit;False;2;0;FLOAT;11;False;1;FLOAT;15;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;129;1232,2000;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;131;1232,2112;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;143;1088,1648;Inherit;False;Constant;_Vector0;Vector 0;7;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RoundOpNode;91;-96,800;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;127;1312,1840;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;132;1424,2000;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformDirectionNode;124;1280,1648;Inherit;False;Object;World;False;Fast;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TextureCoordinatesNode;68;64,592;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;71;64,1008;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;74;80,1456;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;92;208,880;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;10;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;94;208,784;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;100;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;133;1600,1904;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ATan2OpNode;145;1504,1680;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;78;272,592;Inherit;False;UVScaleFromCenter;-1;;4;e7b98c58a3592ef4f943fc0486032389;0;6;22;FLOAT2;0,0;False;11;FLOAT2;2,2;False;21;FLOAT2;0.6,0;False;18;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;4;FLOAT;0;False;1;FLOAT2;8
Node;AmplifyShaderEditor.FunctionNode;77;288,1008;Inherit;False;UVScaleFromCenter;-1;;5;e7b98c58a3592ef4f943fc0486032389;0;6;22;FLOAT2;0,0;False;11;FLOAT2;2,2;False;21;FLOAT2;0,0;False;18;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;4;FLOAT;0;False;1;FLOAT2;8
Node;AmplifyShaderEditor.FunctionNode;76;304,1456;Inherit;False;UVScaleFromCenter;-1;;6;e7b98c58a3592ef4f943fc0486032389;0;6;22;FLOAT2;0,0;False;11;FLOAT2;2,2;False;21;FLOAT2;-0.6,0;False;18;FLOAT2;0,0;False;2;FLOAT2;0.5,0.5;False;4;FLOAT;0;False;1;FLOAT2;8
Node;AmplifyShaderEditor.FloorOpNode;93;368,928;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FloorOpNode;95;368,800;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;153;1520,2208;Inherit;False;3;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;138;1760,1904;Inherit;False;FLOAT2;1;0;FLOAT2;0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.RangedFloatNode;149;1664,2016;Inherit;False;Constant;_AAAAAAAAAAAA;AAAAAAAAAAAA;7;0;Create;True;0;0;0;False;0;False;-0.023;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;148;1664,1680;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;6.28318;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCFlipBookUVAnimation;66;576,592;Inherit;False;0;0;6;0;FLOAT2;0,0;False;1;FLOAT;5;False;2;FLOAT;2;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TFHCFlipBookUVAnimation;69;576,1008;Inherit;False;0;0;6;0;FLOAT2;0,0;False;1;FLOAT;5;False;2;FLOAT;2;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TFHCFlipBookUVAnimation;72;576,1456;Inherit;False;0;0;6;0;FLOAT2;0,0;False;1;FLOAT;5;False;2;FLOAT;2;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SamplerNode;238;1776,2400;Inherit;True;Property;_PlayerCamSlotStatic;Player Cam Slot Static;10;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;156;1216,3056;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;151;1776,2208;Inherit;True;Property;_PlayerCamSlot;Player Cam Slot;9;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;141;1920,1856;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;70;816,1008;Inherit;True;Property;_TextureSample1;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;67;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;83;816,816;Inherit;True;Property;_Mask1;Mask;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;79;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;73;816,1456;Inherit;True;Property;_TextureSample2;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;67;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;84;816,1264;Inherit;True;Property;_Mask2;Mask;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;79;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;79;816,400;Inherit;True;Property;_Mask;Mask;1;2;[NoScaleOffset];[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;67;816,592;Inherit;True;Property;_Numbers;Numbers;2;2;[NoScaleOffset];[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;98;-896,288;Inherit;False;Number Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;237;2080,2304;Inherit;False;Property;_ChangePlayerCamTex;Change Player Cam Tex;7;0;Create;True;0;0;0;False;0;False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;232;1472,3264;Inherit;True;Property;_MinimapCamSlotStatic;Minimap Cam Slot Static;14;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;155;1472,3056;Inherit;True;Property;_MinimapCamSlot;Minimap Cam Slot;13;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;276;2096,2432;Inherit;False;Property;_PlayerCamSlotContrast;Player Cam Slot Contrast;8;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;160;1648,2864;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;2;1504,1232;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;100;1712,1104;Inherit;False;98;Number Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;140;2064,1904;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;80;1168,560;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;1200,992;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;82;1216,1360;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;273;2320,2304;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;1.1;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;236;1824,3152;Inherit;False;Property;_ChangeMinimapTex;Change Minimap Tex;11;0;Create;True;0;0;0;False;0;False;0;False;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;275;1808,3296;Inherit;False;Property;_MinimapCamSlotContrast;Minimap Cam Slot Contrast;12;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;161;1856,2864;Inherit;True;Property;_MinimapCamSlot1;Minimap Cam Slot;0;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;3;1952,2720;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;125;2224,1824;Inherit;True;Property;_Tex1;Tex;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;102;2192,1152;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;1936,1280;Inherit;True;Property;_Tex;Tex;0;2;[NoScaleOffset];[SingleLineTexture];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;75;1696,944;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCGrayscale;152;2496,2304;Inherit;False;1;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleContrastOpNode;274;2080,3152;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;150;2160,2720;Inherit;True;Property;_Tex2;Tex;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Instance;1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;158;2304,2960;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;99;1920,976;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;103;2416,1184;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;134;2560,1744;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;214;2656,1216;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;227;2656,1360;Inherit;False;1;0;FLOAT;0.005;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;154;2704,2176;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;162;2560,2768;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;114;2336,576;Inherit;False;Property;_Color;Color;4;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;121;2384,816;Inherit;False;Property;_GamerSpeed;Gamer Speed;6;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;101;2768,976;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;226;2832,1232;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RGBToHSVNode;117;2560,672;Float;False;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleTimeNode;120;2576,816;Inherit;False;1;0;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;164;2896,976;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;215;3040,1232;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TFHCGrayscale;163;2848,2768;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;119;2816,688;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;223;3200,1088;Inherit;False;Constant;_Float1;Float 1;9;0;Create;True;0;0;0;False;0;False;5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VoronoiNode;212;3184,1216;Inherit;True;0;0;1;0;1;True;1;False;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;250;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.ToggleSwitchNode;4;3136,976;Inherit;False;Property;_ScreenSelection;Screen Selection;3;0;Create;True;0;0;0;False;0;False;0;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.HSVToRGBNode;118;2976,672;Float;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;165;3376,1040;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;228;3376,928;Inherit;False;2;2;0;FLOAT;0.5;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ToggleSwitchNode;116;3264,576;Inherit;False;Property;_GamerMode;Gamer Mode;5;0;Create;True;0;0;0;False;0;False;0;True;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;166;3536,976;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;113;3664,944;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;60;3872,960;Float;False;True;-1;2;ASEMaterialInspector;100;5;Pipboy_Screen;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;RenderType=Opaque=RenderType;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
WireConnection;10;0;7;1
WireConnection;10;1;7;2
WireConnection;11;0;10;0
WireConnection;11;1;12;0
WireConnection;9;0;11;0
WireConnection;16;0;9;0
WireConnection;108;0;112;0
WireConnection;18;0;16;0
WireConnection;14;0;16;1
WireConnection;14;1;19;0
WireConnection;14;2;122;0
WireConnection;22;0;16;1
WireConnection;22;1;21;0
WireConnection;24;0;16;1
WireConnection;24;1;23;0
WireConnection;26;0;16;1
WireConnection;26;1;25;0
WireConnection;28;0;16;1
WireConnection;28;1;27;0
WireConnection;34;0;16;1
WireConnection;34;1;35;0
WireConnection;230;0;108;7
WireConnection;231;0;108;11
WireConnection;229;0;108;3
WireConnection;40;0;22;0
WireConnection;40;1;97;0
WireConnection;65;0;18;0
WireConnection;65;1;14;0
WireConnection;41;0;24;0
WireConnection;41;1;229;0
WireConnection;42;0;26;0
WireConnection;42;1;230;0
WireConnection;43;0;28;0
WireConnection;43;1;231;0
WireConnection;44;0;34;0
WireConnection;44;1;105;4
WireConnection;63;0;65;0
WireConnection;63;1;40;0
WireConnection;63;2;41;0
WireConnection;63;3;42;0
WireConnection;63;4;43;0
WireConnection;63;5;44;0
WireConnection;129;0;128;2
WireConnection;131;0;130;0
WireConnection;91;0;63;0
WireConnection;127;0;126;0
WireConnection;127;1;128;1
WireConnection;132;0;129;0
WireConnection;132;1;131;0
WireConnection;124;0;143;0
WireConnection;92;0;91;0
WireConnection;94;0;91;0
WireConnection;133;0;127;0
WireConnection;133;1;132;0
WireConnection;145;0;124;1
WireConnection;145;1;124;3
WireConnection;78;22;68;0
WireConnection;77;22;71;0
WireConnection;76;22;74;0
WireConnection;93;0;92;0
WireConnection;95;0;94;0
WireConnection;138;0;133;0
WireConnection;148;0;145;0
WireConnection;66;0;78;8
WireConnection;66;4;95;0
WireConnection;69;0;77;8
WireConnection;69;4;93;0
WireConnection;72;0;76;8
WireConnection;72;4;91;0
WireConnection;238;1;153;0
WireConnection;151;1;153;0
WireConnection;141;0;148;0
WireConnection;141;1;138;0
WireConnection;141;2;149;0
WireConnection;70;1;69;0
WireConnection;83;1;77;8
WireConnection;73;1;72;0
WireConnection;84;1;76;8
WireConnection;79;1;78;8
WireConnection;67;1;66;0
WireConnection;98;0;18;0
WireConnection;237;0;151;0
WireConnection;237;1;238;0
WireConnection;232;1;156;0
WireConnection;155;1;156;0
WireConnection;140;0;141;0
WireConnection;140;1;138;1
WireConnection;80;0;79;1
WireConnection;80;1;67;1
WireConnection;81;0;83;1
WireConnection;81;1;70;1
WireConnection;82;0;84;1
WireConnection;82;1;73;1
WireConnection;273;1;237;0
WireConnection;273;0;276;0
WireConnection;236;0;155;0
WireConnection;236;1;232;0
WireConnection;161;1;160;0
WireConnection;125;1;140;0
WireConnection;102;0;100;0
WireConnection;1;1;2;0
WireConnection;75;0;80;0
WireConnection;75;1;81;0
WireConnection;75;2;82;0
WireConnection;152;0;273;0
WireConnection;274;1;236;0
WireConnection;274;0;275;0
WireConnection;150;1;3;0
WireConnection;158;0;161;3
WireConnection;158;1;274;0
WireConnection;99;0;75;0
WireConnection;99;1;100;0
WireConnection;103;0;102;0
WireConnection;103;1;1;2
WireConnection;134;0;102;0
WireConnection;134;1;1;1
WireConnection;134;2;125;2
WireConnection;154;0;1;3
WireConnection;154;1;102;0
WireConnection;154;2;152;0
WireConnection;162;0;150;0
WireConnection;162;1;158;0
WireConnection;101;0;99;0
WireConnection;101;1;103;0
WireConnection;101;2;134;0
WireConnection;101;3;154;0
WireConnection;226;0;214;3
WireConnection;226;2;227;0
WireConnection;117;0;114;0
WireConnection;120;0;121;0
WireConnection;164;0;101;0
WireConnection;215;1;226;0
WireConnection;163;0;162;0
WireConnection;119;0;117;1
WireConnection;119;1;120;0
WireConnection;212;0;215;0
WireConnection;4;0;164;0
WireConnection;4;1;163;0
WireConnection;118;0;119;0
WireConnection;118;1;117;2
WireConnection;118;2;117;3
WireConnection;165;0;4;0
WireConnection;165;1;212;0
WireConnection;165;2;223;0
WireConnection;228;1;4;0
WireConnection;116;0;114;0
WireConnection;116;1;118;0
WireConnection;166;0;228;0
WireConnection;166;1;165;0
WireConnection;113;0;116;0
WireConnection;113;1;166;0
WireConnection;60;0;113;0
ASEEND*/
//CHKSM=6EE73447C4D2FE039AA26A5D47BD218B5EA15C1C
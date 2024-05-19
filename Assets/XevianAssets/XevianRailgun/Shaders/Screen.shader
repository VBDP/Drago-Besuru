// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Railgun/Screen"
{
	Properties
	{
		_Spacing("Spacing", Float) = -0.25
		_LoHiTiling("LoHiTiling", Vector) = (1,1,0,0)
		_LoHiOffset("LoHiOffset", Vector) = (0,0,0,0)
		_HighPower("HighPower", Int) = 0
		_Font("Font", 2D) = "white" {}
		_Offset("Offset", Vector) = (-0.04,0,0,0)
		_Tiling("Tiling", Vector) = (1,1,0,0)
		_Value2("Value 2", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform int _HighPower;
		uniform float _Value2;
		uniform sampler2D _Font;
		uniform float2 _Tiling;
		uniform float2 _Offset;
		uniform float _Spacing;
		uniform float2 _LoHiTiling;
		uniform float2 _LoHiOffset;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float temp_output_133_0 = round( ( (float)_HighPower == 0.0 ? 1.0 : ( (float)_HighPower == 2.0 ? 20.0 : 4.0 ) ) );
			float temp_output_135_0 = round( _Value2 );
			float4 color118 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
			float4 color121 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
			float4 ifLocalVar117 = 0;
			if( temp_output_133_0 <= temp_output_135_0 )
				ifLocalVar117 = color121;
			else
				ifLocalVar117 = color118;
			int temp_output_22_0_g358 = 0;
			float2 temp_output_21_0_g357 = _Tiling;
			float2 break18_g358 = temp_output_21_0_g357;
			float4 appendResult20_g358 = (float4(( break18_g358.x * 1.666667 ) , break18_g358.y , 0.0 , 0.0));
			float2 temp_output_19_0_g357 = _Offset;
			float2 uv_TexCoord5_g358 = i.uv_texcoord * appendResult20_g358.xy + temp_output_19_0_g357;
			float temp_output_4_0_g359 = 4.0;
			float temp_output_5_0_g359 = 3.0;
			float2 appendResult7_g359 = (float2(temp_output_4_0_g359 , temp_output_5_0_g359));
			float totalFrames39_g359 = ( temp_output_4_0_g359 * temp_output_5_0_g359 );
			float2 appendResult8_g359 = (float2(totalFrames39_g359 , temp_output_5_0_g359));
			float temp_output_18_0_g357 = temp_output_133_0;
			float clampResult42_g359 = clamp( 0.0 , 0.0001 , ( totalFrames39_g359 - 1.0 ) );
			float temp_output_35_0_g359 = frac( ( ( ( temp_output_18_0_g357 == 0.0 ? 0.0 : ( frac( ( ( temp_output_18_0_g357 == 0.0 ? 1.0 : temp_output_18_0_g357 ) / 100.0 ) ) * 10.0 ) ) + clampResult42_g359 ) / totalFrames39_g359 ) );
			float2 appendResult29_g359 = (float2(temp_output_35_0_g359 , ( 1.0 - temp_output_35_0_g359 )));
			float2 temp_output_15_0_g359 = ( ( uv_TexCoord5_g358 / appendResult7_g359 ) + ( floor( ( appendResult8_g359 * appendResult29_g359 ) ) / appendResult7_g359 ) );
			float4 tex2DNode13_g358 = tex2D( _Font, ( ( ( uv_TexCoord5_g358 + temp_output_15_0_g359 ) * float2( 1,1 ) ) + float2( 0,0 ) ) );
			float2 appendResult10_g360 = (float2(0.171 , 0.21));
			float2 temp_output_11_0_g360 = ( abs( (( uv_TexCoord5_g358 + float2( 0.42,-0.385 ) )*2.0 + -1.0) ) - appendResult10_g360 );
			float2 break16_g360 = ( 1.0 - ( temp_output_11_0_g360 / fwidth( temp_output_11_0_g360 ) ) );
			float temp_output_9_0_g358 = saturate( min( break16_g360.x , break16_g360.y ) );
			float temp_output_12_0_g358 = ( ( ( (float)temp_output_22_0_g358 == 0.0 ? tex2DNode13_g358.r : 0.0 ) + ( (float)temp_output_22_0_g358 == 1.0 ? tex2DNode13_g358.g : 0.0 ) + ( (float)temp_output_22_0_g358 == 2.0 ? tex2DNode13_g358.b : 0.0 ) ) * temp_output_9_0_g358 );
			int temp_output_22_0_g361 = 0;
			float2 break18_g361 = temp_output_21_0_g357;
			float4 appendResult20_g361 = (float4(( break18_g361.x * 1.666667 ) , break18_g361.y , 0.0 , 0.0));
			float2 break20_g357 = temp_output_19_0_g357;
			float4 appendResult12_g357 = (float4(( break20_g357.x + _Spacing ) , break20_g357.y , 0.0 , 0.0));
			float2 uv_TexCoord5_g361 = i.uv_texcoord * appendResult20_g361.xy + appendResult12_g357.xy;
			float temp_output_4_0_g362 = 4.0;
			float temp_output_5_0_g362 = 3.0;
			float2 appendResult7_g362 = (float2(temp_output_4_0_g362 , temp_output_5_0_g362));
			float totalFrames39_g362 = ( temp_output_4_0_g362 * temp_output_5_0_g362 );
			float2 appendResult8_g362 = (float2(totalFrames39_g362 , temp_output_5_0_g362));
			float clampResult42_g362 = clamp( 0.0 , 0.0001 , ( totalFrames39_g362 - 1.0 ) );
			float temp_output_35_0_g362 = frac( ( ( ( temp_output_18_0_g357 == 0.0 ? 0.0 : ( frac( ( ( temp_output_18_0_g357 == 0.0 ? 1.0 : temp_output_18_0_g357 ) / 10.0 ) ) * 10.0 ) ) + clampResult42_g362 ) / totalFrames39_g362 ) );
			float2 appendResult29_g362 = (float2(temp_output_35_0_g362 , ( 1.0 - temp_output_35_0_g362 )));
			float2 temp_output_15_0_g362 = ( ( uv_TexCoord5_g361 / appendResult7_g362 ) + ( floor( ( appendResult8_g362 * appendResult29_g362 ) ) / appendResult7_g362 ) );
			float4 tex2DNode13_g361 = tex2D( _Font, ( ( ( uv_TexCoord5_g361 + temp_output_15_0_g362 ) * float2( 1,1 ) ) + float2( 0,0 ) ) );
			float2 appendResult10_g363 = (float2(0.171 , 0.21));
			float2 temp_output_11_0_g363 = ( abs( (( uv_TexCoord5_g361 + float2( 0.42,-0.385 ) )*2.0 + -1.0) ) - appendResult10_g363 );
			float2 break16_g363 = ( 1.0 - ( temp_output_11_0_g363 / fwidth( temp_output_11_0_g363 ) ) );
			float temp_output_9_0_g361 = saturate( min( break16_g363.x , break16_g363.y ) );
			float temp_output_12_0_g361 = ( ( ( (float)temp_output_22_0_g361 == 0.0 ? tex2DNode13_g361.r : 0.0 ) + ( (float)temp_output_22_0_g361 == 1.0 ? tex2DNode13_g361.g : 0.0 ) + ( (float)temp_output_22_0_g361 == 2.0 ? tex2DNode13_g361.b : 0.0 ) ) * temp_output_9_0_g361 );
			int temp_output_22_0_g347 = (int)1.0;
			float2 break18_g347 = _Tiling;
			float4 appendResult20_g347 = (float4(( break18_g347.x * 1.666667 ) , break18_g347.y , 0.0 , 0.0));
			float4 appendResult61 = (float4(( _Offset.x + ( _Spacing * 2.0 ) ) , _Offset.y , 0.0 , 0.0));
			float2 uv_TexCoord5_g347 = i.uv_texcoord * appendResult20_g347.xy + appendResult61.xy;
			float temp_output_4_0_g348 = 4.0;
			float temp_output_5_0_g348 = 3.0;
			float2 appendResult7_g348 = (float2(temp_output_4_0_g348 , temp_output_5_0_g348));
			float totalFrames39_g348 = ( temp_output_4_0_g348 * temp_output_5_0_g348 );
			float2 appendResult8_g348 = (float2(totalFrames39_g348 , temp_output_5_0_g348));
			float clampResult42_g348 = clamp( 0.0 , 0.0001 , ( totalFrames39_g348 - 1.0 ) );
			float temp_output_35_0_g348 = frac( ( ( 9.0 + clampResult42_g348 ) / totalFrames39_g348 ) );
			float2 appendResult29_g348 = (float2(temp_output_35_0_g348 , ( 1.0 - temp_output_35_0_g348 )));
			float2 temp_output_15_0_g348 = ( ( uv_TexCoord5_g347 / appendResult7_g348 ) + ( floor( ( appendResult8_g348 * appendResult29_g348 ) ) / appendResult7_g348 ) );
			float4 tex2DNode13_g347 = tex2D( _Font, ( ( ( uv_TexCoord5_g347 + temp_output_15_0_g348 ) * float2( 1,1 ) ) + float2( 0,0 ) ) );
			float2 appendResult10_g349 = (float2(0.171 , 0.21));
			float2 temp_output_11_0_g349 = ( abs( (( uv_TexCoord5_g347 + float2( 0.42,-0.385 ) )*2.0 + -1.0) ) - appendResult10_g349 );
			float2 break16_g349 = ( 1.0 - ( temp_output_11_0_g349 / fwidth( temp_output_11_0_g349 ) ) );
			float temp_output_9_0_g347 = saturate( min( break16_g349.x , break16_g349.y ) );
			float temp_output_12_0_g347 = ( ( ( (float)temp_output_22_0_g347 == 0.0 ? tex2DNode13_g347.r : 0.0 ) + ( (float)temp_output_22_0_g347 == 1.0 ? tex2DNode13_g347.g : 0.0 ) + ( (float)temp_output_22_0_g347 == 2.0 ? tex2DNode13_g347.b : 0.0 ) ) * temp_output_9_0_g347 );
			int temp_output_22_0_g351 = 0;
			float2 temp_output_21_0_g350 = _Tiling;
			float2 break18_g351 = temp_output_21_0_g350;
			float4 appendResult20_g351 = (float4(( break18_g351.x * 1.666667 ) , break18_g351.y , 0.0 , 0.0));
			float4 appendResult64 = (float4(( _Offset.x + ( _Spacing * 3.0 ) ) , _Offset.y , 0.0 , 0.0));
			float2 temp_output_19_0_g350 = appendResult64.xy;
			float2 uv_TexCoord5_g351 = i.uv_texcoord * appendResult20_g351.xy + temp_output_19_0_g350;
			float temp_output_4_0_g352 = 4.0;
			float temp_output_5_0_g352 = 3.0;
			float2 appendResult7_g352 = (float2(temp_output_4_0_g352 , temp_output_5_0_g352));
			float totalFrames39_g352 = ( temp_output_4_0_g352 * temp_output_5_0_g352 );
			float2 appendResult8_g352 = (float2(totalFrames39_g352 , temp_output_5_0_g352));
			float temp_output_18_0_g350 = temp_output_135_0;
			float clampResult42_g352 = clamp( 0.0 , 0.0001 , ( totalFrames39_g352 - 1.0 ) );
			float temp_output_35_0_g352 = frac( ( ( ( temp_output_18_0_g350 == 0.0 ? 0.0 : ( frac( ( ( temp_output_18_0_g350 == 0.0 ? 1.0 : temp_output_18_0_g350 ) / 100.0 ) ) * 10.0 ) ) + clampResult42_g352 ) / totalFrames39_g352 ) );
			float2 appendResult29_g352 = (float2(temp_output_35_0_g352 , ( 1.0 - temp_output_35_0_g352 )));
			float2 temp_output_15_0_g352 = ( ( uv_TexCoord5_g351 / appendResult7_g352 ) + ( floor( ( appendResult8_g352 * appendResult29_g352 ) ) / appendResult7_g352 ) );
			float4 tex2DNode13_g351 = tex2D( _Font, ( ( ( uv_TexCoord5_g351 + temp_output_15_0_g352 ) * float2( 1,1 ) ) + float2( 0,0 ) ) );
			float2 appendResult10_g353 = (float2(0.171 , 0.21));
			float2 temp_output_11_0_g353 = ( abs( (( uv_TexCoord5_g351 + float2( 0.42,-0.385 ) )*2.0 + -1.0) ) - appendResult10_g353 );
			float2 break16_g353 = ( 1.0 - ( temp_output_11_0_g353 / fwidth( temp_output_11_0_g353 ) ) );
			float temp_output_9_0_g351 = saturate( min( break16_g353.x , break16_g353.y ) );
			float temp_output_12_0_g351 = ( ( ( (float)temp_output_22_0_g351 == 0.0 ? tex2DNode13_g351.r : 0.0 ) + ( (float)temp_output_22_0_g351 == 1.0 ? tex2DNode13_g351.g : 0.0 ) + ( (float)temp_output_22_0_g351 == 2.0 ? tex2DNode13_g351.b : 0.0 ) ) * temp_output_9_0_g351 );
			int temp_output_22_0_g354 = 0;
			float2 break18_g354 = temp_output_21_0_g350;
			float4 appendResult20_g354 = (float4(( break18_g354.x * 1.666667 ) , break18_g354.y , 0.0 , 0.0));
			float2 break20_g350 = temp_output_19_0_g350;
			float4 appendResult12_g350 = (float4(( break20_g350.x + _Spacing ) , break20_g350.y , 0.0 , 0.0));
			float2 uv_TexCoord5_g354 = i.uv_texcoord * appendResult20_g354.xy + appendResult12_g350.xy;
			float temp_output_4_0_g355 = 4.0;
			float temp_output_5_0_g355 = 3.0;
			float2 appendResult7_g355 = (float2(temp_output_4_0_g355 , temp_output_5_0_g355));
			float totalFrames39_g355 = ( temp_output_4_0_g355 * temp_output_5_0_g355 );
			float2 appendResult8_g355 = (float2(totalFrames39_g355 , temp_output_5_0_g355));
			float clampResult42_g355 = clamp( 0.0 , 0.0001 , ( totalFrames39_g355 - 1.0 ) );
			float temp_output_35_0_g355 = frac( ( ( ( temp_output_18_0_g350 == 0.0 ? 0.0 : ( frac( ( ( temp_output_18_0_g350 == 0.0 ? 1.0 : temp_output_18_0_g350 ) / 10.0 ) ) * 10.0 ) ) + clampResult42_g355 ) / totalFrames39_g355 ) );
			float2 appendResult29_g355 = (float2(temp_output_35_0_g355 , ( 1.0 - temp_output_35_0_g355 )));
			float2 temp_output_15_0_g355 = ( ( uv_TexCoord5_g354 / appendResult7_g355 ) + ( floor( ( appendResult8_g355 * appendResult29_g355 ) ) / appendResult7_g355 ) );
			float4 tex2DNode13_g354 = tex2D( _Font, ( ( ( uv_TexCoord5_g354 + temp_output_15_0_g355 ) * float2( 1,1 ) ) + float2( 0,0 ) ) );
			float2 appendResult10_g356 = (float2(0.171 , 0.21));
			float2 temp_output_11_0_g356 = ( abs( (( uv_TexCoord5_g354 + float2( 0.42,-0.385 ) )*2.0 + -1.0) ) - appendResult10_g356 );
			float2 break16_g356 = ( 1.0 - ( temp_output_11_0_g356 / fwidth( temp_output_11_0_g356 ) ) );
			float temp_output_9_0_g354 = saturate( min( break16_g356.x , break16_g356.y ) );
			float temp_output_12_0_g354 = ( ( ( (float)temp_output_22_0_g354 == 0.0 ? tex2DNode13_g354.r : 0.0 ) + ( (float)temp_output_22_0_g354 == 1.0 ? tex2DNode13_g354.g : 0.0 ) + ( (float)temp_output_22_0_g354 == 2.0 ? tex2DNode13_g354.b : 0.0 ) ) * temp_output_9_0_g354 );
			int temp_output_22_0_g371 = (int)1.0;
			float2 break18_g371 = _LoHiTiling;
			float4 appendResult20_g371 = (float4(( break18_g371.x * 1.666667 ) , break18_g371.y , 0.0 , 0.0));
			float2 uv_TexCoord5_g371 = i.uv_texcoord * appendResult20_g371.xy + _LoHiOffset;
			float temp_output_4_0_g372 = 4.0;
			float temp_output_5_0_g372 = 3.0;
			float2 appendResult7_g372 = (float2(temp_output_4_0_g372 , temp_output_5_0_g372));
			float totalFrames39_g372 = ( temp_output_4_0_g372 * temp_output_5_0_g372 );
			float2 appendResult8_g372 = (float2(totalFrames39_g372 , temp_output_5_0_g372));
			int temp_output_28_0_g364 = _HighPower;
			float clampResult42_g372 = clamp( 0.0 , 0.0001 , ( totalFrames39_g372 - 1.0 ) );
			float temp_output_35_0_g372 = frac( ( ( ( (float)temp_output_28_0_g364 == 0.0 ? 4.0 : ( (float)temp_output_28_0_g364 == 2.0 ? 6.0 : 2.0 ) ) + clampResult42_g372 ) / totalFrames39_g372 ) );
			float2 appendResult29_g372 = (float2(temp_output_35_0_g372 , ( 1.0 - temp_output_35_0_g372 )));
			float2 temp_output_15_0_g372 = ( ( uv_TexCoord5_g371 / appendResult7_g372 ) + ( floor( ( appendResult8_g372 * appendResult29_g372 ) ) / appendResult7_g372 ) );
			float4 tex2DNode13_g371 = tex2D( _Font, ( ( ( uv_TexCoord5_g371 + temp_output_15_0_g372 ) * float2( 1,1 ) ) + float2( 0,0 ) ) );
			float2 appendResult10_g373 = (float2(0.171 , 0.21));
			float2 temp_output_11_0_g373 = ( abs( (( uv_TexCoord5_g371 + float2( 0.42,-0.385 ) )*2.0 + -1.0) ) - appendResult10_g373 );
			float2 break16_g373 = ( 1.0 - ( temp_output_11_0_g373 / fwidth( temp_output_11_0_g373 ) ) );
			float temp_output_9_0_g371 = saturate( min( break16_g373.x , break16_g373.y ) );
			float temp_output_12_0_g371 = ( ( ( (float)temp_output_22_0_g371 == 0.0 ? tex2DNode13_g371.r : 0.0 ) + ( (float)temp_output_22_0_g371 == 1.0 ? tex2DNode13_g371.g : 0.0 ) + ( (float)temp_output_22_0_g371 == 2.0 ? tex2DNode13_g371.b : 0.0 ) ) * temp_output_9_0_g371 );
			int temp_output_22_0_g374 = (int)1.0;
			float2 break18_g374 = _LoHiTiling;
			float4 appendResult20_g374 = (float4(( break18_g374.x * 1.666667 ) , break18_g374.y , 0.0 , 0.0));
			float4 appendResult12_g364 = (float4(( _LoHiOffset.x + _Spacing ) , _LoHiOffset.y , 0.0 , 0.0));
			float2 uv_TexCoord5_g374 = i.uv_texcoord * appendResult20_g374.xy + appendResult12_g364.xy;
			float temp_output_4_0_g375 = 4.0;
			float temp_output_5_0_g375 = 3.0;
			float2 appendResult7_g375 = (float2(temp_output_4_0_g375 , temp_output_5_0_g375));
			float totalFrames39_g375 = ( temp_output_4_0_g375 * temp_output_5_0_g375 );
			float2 appendResult8_g375 = (float2(totalFrames39_g375 , temp_output_5_0_g375));
			float clampResult42_g375 = clamp( 0.0 , 0.0001 , ( totalFrames39_g375 - 1.0 ) );
			float temp_output_35_0_g375 = frac( ( ( ( (float)temp_output_28_0_g364 == 0.0 ? 5.0 : ( (float)temp_output_28_0_g364 == 2.0 ? 7.0 : 10.0 ) ) + clampResult42_g375 ) / totalFrames39_g375 ) );
			float2 appendResult29_g375 = (float2(temp_output_35_0_g375 , ( 1.0 - temp_output_35_0_g375 )));
			float2 temp_output_15_0_g375 = ( ( uv_TexCoord5_g374 / appendResult7_g375 ) + ( floor( ( appendResult8_g375 * appendResult29_g375 ) ) / appendResult7_g375 ) );
			float4 tex2DNode13_g374 = tex2D( _Font, ( ( ( uv_TexCoord5_g374 + temp_output_15_0_g375 ) * float2( 1,1 ) ) + float2( 0,0 ) ) );
			float2 appendResult10_g376 = (float2(0.171 , 0.21));
			float2 temp_output_11_0_g376 = ( abs( (( uv_TexCoord5_g374 + float2( 0.42,-0.385 ) )*2.0 + -1.0) ) - appendResult10_g376 );
			float2 break16_g376 = ( 1.0 - ( temp_output_11_0_g376 / fwidth( temp_output_11_0_g376 ) ) );
			float temp_output_9_0_g374 = saturate( min( break16_g376.x , break16_g376.y ) );
			float temp_output_12_0_g374 = ( ( ( (float)temp_output_22_0_g374 == 0.0 ? tex2DNode13_g374.r : 0.0 ) + ( (float)temp_output_22_0_g374 == 1.0 ? tex2DNode13_g374.g : 0.0 ) + ( (float)temp_output_22_0_g374 == 2.0 ? tex2DNode13_g374.b : 0.0 ) ) * temp_output_9_0_g374 );
			int temp_output_22_0_g368 = (int)1.0;
			float2 break18_g368 = _LoHiTiling;
			float4 appendResult20_g368 = (float4(( break18_g368.x * 1.666667 ) , break18_g368.y , 0.0 , 0.0));
			float2 appendResult11_g364 = (float2(( _LoHiOffset.x + ( _Spacing * 2.0 ) ) , _LoHiOffset.y));
			float2 uv_TexCoord5_g368 = i.uv_texcoord * appendResult20_g368.xy + appendResult11_g364;
			float temp_output_4_0_g369 = 4.0;
			float temp_output_5_0_g369 = 3.0;
			float2 appendResult7_g369 = (float2(temp_output_4_0_g369 , temp_output_5_0_g369));
			float totalFrames39_g369 = ( temp_output_4_0_g369 * temp_output_5_0_g369 );
			float2 appendResult8_g369 = (float2(totalFrames39_g369 , temp_output_5_0_g369));
			float clampResult42_g369 = clamp( 0.0 , 0.0001 , ( totalFrames39_g369 - 1.0 ) );
			float temp_output_35_0_g369 = frac( ( ( ( (float)temp_output_28_0_g364 == 0.0 ? 0.0 : ( (float)temp_output_28_0_g364 == 2.0 ? 8.0 : 11.0 ) ) + clampResult42_g369 ) / totalFrames39_g369 ) );
			float2 appendResult29_g369 = (float2(temp_output_35_0_g369 , ( 1.0 - temp_output_35_0_g369 )));
			float2 temp_output_15_0_g369 = ( ( uv_TexCoord5_g368 / appendResult7_g369 ) + ( floor( ( appendResult8_g369 * appendResult29_g369 ) ) / appendResult7_g369 ) );
			float4 tex2DNode13_g368 = tex2D( _Font, ( ( ( uv_TexCoord5_g368 + temp_output_15_0_g369 ) * float2( 1,1 ) ) + float2( 0,0 ) ) );
			float2 appendResult10_g370 = (float2(0.171 , 0.21));
			float2 temp_output_11_0_g370 = ( abs( (( uv_TexCoord5_g368 + float2( 0.42,-0.385 ) )*2.0 + -1.0) ) - appendResult10_g370 );
			float2 break16_g370 = ( 1.0 - ( temp_output_11_0_g370 / fwidth( temp_output_11_0_g370 ) ) );
			float temp_output_9_0_g368 = saturate( min( break16_g370.x , break16_g370.y ) );
			float temp_output_12_0_g368 = ( ( ( (float)temp_output_22_0_g368 == 0.0 ? tex2DNode13_g368.r : 0.0 ) + ( (float)temp_output_22_0_g368 == 1.0 ? tex2DNode13_g368.g : 0.0 ) + ( (float)temp_output_22_0_g368 == 2.0 ? tex2DNode13_g368.b : 0.0 ) ) * temp_output_9_0_g368 );
			int temp_output_22_0_g365 = (int)1.0;
			float2 break18_g365 = _LoHiTiling;
			float4 appendResult20_g365 = (float4(( break18_g365.x * 1.666667 ) , break18_g365.y , 0.0 , 0.0));
			float2 appendResult10_g364 = (float2(( _LoHiOffset.x + ( _Spacing * 3.0 ) ) , _LoHiOffset.y));
			float2 uv_TexCoord5_g365 = i.uv_texcoord * appendResult20_g365.xy + appendResult10_g364;
			float temp_output_4_0_g366 = 4.0;
			float temp_output_5_0_g366 = 3.0;
			float2 appendResult7_g366 = (float2(temp_output_4_0_g366 , temp_output_5_0_g366));
			float totalFrames39_g366 = ( temp_output_4_0_g366 * temp_output_5_0_g366 );
			float2 appendResult8_g366 = (float2(totalFrames39_g366 , temp_output_5_0_g366));
			float clampResult42_g366 = clamp( 0.0 , 0.0001 , ( totalFrames39_g366 - 1.0 ) );
			float temp_output_35_0_g366 = frac( ( ( ( (float)temp_output_28_0_g364 == 0.0 ? 0.0 : ( (float)temp_output_28_0_g364 == 2.0 ? 6.0 : 0.0 ) ) + clampResult42_g366 ) / totalFrames39_g366 ) );
			float2 appendResult29_g366 = (float2(temp_output_35_0_g366 , ( 1.0 - temp_output_35_0_g366 )));
			float2 temp_output_15_0_g366 = ( ( uv_TexCoord5_g365 / appendResult7_g366 ) + ( floor( ( appendResult8_g366 * appendResult29_g366 ) ) / appendResult7_g366 ) );
			float4 tex2DNode13_g365 = tex2D( _Font, ( ( ( uv_TexCoord5_g365 + temp_output_15_0_g366 ) * float2( 1,1 ) ) + float2( 0,0 ) ) );
			float2 appendResult10_g367 = (float2(0.171 , 0.21));
			float2 temp_output_11_0_g367 = ( abs( (( uv_TexCoord5_g365 + float2( 0.42,-0.385 ) )*2.0 + -1.0) ) - appendResult10_g367 );
			float2 break16_g367 = ( 1.0 - ( temp_output_11_0_g367 / fwidth( temp_output_11_0_g367 ) ) );
			float temp_output_9_0_g365 = saturate( min( break16_g367.x , break16_g367.y ) );
			float temp_output_12_0_g365 = ( ( ( (float)temp_output_22_0_g365 == 0.0 ? tex2DNode13_g365.r : 0.0 ) + ( (float)temp_output_22_0_g365 == 1.0 ? tex2DNode13_g365.g : 0.0 ) + ( (float)temp_output_22_0_g365 == 2.0 ? tex2DNode13_g365.b : 0.0 ) ) * temp_output_9_0_g365 );
			float4 color131 = IsGammaSpace() ? float4(0,1,0,0) : float4(0,1,0,0);
			float4 color129 = IsGammaSpace() ? float4(1,0,0,0) : float4(1,0,0,0);
			float4 color130 = IsGammaSpace() ? float4(1,1,0,0) : float4(1,1,0,0);
			float4 temp_output_122_0 = ( ( ifLocalVar117 * ( ( temp_output_12_0_g358 + temp_output_12_0_g361 ) + temp_output_12_0_g347 + ( temp_output_12_0_g351 + temp_output_12_0_g354 ) ) ) + ( ( temp_output_12_0_g371 + temp_output_12_0_g374 + temp_output_12_0_g368 + temp_output_12_0_g365 ) * ( (float)_HighPower == 0.0 ? color131 : ( (float)_HighPower == 2.0 ? color129 : color130 ) ) ) );
			o.Albedo = temp_output_122_0.rgb;
			o.Emission = temp_output_122_0.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18935
496;73;1497;770;941.6627;-314.6955;1.3;True;True
Node;AmplifyShaderEditor.RangedFloatNode;101;-2011.035,1001.356;Inherit;False;Property;_Spacing;Spacing;44;0;Fetch;True;0;0;0;False;0;False;-0.25;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;115;-714.9539,1067.975;Inherit;False;Property;_HighPower;HighPower;36;0;Create;True;0;0;0;False;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.Vector2Node;59;-1759.855,705.4254;Inherit;False;Property;_Offset;Offset;42;0;Create;True;0;0;0;False;0;False;-0.04,0;-0.04,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;102;-1832.035,827.3562;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;100;-1810.035,930.3562;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;126;-1876.933,142.4226;Inherit;False;0;4;0;INT;2;False;1;FLOAT;2;False;2;FLOAT;20;False;3;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;60;-1512.443,735.0777;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;63;-1482.201,927.2385;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-0.75;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;66;-1684.037,1054.332;Inherit;False;Property;_Value2;Value 2;45;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;127;-1708.752,229.7472;Inherit;False;0;4;0;INT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;97;-1065.273,791.8062;Inherit;False;Constant;_Float1;Float 1;17;0;Create;True;0;0;0;False;0;False;9;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;130;-410.5372,1387.787;Inherit;False;Constant;_Color2;Color 2;17;0;Create;True;0;0;0;False;0;False;1,1,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;61;-1357.152,760.9594;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RoundOpNode;133;-1465.025,283.099;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;129;-409.6385,1225.776;Inherit;False;Constant;_Color1;Color 1;17;0;Create;True;0;0;0;False;0;False;1,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RoundOpNode;135;-1530.644,1141.314;Inherit;False;1;0;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;58;-1734.632,526.1295;Inherit;False;Property;_Tiling;Tiling;43;0;Create;True;0;0;0;False;0;False;1,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;96;-1088.102,625.2843;Inherit;False;Constant;_Float0;Float 0;17;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;64;-1326.91,953.1202;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;184;-1332.568,461.1112;Inherit;True;Digits;0;;357;6e3b70527ec109748a67c157ca0186dd;0;3;21;FLOAT2;0,0;False;18;FLOAT;0;False;19;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;121;-619.6673,353.8328;Inherit;False;Constant;_Color0;Color 0;18;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;118;-638.2222,197.5246;Inherit;False;Constant;_Color0;Color 0;18;0;Create;True;0;0;0;False;0;False;1,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Compare;136;-163.2551,1153.645;Inherit;False;0;4;0;INT;2;False;1;FLOAT;2;False;2;COLOR;20,0,0,0;False;3;COLOR;4,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;131;-420.7163,1577.987;Inherit;False;Constant;_Color3;Color 3;17;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;183;-1043.335,941.6697;Inherit;True;Digits;0;;350;6e3b70527ec109748a67c157ca0186dd;0;3;21;FLOAT2;0,0;False;18;FLOAT;0;False;19;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;182;-885.1943,668.4553;Inherit;True;Font;37;;347;673564856a2cf924eb521fc93f35fd9f;0;4;22;INT;0;False;16;FLOAT2;0,0;False;17;FLOAT2;1,1;False;21;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;117;-301.2577,372.7269;Inherit;False;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;57;-301.8078,602.754;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Compare;137;54.51584,1198.267;Inherit;False;0;4;0;INT;0;False;1;FLOAT;0;False;2;COLOR;1,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;185;-508.6952,1069.222;Inherit;True;LoHi;12;;364;dea6fd07c5c05c94f8a6cf3d6d3d6756;0;1;28;INT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-34.27757,389.2855;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;128;-199.9297,901.0992;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;119;41.12248,822.4855;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;122;193.7548,575.4455;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;501.5717,579.8745;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;Railgun/Screen;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;18;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;102;0;101;0
WireConnection;100;0;101;0
WireConnection;126;0;115;0
WireConnection;60;0;59;1
WireConnection;60;1;102;0
WireConnection;63;0;59;1
WireConnection;63;1;100;0
WireConnection;127;0;115;0
WireConnection;127;3;126;0
WireConnection;61;0;60;0
WireConnection;61;1;59;2
WireConnection;133;0;127;0
WireConnection;135;0;66;0
WireConnection;64;0;63;0
WireConnection;64;1;59;2
WireConnection;184;21;58;0
WireConnection;184;18;133;0
WireConnection;184;19;59;0
WireConnection;136;0;115;0
WireConnection;136;2;129;0
WireConnection;136;3;130;0
WireConnection;183;21;58;0
WireConnection;183;18;135;0
WireConnection;183;19;64;0
WireConnection;182;22;96;0
WireConnection;182;16;61;0
WireConnection;182;17;58;0
WireConnection;182;21;97;0
WireConnection;117;0;133;0
WireConnection;117;1;135;0
WireConnection;117;2;118;0
WireConnection;117;3;121;0
WireConnection;117;4;121;0
WireConnection;57;0;184;0
WireConnection;57;1;182;0
WireConnection;57;2;183;0
WireConnection;137;0;115;0
WireConnection;137;2;131;0
WireConnection;137;3;136;0
WireConnection;185;28;115;0
WireConnection;120;0;117;0
WireConnection;120;1;57;0
WireConnection;128;0;185;0
WireConnection;128;1;137;0
WireConnection;122;0;120;0
WireConnection;122;1;128;0
WireConnection;0;0;122;0
WireConnection;0;2;122;0
ASEEND*/
//CHKSM=6D2AAC7FE6235E43D5F1230BC525CE58142196F6
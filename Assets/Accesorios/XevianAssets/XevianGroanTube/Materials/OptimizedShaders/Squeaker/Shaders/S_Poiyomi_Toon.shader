Shader "Hidden/Locked/.poiyomi/• Poiyomi Toon •/Squeaker-Squeaker"
{
    Properties
    {
        [HideInInspector] shader_is_using_thry_editor ("", Float) = 0
        [HideInInspector] shader_master_label ("<color=#E75898ff>Poiyomi Toon V7.3.046</color>", Float) = 0
        [HideInInspector] shader_presets ("poiToonPresets", Float) = 0
        [HideInInspector] shader_properties_label_file ("7PlusLabels", Float) = 0
        [HideInInspector] footer_youtube ("youtube footer button", Float) = 0
        [HideInInspector] footer_twitter ("twitter footer button", Float) = 0
        [HideInInspector] footer_patreon ("patreon footer button", Float) = 0
        [HideInInspector] footer_discord ("discord footer button", Float) = 0
        [HideInInspector] footer_github ("github footer button", Float) = 0
        [HideInInspector] _ForgotToLockMaterial (";;YOU_FORGOT_TO_LOCK_THIS_MATERIAL;", Int) = 1
        [ThryShaderOptimizerLockButton] _ShaderOptimizerEnabled ("", Int) = 0
        [Helpbox(1)] _LockTooltip ("Animations don't work by default when locked in. Right click a property if you want to animate it. The shader will lock in automatically at upload time.", Int) = 0
        [ThryWideEnum(Opaque, 0, Cutout, 1, TransClipping, 9, Fade, 2, Transparent, 3, Additive, 4, Soft Additive, 5, Multiplicative, 6, 2x Multiplicative, 7, Grab Pass (Pro Only), 8)]_Mode("Rendering Preset--{on_value_actions:[ 
            {value:0,actions:[{type:SET_PROPERTY,data:render_queue=2000}, {type:SET_PROPERTY,data:render_type=Opaque},            {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=1}, {type:SET_PROPERTY,data:_DstBlend=0},  {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=1}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
            {value:1,actions:[{type:SET_PROPERTY,data:render_queue=2450}, {type:SET_PROPERTY,data:render_type=TransparentCutout}, {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=.5}, {type:SET_PROPERTY,data:_SrcBlend=1}, {type:SET_PROPERTY,data:_DstBlend=0},  {type:SET_PROPERTY,data:_AlphaToMask=1},  {type:SET_PROPERTY,data:_ZWrite=1}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
            {value:9,actions:[{type:SET_PROPERTY,data:render_queue=2450}, {type:SET_PROPERTY,data:render_type=TransparentCutout}, {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=5}, {type:SET_PROPERTY,data:_DstBlend=10}, {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=1}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
            {value:2,actions:[{type:SET_PROPERTY,data:render_queue=3000}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=5}, {type:SET_PROPERTY,data:_DstBlend=10}, {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
            {value:3,actions:[{type:SET_PROPERTY,data:render_queue=3000}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=1}, {type:SET_PROPERTY,data:_DstBlend=10}, {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=1}]},
            {value:4,actions:[{type:SET_PROPERTY,data:render_queue=3000}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=1}, {type:SET_PROPERTY,data:_DstBlend=1},  {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
            {value:5,actions:[{type:SET_PROPERTY,data:render_queue=3000}, {type:SET_PROPERTY,data:render_type=Transparent},        {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=4}, {type:SET_PROPERTY,data:_DstBlend=1},  {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
            {value:6,actions:[{type:SET_PROPERTY,data:render_queue=3000}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=2}, {type:SET_PROPERTY,data:_DstBlend=0},  {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]},
            {value:7,actions:[{type:SET_PROPERTY,data:render_queue=3000}, {type:SET_PROPERTY,data:render_type=Transparent},       {type:SET_PROPERTY,data:_BlendOp=0}, {type:SET_PROPERTY,data:_BlendOpAlpha=0}, {type:SET_PROPERTY,data:_Cutoff=0},  {type:SET_PROPERTY,data:_SrcBlend=2}, {type:SET_PROPERTY,data:_DstBlend=3},  {type:SET_PROPERTY,data:_AlphaToMask=0},  {type:SET_PROPERTY,data:_ZWrite=0}, {type:SET_PROPERTY,data:_ZTest=4},   {type:SET_PROPERTY,data:_AlphaPremultiply=0}]}
        }]}]}", Int) = 0
        [HideInInspector] m_mainOptions ("Main", Float) = 0
        _Color ("Color & Alpha", Color) = (1, 1, 1, 1)
        _MainTex ("Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_MainTexPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _MainTextureUV ("UV", Int) = 0
        _MainEmissionStrength ("Basic Emission", Range(0, 20)) = 0
        [Normal]_BumpMap ("Normal Map", 2D) = "bump" { }
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _BumpMapUV ("UV", Int) = 0
        [HideInInspector][Vector2]_BumpMapPan ("Panning", Vector) = (0, 0, 0, 0)
        _BumpScale ("Normal Intensity", Range(0, 10)) = 1
        _ClippingMask ("Alpha Map--{reference_properties:[_ClippingMaskPan, _ClippingMaskUV, _Inverse_Clipping]}", 2D) = "white" { }
        [HideInInspector][Vector2]_ClippingMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _ClippingMaskUV ("UV", Int) = 0
        [ToggleUI]_Inverse_Clipping ("Invert", Float) = 0
        [HideInInspector] m_start_MainHueShift ("Color Adjust", Float) = 0
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _MainColorAdjustTextureUV ("UV", Int) = 0
        [ToggleUI]_MainHueShiftReplace ("Hue Replace?", Float) = 1
        _MainHueShift ("Hue Shift", Range(0, 1)) = 0
        _MainHueShiftSpeed ("Hue Shift Speed", Float) = 0
        _Saturation ("Saturation", Range(-1, 10)) = 0
        _MainBrightness("Brightness", Range(-1,1)) = 0
        [HideInInspector][ThryToggle(COLOR_GRADING_HDR)]_MainHueShiftToggle ("Toggle Hueshift", Float) = 0
        _MainColorAdjustTexture ("Mask R(H) G(S) B(B)--{reference_properties:[_MainColorAdjustTexturePan, _MainColorAdjustTextureUV]}", 2D) = "white" { }
        [HideInInspector][Vector2]_MainColorAdjustTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_end_MainHueShift ("Hue Shift", Float) = 0
        [HideInInspector] m_start_RGBMask ("RGBA Color Masking", Float) = 0
        [HideInInspector][ThryToggle(VIGNETTE)]_RGBMaskEnabled ("RGB Mask Enabled", Float) = 0
        [ToggleUI]_RGBUseVertexColors ("Use Vertex Colors", Float) = 0
        [ToggleUI]_RGBBlendMultiplicative ("Multiplicative?", Float) = 0
        _RGBMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_RGBMaskPanning ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)]_RGBMaskUV ("UV", int) = 0
        _RedColor ("R Color", Color) = (1, 1, 1, 1)
        _RedTexure ("R Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_RGBRedPanning ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)]_RGBRed_UV ("UV", int) = 0
        _GreenColor ("G Color", Color) = (1, 1, 1, 1)
        _GreenTexture ("G Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_RGBGreenPanning ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)]_RGBGreen_UV ("UV", int) = 0
        _BlueColor ("B Color", Color) = (1, 1, 1, 1)
        _BlueTexture ("B Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_RGBBluePanning ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)]_RGBBlue_UV ("UV", int) = 0
        _AlphaColor ("A Color", Color) = (1, 1, 1, 1)
        _AlphaTexture ("A Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_RGBAlphaPanning ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)]_RGBAlpha_UV ("UV", int) = 0
        [ThryToggle(GEOM_TYPE_MESH)]_RgbNormalsEnabled ("Enable Normals", Float) = 0
        [ToggleUI]_RGBNormalBlend ("Blend with Base--{condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", Float) = 0
        [Normal]_RgbNormalR ("R Normal--{reference_properties:[_RgbNormalRPan, _RgbNormalRUV],condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", 2D) = "bump" { }
        [HideInInspector][Vector2]_RgbNormalRPan ("Pan", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)]_RgbNormalRUV ("UV", int) = 0
        _RgbNormalRScale ("Intensity--{condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", Range(0,10)) = 0 
        [Normal]_RgbNormalG ("G Normal--{reference_properties:[_RgbNormalGPan, _RgbNormalGUV],condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", 2D) = "bump" { }
        [HideInInspector][Vector2]_RgbNormalGPan ("Pan", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)]_RgbNormalGUV ("UV", int) = 0
        _RgbNormalGScale ("Intensity--{condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", Range(0,10)) = 0 
        [Normal]_RgbNormalB ("B Normal--{reference_properties:[_RgbNormalBPan, _RgbNormalBUV],condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", 2D) = "bump" { }
        [HideInInspector][Vector2]_RgbNormalBPan ("Pan", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)]_RgbNormalBUV ("UV", int) = 0
        _RgbNormalBScale ("Intensity--{condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", Range(0,10)) = 0 
        [Normal]_RgbNormalA ("A Normal--{reference_properties:[_RgbNormalAPan, _RgbNormalAUV],condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", 2D) = "bump" { }
        [HideInInspector][Vector2]_RgbNormalAPan ("Pan", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)]_RgbNormalAUV ("UV", int) = 0
        _RgbNormalAScale ("Intensity--{condition_show:{type:PROPERTY_BOOL,data:_RgbNormalsEnabled==1}}", Range(0,10)) = 0 
        [HideInInspector] m_end_RGBMask ("RGB Color Masking", Float) = 0
        [HideInInspector] m_start_DetailOptions ("Details--{reference_property:_DetailEnabled, button_help:{text:Tutorial,action:{type:URL,data:https://www.youtube.com/watch?v=9oIcQln9of4&list=PL4_Gy3VRJSmbXfQSldzUiChgABQsoBlLw},hover:YouTube}}", Float) = 0
        [HideInInspector][ThryToggle(FINALPASS)]_DetailEnabled ("Enable", Float) = 0
        _DetailMask ("Detail Mask (R:Texture, G:Normal)", 2D) = "white" { }
        [HideInInspector][Vector2]_DetailMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DetailMaskUV ("UV", Int) = 0
        _DetailTint ("Detail Texture Tint", Color) = (1, 1, 1)
        _DetailTex ("Detail Texture", 2D) = "gray" { }
        [HideInInspector][Vector2]_DetailTexPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DetailTexUV ("UV", Int) = 0
        _DetailTexIntensity ("Detail Tex Intensity", Range(0, 10)) = 1
        _DetailBrightness ("Detail Brightness:", Range(0, 2)) = 1
        [Normal]_DetailNormalMap ("Detail Normal", 2D) = "bump" { }
        _DetailNormalMapScale ("Detail Normal Intensity", Range(0, 10)) = 1
        [HideInInspector][Vector2]_DetailNormalMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DetailNormalMapUV ("UV", Int) = 0
        [HideInInspector] m_end_DetailOptions ("Details", Float) = 0
        [HideInInspector] m_start_MainVertexColors ("Vertex Colors", Float) = 0
        [ToggleUI]_MainVertexColoringLinearSpace("Linear Colors", Float) = 1
        _MainVertexColoring ("Use Vertex Color", Range(0, 1)) = 0
        _MainUseVertexColorAlpha ("Use Vertex Color Alpha", Range(0, 1)) = 0
        [HideInInspector] m_end_MainVertexColors ("Vertex Colors", Float) = 0
        [HideInInspector] m_start_vertexManipulation ("Vertex Offset--{reference_property:_VertexManipulationsEnabled, button_help:{text:Tutorial,action:{type:URL,data:https://www.youtube.com/watch?v=x728WN50JeA&list=PL4_Gy3VRJSmbXfQSldzUiChgABQsoBlLw},hover:YouTube}}", Float) = 0
        [HideInInspector][ThryToggle(AUTO_EXPOSURE)]_VertexManipulationsEnabled ("Enabled", Float) = 0
        [Vector3]_VertexManipulationLocalTranslation ("Local Translation", Vector) = (0, 0, 0, 1)
        [Vector3]_VertexManipulationLocalRotation ("Local Rotation", Vector) = (0, 0, 0, 1)
        _VertexManipulationLocalScale ("Local Scale", Vector) = (1, 1, 1, 1)
        [Vector3]_VertexManipulationWorldTranslation ("World Translation", Vector) = (0, 0, 0, 1)
        _VertexManipulationHeight ("Vertex Height", Float) = 0
        _VertexManipulationHeightMask ("Height Map", 2D) = "white" { }
        [HideInInspector][Vector2]_VertexManipulationHeightPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3)] _VertexManipulationHeightUV ("UV", Int) = 0
        _VertexManipulationHeightBias ("Mask Bias", Range(0, 1)) = 0
        [ToggleUI]_VertexRoundingEnabled ("Rounding Enabled", Float) = 0
        _VertexRoundingDivision ("Division Amount", Float) = 500
        [HideInInspector] m_end_vertexManipulation ("Vertex Offset", Float) = 0
        [HideInInspector] m_start_Alpha ("Alpha Options", Float) = 0
        _Cutoff ("Alpha Cuttoff", Range(0, 1.001)) = 0.5
        [ToggleUI]_DitheringEnabled ("Enable Dithering", Float) = 0
        _DitherGradient ("Dither Gradient", Range(0, 1)) = .1
        [ToggleUI]_ForceOpaque ("Force Opaque", Float) = 0
        _MainShadowClipMod ("Shadow Clip Mod", Range(-1, 1)) = 0
        [Enum(Off, 0, On, 1)] _AlphaToMask ("Alpha To Coverage", Float) = 0
        [ToggleUI]_MainAlphaToCoverage ("Sharpenned A2C--{condition_show:{type:PROPERTY_BOOL,data:_AlphaToMask==1}}", Float) = 0
        _MainMipScale ("Mip Level Alpha Scale--{condition_show:{type:PROPERTY_BOOL,data:_AlphaToMask==1}}", Range(0, 1)) = 0.25
        [ToggleUI]_AlphaPremultiply ("Alpha Premultiply", Float) = 0
        _AlphaMod ("Alpha Mod", Range(-1, 1)) = 0.0
        [HideInInspector] m_end_Alpha ("Alpha Options", Float) = 0
        [HideInInspector] m_start_DecalSection ("Decals--{button_help:{text:Tutorial,action:{type:URL,data:https://www.youtube.com/watch?v=xHoQVN_F7JE&list=PL4_Gy3VRJSmbXfQSldzUiChgABQsoBlLw},hover:YouTube},reference_property:_DecalEnabled}", Float) = 0
        _DecalMask ("Decal RGBA Mask--{reference_properties:[_DecalMaskPan, _DecalMaskUV]}", 2D) = "white" { }
        [HideInInspector][Vector2]_DecalMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DecalMaskUV ("UV", Int) = 0
        [HideInInspector] m_start_Decal0 ("Decal 0", Float) = 0
        [HideInInspector][ThryToggle(GEOM_TYPE_BRANCH)]_DecalEnabled ("Enable", Float) = 0
        _DecalColor ("Color", Color) = (1, 1, 1, 1)
        _DecalEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        _DecalTexture ("Decal--{reference_properties:[_DecalTexturePan, _DecalTextureUV]}", 2D) = "white" { }
        [HideInInspector][Vector2]_DecalTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DecalTextureUV ("UV", Int) = 0
        [ToggleUI]_DecalTiled ("Tiled?", Float) = 0
        _Decal0Depth ("Depth", Float) = 0
        [Vector2]_DecalScale ("Scale", Vector) = (1, 1, 0, 0)
        [Vector2]_DecalPosition ("Position", Vector) = (.5, .5, 0, 0)
        _DecalRotation ("Rotation", Range(0, 360)) = 0
        _DecalRotationSpeed ("Rotation Speed", Float) = 0
         [ThryWideEnum(Replace, 0, Darken, 1, Multiply, 2, Color Burn, 3, Linear Burn, 4, Lighten, 5, Screen, 6, Color Dodge, 7, Linear Dodge (Add), 8, Overlay, 9, Soft Lighten, 10, Hard Light, 11, Vivid Light, 12, Linear Light, 13, Pin Light, 14, Hard Mix, 15, Difference, 16, Exclusion, 17, Subtract, 18, Divide, 19)]_DecalBlendType ("Blending", Range(0, 1)) = 0
        _DecalBlendAlpha("Alpha", Range(0,1)) = 1
        [ToggleUI]_DecalHueShiftEnabled ("Hue Shift Enabled", Float) = 0
        _DecalHueShiftSpeed ("Shift Speed", Float) = 0
        _DecalHueShift ("Hue Shift", Range(0,1)) = 0
        [HideInInspector] m_start_Decal0AudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal0ScaleBand ("Scale Band", Int) = 0
        _AudioLinkDecal0Scale("Scale Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal0RotationBand ("Rotation Band", Int) = 0
        [Vector2]_AudioLinkDecal0Rotation("Rotation Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal0AlphaBand ("Alpha Band", Int) = 0
        [Vector2]_AudioLinkDecal0Alpha("Alpha Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal0EmissionBand ("Emission Band", Int) = 0
        [Vector2]_AudioLinkDecal0Emission("Emission Mod", Vector) = (0,0,0,0)
        [HideInInspector] m_end_Decal0AudioLink ("Audio Link", Float) = 0
        [HideInInspector] m_end_Decal0 ("Decal 0", Float) = 0
        [HideInInspector] m_start_Decal1 ("Decal 1--{reference_property:_DecalEnabled1}", Float) = 0
        [HideInInspector][ThryToggle(GEOM_TYPE_BRANCH_DETAIL)]_DecalEnabled1 ("Enable", Float) = 0
        _DecalColor1 ("Color", Color) = (1, 1, 1, 1)
        _DecalEmissionStrength1 ("Emission Strength", Range(0, 20)) = 0
        _DecalTexture1 ("Decal--{reference_properties:[_DecalTexture1Pan, _DecalTexture1UV]}", 2D) = "white" { }
        [HideInInspector][Vector2]_DecalTexture1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DecalTexture1UV ("UV", Int) = 0
        [ToggleUI]_DecalTiled1 ("Tiled?", Float) = 0
        _Decal1Depth ("Depth", Float) = 0
        [Vector2]_DecalScale1 ("Scale", Vector) = (1, 1, 0, 0)
        [Vector2]_DecalPosition1 ("Position", Vector) = (.5, .5, 0, 0)
        _DecalRotation1 ("Rotation", Range(0, 360)) = 0
        _DecalRotationSpeed1 ("Rotation Speed", Float) = 0
         [ThryWideEnum(Replace, 0, Darken, 1, Multiply, 2, Color Burn, 3, Linear Burn, 4, Lighten, 5, Screen, 6, Color Dodge, 7, Linear Dodge (Add), 8, Overlay, 9, Soft Lighten, 10, Hard Light, 11, Vivid Light, 12, Linear Light, 13, Pin Light, 14, Hard Mix, 15, Difference, 16, Exclusion, 17, Subtract, 18, Divide, 19)]_DecalBlendType1 ("Blending", Range(0, 1)) = 0
        _DecalBlendAlpha1("Alpha", Range(0,1)) = 1
        [ToggleUI]_DecalHueShiftEnabled1 ("Hue Shift Enabled", Float) = 0
        _DecalHueShiftSpeed1 ("Shift Speed", Float) = 0
        _DecalHueShift1 ("Hue Shift", Range(0,1)) = 0
        [HideInInspector] m_start_Decal1AudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal1ScaleBand ("Scale Band", Int) = 0
        _AudioLinkDecal1Scale("Scale Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal1RotationBand ("Rotation Band", Int) = 0
        [Vector2]_AudioLinkDecal1Rotation("Rotation Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal1AlphaBand ("Alpha Band", Int) = 0
        [Vector2]_AudioLinkDecal1Alpha("Alpha Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal1EmissionBand ("Emission Band", Int) = 0
        [Vector2]_AudioLinkDecal1Emission("Emission Mod", Vector) = (0,0,0,0)
        [HideInInspector] m_end_Decal1AudioLink ("Audio Link", Float) = 0
        [HideInInspector] m_end_Decal1 ("Decal 0", Float) = 0
        [HideInInspector] m_start_Decal2 ("Decal 2--{reference_property:_DecalEnabled2}", Float) = 0
        [HideInInspector][ThryToggle(GEOM_TYPE_FROND)]_DecalEnabled2 ("Enable", Float) = 0
        _DecalColor2 ("Color", Color) = (1, 1, 1, 1)
        _DecalEmissionStrength2 ("Emission Strength", Range(0, 20)) = 0
        _DecalTexture2 ("Decal--{reference_properties:[_DecalTexture2Pan, _DecalTexture2UV]}", 2D) = "white" { }
        [HideInInspector][Vector2]_DecalTexture2Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DecalTexture2UV ("UV", Int) = 0
        [ToggleUI]_DecalTiled2 ("Tiled?", Float) = 0
        _Decal2Depth ("Depth", Float) = 0
        [Vector2]_DecalScale2 ("Scale", Vector) = (1, 1, 0, 0)
        [Vector2]_DecalPosition2 ("Position", Vector) = (.5, .5, 0, 0)
        _DecalRotation2 ("Rotation", Range(0, 360)) = 0
        _DecalRotationSpeed2 ("Rotation Speed", Float) = 0
         [ThryWideEnum(Replace, 0, Darken, 1, Multiply, 2, Color Burn, 3, Linear Burn, 4, Lighten, 5, Screen, 6, Color Dodge, 7, Linear Dodge (Add), 8, Overlay, 9, Soft Lighten, 10, Hard Light, 11, Vivid Light, 12, Linear Light, 13, Pin Light, 14, Hard Mix, 15, Difference, 16, Exclusion, 17, Subtract, 18, Divide, 19)]_DecalBlendType2 ("Blending", Range(0, 1)) = 0
        _DecalBlendAlpha2("Alpha", Range(0,1)) = 1
        [ToggleUI]_DecalHueShiftEnabled2 ("Hue Shift Enabled", Float) = 0
        _DecalHueShiftSpeed2 ("Shift Speed", Float) = 0
        _DecalHueShift2 ("Hue Shift", Range(0,1)) = 0
        [HideInInspector] m_start_Decal2AudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal2ScaleBand ("Scale Band", Int) = 0
        _AudioLinkDecal2Scale("Scale Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal2RotationBand ("Rotation Band", Int) = 0
        [Vector2]_AudioLinkDecal2Rotation("Rotation Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal2AlphaBand ("Alpha Band", Int) = 0
        [Vector2]_AudioLinkDecal2Alpha("Alpha Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal2EmissionBand ("Emission Band", Int) = 0
        [Vector2]_AudioLinkDecal2Emission("Emission Mod", Vector) = (0,0,0,0)
        [HideInInspector] m_end_Decal2AudioLink ("Audio Link", Float) = 0
        [HideInInspector] m_end_Decal2 ("Decal 0", Float) = 0
        [HideInInspector] m_start_Decal3 ("Decal 3--{reference_property:_DecalEnabled3}", Float) = 0
        [HideInInspector][ThryToggle(DEPTH_OF_FIELD_COC_VIEW)]_DecalEnabled3 ("Enable", Float) = 0
        _DecalColor3 ("Color", Color) = (1, 1, 1, 1)
        _DecalEmissionStrength3 ("Emission Strength", Range(0, 20)) = 0
        _DecalTexture3 ("Decal--{reference_properties:[_DecalTexture3Pan, _DecalTexture3UV]}", 2D) = "white" { }
        [HideInInspector][Vector2]_DecalTexture3Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DecalTexture3UV ("UV", Int) = 0
        [ToggleUI]_DecalTiled3 ("Tiled?", Float) = 0
        _Decal3Depth ("Depth", Float) = 0
        [Vector2]_DecalScale3 ("Scale", Vector) = (1, 1, 0, 0)
        [Vector2]_DecalPosition3 ("Position", Vector) = (.5, .5, 0, 0)
        _DecalRotation3 ("Rotation", Range(0, 360)) = 0
        _DecalRotationSpeed3 ("Rotation Speed", Float) = 0
         [ThryWideEnum(Replace, 0, Darken, 1, Multiply, 2, Color Burn, 3, Linear Burn, 4, Lighten, 5, Screen, 6, Color Dodge, 7, Linear Dodge (Add), 8, Overlay, 9, Soft Lighten, 10, Hard Light, 11, Vivid Light, 12, Linear Light, 13, Pin Light, 14, Hard Mix, 15, Difference, 16, Exclusion, 17, Subtract, 18, Divide, 19)]_DecalBlendType3 ("Blending", Range(0, 1)) = 0
        _DecalBlendAlpha3("Alpha", Range(0,1)) = 1
        [ToggleUI]_DecalHueShiftEnabled3 ("Hue Shift Enabled", Float) = 0
        _DecalHueShiftSpeed3 ("Shift Speed", Float) = 0
        _DecalHueShift3 ("Hue Shift", Range(0,1)) = 0
        [HideInInspector] m_start_Decal3AudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal3ScaleBand ("Scale Band", Int) = 0
        _AudioLinkDecal3Scale("Scale Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal3RotationBand ("Rotation Band", Int) = 0
        [Vector2]_AudioLinkDecal3Rotation("Rotation Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal3AlphaBand ("Alpha Band", Int) = 0
        [Vector2]_AudioLinkDecal3Alpha("Alpha Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDecal3EmissionBand ("Emission Band", Int) = 0
        [Vector2]_AudioLinkDecal3Emission("Emission Mod", Vector) = (0,0,0,0)
        [HideInInspector] m_end_Decal3AudioLink ("Audio Link", Float) = 0
        [HideInInspector] m_end_Decal3 ("Decal 0", Float) = 0
        [HideInInspector] m_end_DecalSection ("Decal", Float) = 0
        [HideInInspector] m_start_backFace ("Back Face", Float) = 0
        [ToggleUI]_BackFaceEnabled ("Enable Back Face Options", Float) = 0
        _BackFaceColor ("Color", Color) = (1, 1, 1, 1)
        _BackFaceTexture ("Texture", 2D) = "white" { }
        [ToggleUI]_BackFaceReplaceAlpha ("Replace Alpha", Float) = 0
        [HideInInspector][Vector2]_BackFacePanning ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)]_BackFaceTextureUV ("UV#", Int) = 0
        _BackFaceDetailIntensity ("Detail Intensity", Range(0, 5)) = 1
        _BackFaceHueShift ("Hue Shift", Range(0, 1)) = 0
        _BackFaceEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        [HideInInspector] m_end_backFace ("Back Face", Float) = 0
        [HideInInspector] m_lightingOptions ("Lighting", Float) = 0
        [HideInInspector] m_start_Lighting ("Light and Shadow", Float) = 0
        [Toggle(VIGNETTE_MASKED)]_EnableLighting ("Enable Lighting", Float) = 1
        [Enum(Toon, 0, Realistic, 1, Wrapped (Beta), 2, Skin (Beta), 3, Flat, 4)] _LightingMode ("Lighting Type", Int) = 4
        _LightingStandardSmoothness ("Smoothness--{condition_show:{type:PROPERTY_BOOL,data:_LightingMode==1}}", Range(0, 1)) = 0
        _LightingWrappedWrap ("Wrap--{condition_show:{type:PROPERTY_BOOL,data:_LightingMode==2}}", Range(0, 2)) = 0
        _LightingWrappedNormalization ("Normalization--{condition_show:{type:PROPERTY_BOOL,data:_LightingMode==2}}", Range(0, 1)) = 0
        [Enum(Ramp Texture, 0, Math Gradient, 1, Shade Mapping, 2)] _LightingRampType ("Ramp Type--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingMode==2}}}}", Int) = 0
        _1st_ShadeColor ("1st ShadeColor--{condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==2}}}", Color) = (1,1,1,1)
        _1st_ShadeMap ("1st ShadeMap--{reference_properties:[_1st_ShadeMapPan, _1st_ShadeMapUV, _Use_1stShadeMapAlpha_As_ShadowMask, _1stShadeMapMask_Inverse],condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==2}}}", 2D) = "white" {}
        [HideInInspector][Vector2]_1st_ShadeMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _1st_ShadeMapUV ("UV", Int) = 0
        [HideInInspector][ToggleUI]_Use_1stShadeMapAlpha_As_ShadowMask("1st ShadeMap.a As ShadowMask", Float ) = 0
        [HideInInspector][ToggleUI]_1stShadeMapMask_Inverse("1st ShadeMapMask Inverse", Float ) = 0
        [ToggleUI] _Use_BaseAs1st ("Use BaseMap as 1st ShadeMap--{condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==2}}}}", Float ) = 0
        _2nd_ShadeColor ("2nd ShadeColor--{condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==2}}}", Color) = (1,1,1,1)
        _2nd_ShadeMap ("2nd ShadeMap--{reference_properties:[_2nd_ShadeMapPan, _2nd_ShadeMapUV, _Use_2ndShadeMapAlpha_As_ShadowMask, _2ndShadeMapMask_Inverse],condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==2}}}", 2D) = "white" {}
        [HideInInspector][Vector2]_2nd_ShadeMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _2nd_ShadeMapUV ("UV", Int) = 0
        [HideInInspector][ToggleUI]_Use_2ndShadeMapAlpha_As_ShadowMask("2nd ShadeMap.a As ShadowMask", Float ) = 0
        [HideInInspector][ToggleUI]_2ndShadeMapMask_Inverse("2nd ShadeMapMask Inverse", Float ) = 0
        [ToggleUI] _Use_1stAs2nd ("Use 1st ShadeMap as 2nd_ShadeMap--{condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==2}}}", Float ) = 0
        _BaseColor_Step ("BaseColor_Step--{condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==2}}}", Range(0.01, 1)) = 0.5
        _BaseShade_Feather ("Base/Shade_Feather--{condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==2}}}", Range(0.0001, 1)) = 0.0001
        _ShadeColor_Step ("ShadeColor_Step--{condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==2}}}", Range(0.01, 1)) = 0
        _1st2nd_Shades_Feather ("1st/2nd_Shades_Feather--{condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==2}}}", Range(0.0001, 1)) = 0.0001
        [Gradient]_ToonRamp ("Lighting Ramp--{texture:{width:512,height:4,filterMode:Bilinear,wrapMode:Clamp},force_texture_options:true,condition_show:{type:AND,condition1:{type:OR,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingMode==2}},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==0}}}", 2D) = "white" { }
        _LightingShadowMask ("Ramp Mask--{reference_properties:[_LightingShadowMaskPan, _LightingShadowMaskUV],condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingMode==2}}}", 2D) = "white" { }
        [HideInInspector][Vector2]_LightingShadowMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _LightingShadowMaskUV ("UV", Int) = 0
        _ShadowOffset ("Ramp Offset--{condition_show:{type:AND,condition1:{type:OR,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingMode==2}},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==0}}}}", Range(-1, 1)) = 0
        _LightingGradientStart ("Gradient Start--{condition_show:{type:AND,condition1:{type:OR,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingMode==2}},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==1}}}", Range(0, 1)) = 0
        _LightingGradientEnd ("Gradient End--{condition_show:{type:AND,condition1:{type:OR,condition1:{type:PROPERTY_BOOL,data:_LightingMode==0},condition2:{type:PROPERTY_BOOL,data:_LightingMode==2}},condition2:{type:PROPERTY_BOOL,data:_LightingRampType==1}}}", Range(0, 1)) = .5
        _SkinLUT ("LUT--{condition_show:{type:PROPERTY_BOOL,data:_LightingMode==3}}", 2D) = "white" {}
        _SssScale ("Scale--{condition_show:{type:PROPERTY_BOOL,data:_LightingMode==3}}", Range(0,1)) = 1
        [HideInInspector]_SssBumpBlur ("Bump Blur--{condition_show:{type:PROPERTY_BOOL,data:_LightingMode==3}}", Range(0,1)) = 0.7
        [HideInInspector][Vector3]_SssTransmissionAbsorption ("Absorption--{condition_show:{type:PROPERTY_BOOL,data:_LightingMode==3}}", Vector) = (-8,-40,-64,0)
        [HideInInspector][Vector3]_SssColorBleedAoWeights ("AO Color Bleed--{condition_show:{type:PROPERTY_BOOL,data:_LightingMode==3}}", Vector) = (0.4,0.15,0.13,0)
        _LightingShadowColor ("Shadow Tint--{reference_property:_LightingDetailShadowsEnabled, condition_showS:(_LightingMode==0&&_LightingRampType!=2)||_LightingMode==2||_LightingMode==3}", Color) = (1, 1, 1, 1)
        _ShadowStrength ("Shadow Strength--{condition_showS:(_LightingMode==0&&_LightingRampType!=2)||_LightingMode==2}", Range(0, 1)) = 1 
        _AttenuationMultiplier ("Receive Casted Shadows--{condition_show:{type:PROPERTY_BOOL,data:_LightingMode!=4}}", Range(0, 1)) = 0
        [ToggleUI]_LightingIgnoreAmbientColor ("Ignore Ambient Color--{condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_LightingMode!=4},condition2:{type:PROPERTY_BOOL,data:_LightingMode!=1}}}", Float) = 0
        [HideInInspector] m_start_lightingModifiers ("Lighting Modifiers", Float) = 0
        [Enum(Poi Custom, 0, Correct, 1)] _LightingDirectColorMode ("Direct Light Color", Int) = 0
        [ToggleUI]_LightingIndirectColorMode ("Indirect Uses Normals", Float) = 0
        [ToggleUI]_LightingUncapped ("Uncapped Lighting", Float) = 0
        [ToggleUI]_LightingOnlyUnityShadows ("Only Unity Shadows", Float) = 0
        _LightingMonochromatic ("Monochromatic Lighting?", Range(0,1)) = 0
        _LightingMinLightBrightness ("Min Brightness", Range(0, 1)) = 0
        _LightingMinShadowBrightnessRatio ("Shadow:Light min Ratio", Range(0, 1)) = 0
        [HideInInspector] m_end_lightingModifiers ("Lighting Modifiers", Float) = 0
        [HideInInspector] m_start_detailShadows ("Detail Shadows--{reference_property:_LightingDetailShadowsEnabled, condition_show:{type:PROPERTY_BOOL,data:_LightingMode!=4}}", Float) = 0
        [HideInInspector][ToggleUI]_LightingDetailShadowsEnabled ("Enabled Detail Shadows?", Float) = 0
        _LightingDetailShadows ("Detail Shadows--{reference_properties:[_LightingDetailShadowsPan, _LightingDetailShadowsUV]}", 2D) = "white" { }
        [HideInInspector][Vector2]_LightingDetailShadowsPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _LightingDetailShadowsUV ("UV", Int) = 0
        _LightingDetailStrength ("Detail Strength", Range(0, 1)) = 1
        [HideInInspector] m_end_detailShadows ("Detail Shadows", Float) = 0
        [HideInInspector] m_start_ambientOcclusion ("Ambient Occlusion--{reference_property:_LightingEnableAO}", Float) = 0
        [HideInInspector][ToggleUI]_LightingEnableAO ("Enable AO", Float) = 0
        _LightingAOTex ("AO Map", 2D) = "white" { }
        [HideInInspector][Vector2]_LightingAOTexPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _LightingAOTexUV ("UV", Int) = 0
        _AOStrength ("AO Strength", Range(0, 1)) = 1
        [HideInInspector] m_end_ambientOcclusion ("Ambient Occlusion", Float) = 0
        [HideInInspector] m_start_lightingHSL ("HSL Lighting--{reference_property:_LightingEnableHSL, condition_show:{type:PROPERTY_BOOL,data:_LightingMode==0}}", Float) = 0
        [HideInInspector][ToggleUI]_LightingEnableHSL ("Enabled HSL Lighting", Float) = 0
        _LightingHSLIntensity ("Shadow HSL Intensity", Range(0, 1)) = 1
        _LightingShadowHue ("Shadow Hue Change", Range(0, 1)) = 0.5
        _LightingShadowSaturation ("Shadow Saturation Change", Range(0, 1)) = 0.5
        _LightingShadowLightness ("Shadow Lightness Change", Range(0, 1)) = 0.5
        [HideInInspector] m_end_lightingHSL ("HSL Lighting", Float) = 0
        [HideInInspector] m_start_lightingAdvanced ("Additive Lighting (Point/Spot)--{reference_property:_LightingAdditiveEnable,button_help:{text:Tutorial,action:{type:URL,data:https://www.youtube.com/watch?v=at3p5yRRVU0&list=PL4_Gy3VRJSmbXfQSldzUiChgABQsoBlLw&index=12},hover:YouTube}}", Float) = 0
        [HideInInspector][ToggleUI]_LightingAdditiveEnable ("Enable Additive", Float) = 1
        [Enum(Realistic, 0, Toon, 1, Wrapped, 2)] _LightingAdditiveType ("Lighting Type", Int) = 1
        _LightingAdditiveGradientStart ("Gradient Start", Range(0, 1)) = 0
        _LightingAdditiveGradientEnd ("Gradient End", Range(0, 1)) = .5
        _LightingAdditivePassthrough ("Point Light Passthrough", Range(0, 1)) = .5
        _LightingAdditiveDetailStrength ("Detail Shadow Strength", Range(0, 1)) = 1
        [ToggleUI]_LightingAdditiveLimitIntensity ("Limit Intensity", Float) = 0
        _LightingAdditiveMaxIntensity ("Max Intensity--{condition_show:{type:PROPERTY_BOOL,data:_LightingAdditiveLimitIntensity==1}}", Range(0, 3)) = 1
        [ThryToggle(_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A)]_DisableDirectionalInAdd ("No Directional", Float) = 1
        [HideInInspector] m_end_lightingAdvanced ("Additive Lighting", Float) = 0
        [HideInInspector] m_end_Lighting ("Light and Shadow", Float) = 0
        [HideInInspector] m_start_subsurface ("Subsurface Scattering", Float) = 0
        [ThryToggle(_TERRAIN_NORMAL_MAP)]_EnableSSS ("Enable Subsurface Scattering", Float) = 0
        _SSSColor ("Subsurface Color", Color) = (1, 0, 0, 1)
        _SSSThicknessMap ("Thickness Map--{reference_properties:[_SSSThicknessMapPan, _SSSThicknessMapUV]}", 2D) = "black" { }
        [HideInInspector][Vector2]_SSSThicknessMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _SSSThicknessMapUV ("UV", Int) = 0
        _SSSThicknessMod ("Thickness mod", Range(-1, 1)) = 0
        _SSSSCale ("Light Strength", Range(0, 1)) = 0.25
        _SSSPower ("Light Spread", Range(1, 100)) = 5
        _SSSDistortion ("Light Distortion", Range(0, 1)) = 1
        [HideInInspector] m_end_subsurface ("Subsurface Scattering", Float) = 0
        [HideInInspector] m_start_rimLightOptions ("Rim Lighting", Float) = 0
        [ThryToggle(_GLOSSYREFLECTIONS_OFF)]_EnableRimLighting ("Enable Rim Lighting", Float) = 0
        [Enum(vertex, 0, pixel, 1)] _RimLightNormal ("Normal Select", Int) = 1
        [ToggleUI]_RimLightingInvert ("Invert Rim Lighting", Float) = 0
        _RimLightColor ("Rim Color", Color) = (1, 1, 1, 1)
        _RimWidth ("Rim Width", Range(0, 1)) = 0.8
        _RimSharpness ("Rim Sharpness", Range(0, 1)) = .25
        _RimStrength ("Rim Emission", Range(0, 20)) = 0
        _RimBrighten ("Rim Color Brighten", Range(0, 3)) = 0
        _RimLightColorBias ("Rim Color Bias", Range(0, 1)) = 1
        _RimTex ("Rim Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_RimTexPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _RimTexUV ("UV", Int) = 0
        _RimMask ("Rim Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_RimMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _RimMaskUV ("UV", Int) = 0
        [HideInInspector] m_start_rimHueShift ("Hue Shift", Float) = 0
        [ToggleUI]_RimHueShiftEnabled ("Enabled", Float) = 0
        _RimHueShiftSpeed ("Shift Speed", Float) = 0
        _RimHueShift ("Hue Shift", Range(0,1)) = 0
        [HideInInspector] m_end_rimHueShift ("Hue Shift", Float) = 0
        [HideInInspector] m_start_rimWidthNoise ("Width Noise", Float) = 0
        _RimWidthNoiseTexture ("Rim Width Noise", 2D) = "black" { }
        [HideInInspector][Vector2]_RimWidthNoiseTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _RimWidthNoiseTextureUV ("UV", Int) = 0
        _RimWidthNoiseStrength ("Intensity", Range(0, 1)) = 0.1
        [HideInInspector] m_end_rimWidthNoise ("Width Noise", Float) = 0
        [HideInInspector] m_start_ShadowMix ("Shadow Mix", Float) = 0
        _ShadowMix ("Shadow Mix In", Range(0, 1)) = 0
        _ShadowMixThreshold ("Shadow Mix Threshold", Range(0, 1)) = .5
        _ShadowMixWidthMod ("Shadow Mix Width Mod", Range(0, 10)) = .5
        [HideInInspector] m_end_ShadowMix ("Shadow Mix", Float) = 0
        [HideInInspector] m_start_RimAudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkRimWidthBand ("Width Add Band", Int) = 0
        [Vector2] _AudioLinkRimWidthAdd ("Width Add (XMin, YMax)", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkRimEmissionBand ("Emission Add Band", Int) = 0
        [Vector2] _AudioLinkRimEmissionAdd ("Emission Add (XMin, YMax)", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkRimBrightnessBand ("Brightness Band", Int) = 0
        [Vector2] _AudioLinkRimBrightnessAdd ("Brightness Add (XMin, YMax)", Vector) = (0,0,0,0)
        [HideInInspector] m_end_RimAudioLink ("Audio Link", Float) = 0
        [HideInInspector] m_end_rimLightOptions ("Rim Lighting", Float) = 0
        [HideInInspector] m_start_reflectionRim ("Environmental Rim", Float) = 0
        [ThryToggle(_MAPPING_6_FRAMES_LAYOUT)]_EnableEnvironmentalRim ("Enable Environmental Rim", Float) = 0
        _RimEnviroMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_RimEnviroMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _RimEnviroMaskUV ("UV", Int) = 0
        _RimEnviroBlur ("Blur", Range(0, 1)) = 0.7
        _RimEnviroWidth ("Rim Width", Range(0, 1)) = 0.45
        _RimEnviroSharpness ("Rim Sharpness", Range(0, 1)) = 0
        _RimEnviroMinBrightness ("Min Brightness Threshold", Range(0, 2)) = 0
        _RimEnviroIntensity ("Intensity", Range(0, 1)) = 1
        [HideInInspector] m_end_reflectionRim ("Environmental Rim", Float) = 0
        [HideInInspector] m_start_bakedLighting ("Baked Lighting", Float) = 0
        _SpecularLMOcclusion("Specular Occlusion", Range(0,1)) = 0
        _SpecLMOcclusionAdjust("Spec Occlusion Sensitiviy", Range(0,1)) = 0.2
        _GIEmissionMultiplier ("GI Emission Multiplier", Float) = 1
        [HideInInspector] DSGI ("DSGI", Float) = 0 //add this property for double sided illumination settings to be shown
        [HideInInspector] LightmapFlags ("Lightmap Flags", Float) = 0 //add this property for lightmap flags settings to be shown
        [HideInInspector] m_end_bakedLighting ("Baked Lighting", Float) = 0
        [Helpbox(3)] _LockTooltip ("ALWAYS LOCK IN BEFORE UPLOADING. || RIGHT CLICK A PROPERTY IF YOU WANT TO ANIMATE IT.", Int) = 0
        [HideInInspector] m_start_brdf ("Metallics & Specular--{reference_property:_EnableBRDF}", Float) = 0
        [HideInInspector][ThryToggle(VIGNETTE_CLASSIC)]_EnableBRDF ("Enable", Float) = 0
        _BRDFMetallicGlossMap ("Metallic Gloss Map--{reference_properties:[_BRDFMetallicGlossMapPan, _BRDFMetallicGlossMapUV, _BRDFInvertGlossiness, _BRDFMetallicGlossMapToolTip]}", 2D) = "white" { }
        [HideInInspector][Helpbox(1)] _BRDFMetallicGlossMapToolTip ("R = Metallic, G = Reflectance, A = Glossiness/Smoothness/Inverse Roughness", Int) = 0
        [HideInInspector][ToggleUI]_BRDFInvertGlossiness ("Invert Glossiness", Float) = 0
        [HideInInspector][Vector2]_BRDFMetallicGlossMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _BRDFMetallicGlossMapUV ("UV", Int) = 0
        _BRDFSpecularMap ("Specular Tint/Mask--{reference_properties:[_BRDFSpecularMapPan, _BRDFSpecularMapUV, _BRDFSpecularMapToolTip]}", 2D) = "white" { }
        [HideInInspector][Helpbox(1)] _BRDFSpecularMapToolTip ("RGB = Color, A = Mask", Int) = 0
        [HideInInspector][Vector2]_BRDFSpecularMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _BRDFSpecularMapUV ("UV", Int) = 0
        _BRDFMetallicMap ("Metallic Tint/Mask--{reference_properties:[_BRDFMetallicMapPan, _BRDFMetallicMapUV, _BRDFMetallicMapToolTip]}", 2D) = "white" { }
        [HideInInspector][Helpbox(1)] _BRDFMetallicMapToolTip ("RGB = Color, A = Mask", Int) = 0
        [HideInInspector][Vector2]_BRDFMetallicMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _BRDFMetallicMapUV ("UV", Int) = 0
        _BRDFMetallic ("Metallic", Range(0,1)) = 0
        _BRDFGlossiness ("Glossiness", Range(0,1)) = 0
        _BRDFReflectance ("Reflectance", Range(0,1)) = .5
        _BRDFAnisotropy ("Anisotropy", Range(-1,1)) = 0
        _BRDFMetallicSpecIgnoresBaseColor("Spec Ignores Base Color", Range(0,1)) = 0
        [ToggleUI]_BRDFReflectionsEnabled ("Enable Reflections", Float) = 1
        [ToggleUI]_BRDFSpecularEnabled ("Enable Specular", Float) = 1
        _BRDFFallback ("Fallback Reflection", Cube) = "" { }
        [ToggleUI]_BRDFForceFallback ("Force Fallback Reflection", Range(0, 1)) = 0
        [HideInInspector] m_end_brdf ("Baked Lighting", Float) = 0
        [HideInInspector] m_start_Metallic ("Metallicsa", Float) = 0
        [ThryToggle(_METALLICGLOSSMAP)]_EnableMetallic ("Enable Metallics", Float) = 0
        _CubeMap ("Baked CubeMap", Cube) = "" { }
        [ToggleUI]_SampleWorld ("Force Baked Cubemap", Range(0, 1)) = 0
        _MetalReflectionTint ("Reflection Tint", Color) = (1, 1, 1)
        _MetallicTintMap ("Tint Map", 2D) = "white" { }
        [HideInInspector][Vector2]_MetallicTintMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _MetallicTintMapUV ("UV", Int) = 0
        _MetallicMask ("Metallic Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_MetallicMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _MetallicMaskUV ("UV", Int) = 0
        _Metallic ("Metallic", Range(0, 1)) = 0
        _SmoothnessMask ("Smoothness Map", 2D) = "white" { }
        [HideInInspector][Vector2]_SmoothnessMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _SmoothnessMaskUV ("UV", Int) = 0
        [ToggleUI]_InvertSmoothness ("Invert Smoothness Map", Range(0, 1)) = 0
        _Smoothness ("Smoothness", Range(0, 1)) = 0
        [HideInInspector] m_end_Metallic ("Metallics", Float) = 0
        [HideInInspector] m_start_clearCoat ("Clear Coat", Float) = 0
        [ThryToggle(_COLORCOLOR_ON)]_EnableClearCoat ("Enable Clear Coat", Float) = 0
        _ClearcoatMap ("Clear Coat Map--{reference_properties:[_ClearcoatMapPan, _ClearcoatMapUV, _ClearcoatInvertSmoothness, _ClearcoatHelpBox]}", 2D) = "white" { }
        [HideInInspector][Helpbox(1)] _ClearcoatHelpBox ("R = Clear Coat Map, G = Specular Mask, B = Reflection Mask, A = Glossiness/Smoothness/Inverse Roughness", Int) = 0
        [HideInInspector][Vector2]_ClearcoatMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _ClearcoatMapUV ("UV", Int) = 0
        [HideInInspector][ToggleUI]_ClearcoatInvertSmoothness ("Invert Smoothness", Range(0, 1)) = 0
        _Clearcoat ("Clear Coat", Range(0, 1)) = 1
        _ClearcoatGlossiness ("Smoothness", Range(0, 1)) = 0
        _ClearcoatAnisotropy ("Anisotropy", Range(-1, 1)) = 0
        [ToggleUI]_ClearcoatEnableReflections ("Enable Reflections", Range(0, 1)) = 1
        [ToggleUI]_ClearcoatEnableSpecular ("Enable Specular", Range(0, 1)) = 1
        _ClearcoatFallback ("Fallback CubeMap", Cube) = "" { }
        [ToggleUI]_ClearcoatForceFallback ("Force Fallback Cubemap", Range(0, 1)) = 0
        [HideInInspector] m_end_clearCoat ("Clear Coat", Float) = 0
        [HideInInspector] m_start_matcap ("Matcap / Sphere Textures", Float) = 0
        [ThryToggle(_COLORADDSUBDIFF_ON)]_MatcapEnable ("Enable Matcap", Float) = 0
        _MatcapColor ("Color", Color) = (1, 1, 1, 1)
        [TextureNoSO]_Matcap ("Matcap", 2D) = "white" { }
        _MatcapBorder ("Border", Range(0, .5)) = 0.43
        _MatcapMask ("Mask--{reference_properties:[_MatcapMaskPan, _MatcapMaskUV, _MatcapMaskInvert]}", 2D) = "white" { }
        [HideInInspector][Vector2]_MatcapMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _MatcapMaskUV ("UV", Int) = 0
        [HideInInspector][ToggleUI]_MatcapMaskInvert("Invert", Float) = 0 
        _MatcapEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        _MatcapIntensity ("Intensity", Range(0, 5)) = 1
        _MatcapLightMask ("Hide in Shadow", Range(0, 1)) = 0
        _MatcapReplace ("Replace With Matcap", Range(0, 1)) = 1
        _MatcapMultiply ("Multiply Matcap", Range(0, 1)) = 0
        _MatcapAdd ("Add Matcap", Range(0, 1)) = 0
        [Enum(Vertex, 0, Pixel, 1)] _MatcapNormal ("Normal to use", Int) = 1
        [HideInInspector] m_start_matcapHueShift ("Hue Shift", Float) = 0
        [ToggleUI]_MatcapHueShiftEnabled ("Enabled", Float) = 0
        _MatcapHueShiftSpeed ("Shift Speed", Float) = 0
        _MatcapHueShift ("Hue Shift", Range(0,1)) = 0
        [HideInInspector] m_end_matcapHueShift ("Hue Shift", Float) = 0
        [HideInInspector] m_end_matcap ("Matcap", Float) = 0
        [HideInInspector] m_start_Matcap2 ("Matcap 2", Float) = 0
        [ThryToggle(COLOR_GRADING_HDR_3D)]_Matcap2Enable ("Enable Matcap 2", Float) = 0
        _Matcap2Color ("Color", Color) = (1, 1, 1, 1)
        [TextureNoSO]_Matcap2 ("Matcap", 2D) = "white" { }
        _Matcap2Border ("Border", Range(0, .5)) = 0.43
        _Matcap2Mask ("Mask--{reference_properties:[_Matcap2MaskPan, _Matcap2MaskUV, _Matcap2MaskInvert]}", 2D) = "white" { }
        [HideInInspector][Vector2]_Matcap2MaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _Matcap2MaskUV ("UV", Int) = 0
        [HideInInspector][ToggleUI]_Matcap2MaskInvert("Invert", Float) = 0 
        _Matcap2EmissionStrength ("Emission Strength", Range(0, 20)) = 0
        _Matcap2Intensity ("Intensity", Range(0, 5)) = 1
        _Matcap2LightMask ("Hide in Shadow", Range(0, 1)) = 0
        _Matcap2Replace ("Replace With Matcap", Range(0, 1)) = 0
        _Matcap2Multiply ("Multiply Matcap", Range(0, 1)) = 0
        _Matcap2Add ("Add Matcap", Range(0, 1)) = 0
        [Enum(Vertex, 0, Pixel, 1)] _Matcap2Normal ("Normal to use", Int) = 1
        [HideInInspector] m_start_matcap2HueShift ("Hue Shift", Float) = 0
        [ToggleUI]_Matcap2HueShiftEnabled ("Enabled", Float) = 0
        _Matcap2HueShiftSpeed ("Shift Speed", Float) = 0
        _Matcap2HueShift ("Hue Shift", Range(0,1)) = 0
        [HideInInspector] m_end_matcap2HueShift ("Hue Shift", Float) = 0
        [HideInInspector] m_end_Matcap2 ("Matcap 2", Float) = 0
        [HideInInspector] m_start_specular ("Specular Reflections", Float) = 0
        [ThryToggle(_SPECGLOSSMAP)]_EnableSpecular ("Enable Specular", Float) = 0
        [Enum(Realistic, 1, Toon, 2, Anisotropic, 3, Toon Aniso, 4)] _SpecularType ("Specular Type", Int) = 1
        [Enum(vertex, 0, pixel, 1)] _SpecularNormal ("Normal Select", Int) = 1
        _SpecularTint ("Specular Tint", Color) = (1, 1, 1, 1)
        _SpecularMetallic ("Metallic", Range(0, 1)) = 0
        _SpecularMaxBrightness("Max Light Brightness", Float) = 0
        [Gradient]_SpecularMetallicMap ("Metallic Map--{reference_properties:[_SpecularMetallicMapPan, _SpecularMetallicMapUV]}", 2D) = "white" { }
        [HideInInspector][Vector2]_SpecularMetallicMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _SpecularMetallicMapUV ("UV", Int) = 0
        _SpecularSmoothness ("Smoothness--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==1},condition2:{type:PROPERTY_BOOL,data:_SpecularType==3}}}", Range(0, 1)) = 1
        [Gradient]_SpecularMap ("Specular Map", 2D) = "white" { }
        [HideInInspector][Vector2]_SpecularMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _SpecularMapUV ("UV", Int) = 0
        [ToggleUI]_SpecularInvertSmoothness ("Invert Smoothness", Float) = 0
        _SpecularMask ("Specular Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_SpecularMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _SpecularMaskUV ("UV", Int) = 0
        [Enum(Alpha, 0, Grayscale, 1)] _SmoothnessFrom ("Smoothness From", Int) = 1
        [Enum(Tangent, 0, binormal, 1)] _SpecWhatTangent ("(Bi)Tangent?--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", Int) = 0
        _AnisoSpec1Alpha ("Spec1 Alpha--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==3}}", Range(0, 1)) = 1
        _AnisoSpec2Alpha ("Spec2 Alpha--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==3}}", Range(0, 1)) = 1
        _Spec1Offset ("Spec1 Offset--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==3}}", Range(-1, 1)) = 0
        _Spec2Smoothness ("Spec2 Smoothness--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==3}}", Range(0, 1)) = 0
        [ToggleUI]_AnisoUseTangentMap ("Use Directional Map?--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", Float) = 0
        _AnisoTangentMap ("Anisotropic Directional Map--{reference_properties:[_AnisoTangentMapPan, _AnisoTangentMapUV], condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", 2D) = "bump" { }
        [HideInInspector][Vector2]_AnisoTangentMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _AnisoTangentMapUV ("UV", Int) = 0
        _SpecularToonStart ("Spec Toon Start--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==4}}", Range(0, 1)) = .95
        _SpecularToonEnd ("Spec Toon End--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==4}}", Range(0, 2)) = 1
        [ToggleUI]_SpecularAnisoJitterMirrored ("Mirrored?--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==4}}", Float) = 0
        [Curve]_SpecularAnisoJitterMicro ("Micro Shift--{reference_properties:[_SpecularAnisoJitterMicroPan, _SpecularAnisoJitterMicroUV], condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", 2D) = "black" { }
        _SpecularAnisoJitterMicroMultiplier ("Micro Multiplier--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", Range(0, 10)) = 0
        [HideInInspector][Vector2]_SpecularAnisoJitterMicroPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _SpecularAnisoJitterMicroUV ("UV", Int) = 0
        [Curve]_SpecularAnisoJitterMacro ("Macro Shift--{reference_properties:[_SpecularAnisoJitterMacroPan, _SpecularAnisoJitterMacroUV], condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", 2D) = "black" { }
        _SpecularAnisoJitterMacroMultiplier ("Macro Multiplier--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType==4}}}", Range(0, 10)) = 0
        [HideInInspector][Vector2]_SpecularAnisoJitterMacroPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _SpecularAnisoJitterMacroUV ("UV", Int) = 0
        [MultiSlider]_SpecularToonInnerOuter ("Inner/Outer Edge--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType==2}}", Vector) = (0.25, 0.3, 0, 1)
        [HideInInspector] m_end_specular ("Specular Reflections", Float) = 0
        [HideInInspector] m_start_specular1 ("Specular Reflections 2", Float) = 0
        [ThryToggle(DITHERING)]_EnableSpecular1 ("Enable Specular", Float) = 0
        [Enum(Realistic, 1, Toon, 2, Anisotropic, 3, Toon Aniso, 4)] _SpecularType1 ("Specular Type", Int) = 1
        [Enum(vertex, 0, pixel, 1)] _SpecularNormal1 ("Normal Select", Int) = 1
        _SpecularTint1 ("Specular Tint", Color) = (1, 1, 1, 1)
        _SpecularMetallic1 ("Metallic", Range(0, 1)) = 0
        _SpecularMaxBrightness1("Max Light Brightness", Float) = 0
        [Gradient]_SpecularMetallicMap1 ("Metallic Map--{reference_properties:[_SpecularMetallicMapPan, _SpecularMetallicMapUV]}", 2D) = "white" { }
        [HideInInspector][Vector2]_SpecularMetallicMap1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _SpecularMetallicMap1UV ("UV", Int) = 0
        _SpecularSmoothness1 ("Smoothness--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==1},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==3}}}", Range(-2, 1)) = .75
        _SpecularMap1 ("Specular Map", 2D) = "white" { }
        [HideInInspector][Vector2]_SpecularMap1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _SpecularMap1UV ("UV", Int) = 0
        [ToggleUI]_SpecularInvertSmoothness1 ("Invert Smoothness", Float) = 0
        _SpecularMask1 ("Specular Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_SpecularMask1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _SpecularMask1UV ("UV", Int) = 0
        [Enum(Alpha, 0, Grayscale, 1)] _SmoothnessFrom1 ("Smoothness From", Int) = 1
        [Enum(Tangent, 0, binormal, 1)] _SpecWhatTangent1 ("(Bi)Tangent?--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", Int) = 0
        _AnisoSpec1Alpha1 ("Spec1 Alpha--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==3}}", Range(0, 1)) = 1
        _AnisoSpec2Alpha1 ("Spec2 Alpha--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==3}}", Range(0, 1)) = 1
        _Spec1Offset1 ("Spec1 Offset--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==3}}", Range(-1, 1)) = 0
        _Spec2Smoothness1 ("Spec2 Smoothness--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==3}}", Range(0, 1)) = 0
        [ToggleUI]_AnisoUseTangentMap1 ("Use Directional Map?--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", Float) = 0
        _AnisoTangentMap1 ("Anisotropic Directional Map--{reference_properties:[_AnisoTangentMap1Pan, _AnisoTangentMap1UV], condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", 2D) = "bump" { }
        [HideInInspector][Vector2]_AnisoTangentMap1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _AnisoTangentMap1UV ("UV", Int) = 0
        _SpecularToonStart1 ("Spec Toon Start--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==4}}", Range(0, 1)) = .95
        _SpecularToonEnd1 ("Spec Toon End--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==4}}", Range(0, 2)) = 1
        [ToggleUI]_SpecularAnisoJitterMirrored1 ("Mirrored?--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==4}}", Float) = 0
        [Curve]_SpecularAnisoJitterMicro1 ("Micro Shift--{reference_properties:[_SpecularAnisoJitterMicro1Pan, _SpecularAnisoJitterMicro1UV], condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", 2D) = "black" { }
        _SpecularAnisoJitterMicroMultiplier1 ("Micro Multiplier--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", Range(0, 10)) = 0
        [HideInInspector][Vector2]_SpecularAnisoJitterMicro1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _SpecularAnisoJitterMicro1UV ("UV", Int) = 0
        [Curve]_SpecularAnisoJitterMacro1 ("Macro Shift--{reference_properties:[_SpecularAnisoJitterMacro1Pan, _SpecularAnisoJitterMacro1UV], condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", 2D) = "black" { }
        _SpecularAnisoJitterMacroMultiplier1 ("Macro Multiplier--{condition_show:{type:OR,condition1:{type:PROPERTY_BOOL,data:_SpecularType1==3},condition2:{type:PROPERTY_BOOL,data:_SpecularType1==4}}}", Range(0, 10)) = 0
        [HideInInspector][Vector2]_SpecularAnisoJitterMacro1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _SpecularAnisoJitterMacro1UV ("UV", Int) = 0
        [MultiSlider]_SpecularToonInnerOuter1 ("Inner/Outer Edge--{condition_show:{type:PROPERTY_BOOL,data:_SpecularType1==2}}", Vector) = (0.25, 0.3, 0, 1)
        [HideInInspector] m_end_specular1 ("Specular Reflections", Float) = 0
        [HideInInspector] m_Special_Effects ("Special Effects", Float) = 0
        [HideInInspector] m_start_emissionOptions ("Emission / Glow", Float) = 0
        [ThryToggle(_EMISSION)]_EnableEmission ("Enable Emission", Float) = 0
        [ToggleUI]_EmissionReplace ("Replace Base Color", Float) = 0
        [HDR]_EmissionColor ("Emission Color", Color) = (1, 1, 1, 1)
        [Gradient]_EmissionMap ("Emission Map", 2D) = "white" { }
        [ToggleUI]_EmissionBaseColorAsMap ("Base Color as Map?", Float) = 0
        [HideInInspector][Vector2]_EmissionMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _EmissionMapUV ("UV", Int) = 0
        _EmissionMask ("Emission Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_EmissionMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _EmissionMaskUV ("UV", Int) = 0
        _EmissionStrength ("Emission Strength", Range(0, 20)) = 0
        [ToggleUI]_EmissionHueShiftEnabled ("Enable Hue Shift", Float) = 0
        _EmissionHueShift ("Hue Shift", Range(0, 1)) = 0
        _EmissionHueShiftSpeed ("Hue Shift Speed", Float) = 0
        [HideInInspector] m_start_CenterOutEmission ("Center Out Emission", Float) = 0
        [HideInInspector][ToggleUI]_EmissionCenterOutEnabled ("Enable Center Out", Float) = 0
        _EmissionCenterOutSpeed ("Flow Speed", Float) = 5
        [HideInInspector] m_end_CenterOutEmission ("inward out emission", Float) = 0
        [HideInInspector] m_start_glowInDarkEmissionOptions ("Glow In The Dark Emission (Requires Lighting Enabled)", Float) = 0
        [HideInInspector][ToggleUI]_EnableGITDEmission ("Enable Glow In The Dark", Float) = 0
        [Enum(World, 0, Mesh, 1)] _GITDEWorldOrMesh ("Lighting Type", Int) = 0
        _GITDEMinEmissionMultiplier ("Min Emission Multiplier", Range(0, 1)) = 1
        _GITDEMaxEmissionMultiplier ("Max Emission Multiplier", Range(0, 1)) = 0
        _GITDEMinLight ("Min Lighting", Range(0, 1)) = 0
        _GITDEMaxLight ("Max Lighting", Range(0, 1)) = 1
        [HideInInspector] m_end_glowInDarkEmissionOptions ("Glow In The Dark Emission (Requires Lighting Enabled)", Float) = 0
        [HideInInspector] m_start_blinkingEmissionOptions ("Blinking Emission", Float) = 0
        [HideInInspector][ToggleUI]_EmissionBlinkingEnabled ("Enable Blinking", Float) = 0
        _EmissiveBlink_Min ("Emissive Blink Min", Float) = 0
        _EmissiveBlink_Max ("Emissive Blink Max", Float) = 1
        _EmissiveBlink_Velocity ("Emissive Blink Velocity", Float) = 4
        _EmissionBlinkingOffset ("Offset", Float) = 0
        [HideInInspector] m_end_blinkingEmissionOptions ("Blinking Emission", Float) = 0
        [HideInInspector] m_start_scrollingEmissionOptions ("Scrolling Emission", Float) = 0
        [HideInInspector][ToggleUI] _ScrollingEmission ("Enable Scrolling Emission", Float) = 0
        [ToggleUI]_EmissionScrollingUseCurve ("Use Curve", float) = 0
        [Curve]_EmissionScrollingCurve ("Curve", 2D) = "white" { }
        [ToggleUI]_EmissionScrollingVertexColor ("VColor as position", float) = 0
        _EmissiveScroll_Direction ("Direction", Vector) = (0, -10, 0, 0)
        _EmissiveScroll_Width ("Width", Float) = 10
        _EmissiveScroll_Velocity ("Velocity", Float) = 10
        _EmissiveScroll_Interval ("Interval", Float) = 20
        _EmissionScrollingOffset ("Offset", Float) = 0
        [HideInInspector] m_end_scrollingEmissionOptions ("Scrolling Emission", Float) = 0
        [HideInInspector] m_start_EmissionAudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
        [ToggleUI] _EnableEmissionStrengthAudioLink ("multiply Emission Strength", Float) = 0
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkEmissionStrengthBand ("Emission Strength Band", Int) = 0
        [ToggleUI] _EnableEmissionCenterOutAudioLink ("Center Out multipy", Float) = 0
        _EmissionCenterOutAudioLinkWidth("C Out Mul Duration", Range(0,1)) = 1
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkEmissionCenterOutBand ("Center Out M Band", Int) = 0
        [Vector2] _EmissionCenterOutAddAudioLink ("Center Out Add", Vector) = (0,0,0,0)
        _EmissionCenterOutAddAudioLinkwidth("C Out Add Duration", Range(0,1)) = 1
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkEmissionCenterOutAddBand ("Center Out A Band", Int) = 0
        [Vector2]_AudioLinkAddEmission ("Emission Strength Add", Vector) = (0, 0, 0, 0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkAddEmissionBand ("Emission Add Band", Int) = 0
        [HideInInspector] m_end_EmissionAudioLink ("Audio Link", Float) = 0
        [HideInInspector] m_end_emissionOptions ("Emission / Glow", Float) = 0
        [HideInInspector] m_start_emission1Options ("Emission / Glow 2 (Requires Emission 1 Enabled)", Float) = 0
        [ThryToggle(EFFECT_HUE_VARIATION)]_EnableEmission1 ("Enable Emission 2", Float) = 0
        [HDR]_EmissionColor1 ("Emission Color", Color) = (1, 1, 1, 1)
        [Gradient]_EmissionMap1 ("Emission Map", 2D) = "white" { }
        [ToggleUI]_EmissionBaseColorAsMap1 ("Base Color as Map?", Float) = 0
        [HideInInspector][Vector2]_EmissionMap1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _EmissionMap1UV ("UV", Int) = 0
        _EmissionMask1 ("Emission Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_EmissionMask1Pan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _EmissionMask1UV ("UV", Int) = 0
        _EmissionStrength1 ("Emission Strength", Range(0, 20)) = 0
        [ToggleUI]_EmissionHueShiftEnabled1 ("Enable Hue Shift", Float) = 0
        _EmissionHueShift1 ("Hue Shift", Range(0, 1)) = 0
        _EmissionHueShiftSpeed1 ("Hue Shift Speed", Float) = 0
        [HideInInspector] m_start_CenterOutEmission1 ("Center Out Emission", Float) = 0
        [HideInInspector][ToggleUI]_EmissionCenterOutEnabled1 ("Enable Center Out", Float) = 0
        _EmissionCenterOutSpeed1 ("Flow Speed", Float) = 5
        [HideInInspector] m_end_CenterOutEmission1 ("inward out emission", Float) = 0
        [HideInInspector] m_start_glowInDarkEmissionOptions1 ("Glow In The Dark Emission (Requires Lighting Enabled)", Float) = 0
        [HideInInspector][ToggleUI]_EnableGITDEmission1 ("Enable Glow In The Dark", Float) = 0
        [Enum(World, 0, Mesh, 1)] _GITDEWorldOrMesh1 ("Lighting Type", Int) = 0
        _GITDEMinEmissionMultiplier1 ("Min Emission Multiplier", Range(0, 1)) = 1
        _GITDEMaxEmissionMultiplier1 ("Max Emission Multiplier", Range(0, 1)) = 0
        _GITDEMinLight1 ("Min Lighting", Range(0, 1)) = 0
        _GITDEMaxLight1 ("Max Lighting", Range(0, 1)) = 1
        [HideInInspector] m_end_glowInDarkEmissionOptions1 ("Glow In The Dark Emission (Requires Lighting Enabled)", Float) = 0
        [HideInInspector] m_start_blinkingEmissionOptions1 ("Blinking Emission", Float) = 0
        [HideInInspector][ToggleUI]_EmissionBlinkingEnabled1 ("Enable Blinking", Float) = 0
        _EmissiveBlink_Min1 ("Emissive Blink Min", Float) = 0
        _EmissiveBlink_Max1 ("Emissive Blink Max", Float) = 1
        _EmissiveBlink_Velocity1 ("Emissive Blink Velocity", Float) = 4
        _EmissionBlinkingOffset1 ("Offset", Float) = 0
        [HideInInspector] m_end_blinkingEmissionOptions1 ("Blinking Emission", Float) = 0
        [HideInInspector] m_start_scrollingEmissionOptions1 ("Scrolling Emission", Float) = 0
        [HideInInspector][ToggleUI] _ScrollingEmission1 ("Enable Scrolling Emission", Float) = 0
        [ToggleUI]_EmissionScrollingUseCurve1 ("Use Curve", float) = 0
        [Curve]_EmissionScrollingCurve1 ("Curve", 2D) = "white" { }
        [ToggleUI]_EmissionScrollingVertexColor1 ("VColor as position", float) = 0
        _EmissiveScroll_Direction1 ("Direction", Vector) = (0, -10, 0, 0)
        _EmissiveScroll_Width1 ("Width", Float) = 10
        _EmissiveScroll_Velocity1 ("Velocity", Float) = 10
        _EmissiveScroll_Interval1 ("Interval", Float) = 20
        _EmissionScrollingOffset1 ("Offset", Float) = 0
        [HideInInspector] m_end_scrollingEmission1Options ("Scrolling Emission", Float) = 0
        [HideInInspector] m_start_Emission1AudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
        [ToggleUI] _EnableEmission1StrengthAudioLink ("Emission Strength", Float) = 0
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkEmission1StrengthBand ("Emission Strength Band", Int) = 0
        [ToggleUI] _EnableEmission1CenterOutAudioLink ("Center Out multipy", Float) = 0
        _Emission1CenterOutAudioLinkWidth("C Out Mul Duration", Range(0,1)) = 1
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkEmission1CenterOutBand ("Center Out Band", Int) = 0
        [Vector2] _EmissionCenterOutAddAudioLink1 ("Center Out Add", Vector) = (0,0,0,0)
        _Emission1CenterOutAddAudioLinkwidth("C Out Add Duration", Range(0,1)) = 1
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkEmission1CenterOutAddBand ("Center Out A Band", Int) = 0
        [Vector2]_AudioLinkAddEmission1 ("Emission Strength Add", Vector) = (0, 0, 0, 0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkAddEmission1Band ("Emission Add Band", Int) = 0
        [HideInInspector] m_end_Emission1AudioLink ("Audio Link", Float) = 0
        [HideInInspector] m_end_emission1Options ("Emission / Glow 2", Float) = 0
        [HideInInspector] m_start_pathing ("Pathing--{reference_property: _EnablePathing}", Float) = 0
        [HideInInspector][ThryToggle(TONEMAPPING_CUSTOM)] _EnablePathing ("Enable Pathing", Float) = 0
        _PathingMap ("RGB Path Map | A Mask--{reference_properties:[_PathingMapPan, _PathingMapUV]}", 2D) = "white" { }
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _PathingMapUV ("UV", Int) = 0
        [HideInInspector][Vector2]_PathingMapPan ("Panning", Vector) = (0, 0, 0, 0)
        _PathingColorMap ("RGB Color | A Mask--{reference_properties:[_PathingColorMapPan, _PathingColorMapUV]}", 2D) = "white" { }
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _PathingColorMapUV ("UV", Int) = 0
        [HideInInspector][Vector2]_PathingColorMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [Enum(Fill, 0, Path, 1, Loop, 2)]_PathTypeR ("R Path Type", Float) = 0
        [Enum(Fill, 0, Path, 1, Loop, 2)]_PathTypeG ("G Path Type", Float) = 0
        [Enum(Fill, 0, Path, 1, Loop, 2)]_PathTypeB ("B Path Type", Float) = 0
        [HDR]_PathColorR ("R Color", Color) = (1, 1, 1)
        [HDR]_PathColorG ("G Color", Color) = (1, 1, 1)
        [HDR]_PathColorB ("B Color", Color) = (1, 1, 1)
        [Vector3]_PathEmissionStrength ("Emission Strength", Vector) = (0.0, 0.0, 0.0, 1)
        [Vector3]_PathSoftness ("Softness", Vector) = (1, 1, 1, 1)
        [Vector3]_PathSpeed ("Speed", Vector) = (1.0, 1.0, 1.0, 1)
        [Vector3]_PathWidth ("Length", Vector) = (0.03, 0.03, 0.03, 1)
        [Header(Timing Options)]
        [Vector3]_PathTime ("Manual Timing", Vector) = (-999.0, -999.0, -999.0, 1)
        [Vector3]_PathOffset ("Timing Offset", Vector) = (0.0, 0.0, 0.0, 1)
        [Vector3]_PathSegments ("Path Segments", Vector) = (0.0, 0.0, 0.0, 1)
        [HideInInspector] m_start_PathAudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
        [Header(Time Offset)]
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkPathTimeOffsetBandR ("Band	R", Int) = 0
        [Vector2]_AudioLinkPathTimeOffsetR ("Offset	R", Vector) = (0, 0, 0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkPathTimeOffsetBandG ("Band	G", Int) = 0
        [Vector2]_AudioLinkPathTimeOffsetG ("Offset	G", Vector) = (0, 0, 0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkPathTimeOffsetBandB ("Band	B", Int) = 0
        [Vector2]_AudioLinkPathTimeOffsetB ("Offset	B", Vector) = (0, 0, 0)
        [Header(Emission Offset)]
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkPathEmissionAddBandR ("Band	R", Int) = 0
        [Vector2]_AudioLinkPathEmissionAddR ("Emission	R", Vector) = (0, 0, 0, 0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkPathEmissionAddBandG ("Band	G", Int) = 0
        [Vector2]_AudioLinkPathEmissionAddG ("Emission	G", Vector) = (0, 0, 0, 0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkPathEmissionAddBandB ("Band	B", Int) = 0
        [Vector2]_AudioLinkPathEmissionAddB ("Emission	B", Vector) = (0, 0, 0, 0)
        [Header(Length Offset)]
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkPathWidthOffsetBandR ("Band	R", Int) = 0
        [Vector2]_AudioLinkPathWidthOffsetR ("Offset	R", Vector) = (0, 0, 0, 0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkPathWidthOffsetBandG ("Band	G", Int) = 0
        [Vector2]_AudioLinkPathWidthOffsetG ("Offset	G", Vector) = (0, 0, 0, 0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkPathWidthOffsetBandB ("Band	B", Int) = 0
        [Vector2]_AudioLinkPathWidthOffsetB ("Offset	B", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_end_PathAudioLink ("Audio Link", Float) = 0
        [HideInInspector] m_end_pathing ("Pathing", Float) = 0
        [HideInInspector] m_start_flipBook ("Flipbook", Float) = 0
        [ThryToggle(_SUNDISK_HIGH_QUALITY)]_EnableFlipbook ("Enable Flipbook", Float) = 0
        [ToggleUI]_FlipbookAlphaControlsFinalAlpha ("Flipbook Controls Alpha?", Float) = 0
        [ToggleUI]_FlipbookIntensityControlsAlpha ("Intensity Controls Alpha?", Float) = 0
        [ToggleUI]_FlipbookColorReplaces ("Color Replaces Flipbook", Float) = 0
        [TextureArray]_FlipbookTexArray ("Texture Array", 2DArray) = "" { }
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _FlipbookTexArrayUV ("UV", Int) = 0
        [HideInInspector][Vector2]_FlipbookTexArrayPan ("Panning", Vector) = (0, 0, 0, 0)
        _FlipbookMask ("Mask", 2D) = "white" { }
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _FlipbookMaskUV ("UV", Int) = 0
        [HideInInspector][Vector2]_FlipbookMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        _FlipbookColor ("Color & alpha", Color) = (1, 1, 1, 1)
        _FlipbookTotalFrames ("Total Frames", Float) = 1
        _FlipbookFPS ("FPS", Float) = 30.0
        _FlipbookScaleOffset ("Scale | Offset", Vector) = (1, 1, 0, 0)
        [ToggleUI]_FlipbookTiled ("Tiled?", Float) = 0
        _FlipbookEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        _FlipbookRotation ("Rotation", Range(0, 360)) = 0
        _FlipbookRotationSpeed ("Rotation Speed", Float) = 0
        _FlipbookReplace ("Replace", Range(0, 1)) = 1
        _FlipbookMultiply ("Multiply", Range(0, 1)) = 0
        _FlipbookAdd ("Add", Range(0, 1)) = 0
        [HideInInspector] m_start_FlipbookAudioLink ("Audio Link ♫--{ condition_showS:_EnableAudioLink==1}", Float) = 0
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkFlipbookScaleBand ("Scale Band", Int) = 0
        _AudioLinkFlipbookScale("Scale Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkFlipbookAlphaBand ("Alpha Band", Int) = 0
        [Vector2]_AudioLinkFlipbookAlpha("Alpha Mod", Vector) = (1,1,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkFlipbookEmissionBand ("Emission Band", Int) = 0
        [Vector2]_AudioLinkFlipbookEmission("Emission Mod", Vector) = (0,0,0,0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkFlipbookFrameBand ("Frame Band", Int) = 0
        [Vector2]_AudioLinkFlipbookFrame("Frame control", Vector) = (0,0,0,0)
        [HideInInspector] m_end_FlipbookAudioLink ("Audio Link", Float) = 0
        [HideInInspector] m_start_manualFlipbookControl ("Manual Control", Float) = 0
        _FlipbookCurrentFrame ("Current Frame", Float) = -1
        [HideInInspector] m_end_manualFlipbookControl ("Manual Control", Float) = 0
        [HideInInspector] m_start_crossfade ("Crossfade", Float) = 0
        [ToggleUI]_FlipbookCrossfadeEnabled("Enable Crossfade?", Float) = 0
        [MultiSlider]_FlipbookCrossfadeRange ("Fade Range", Vector) = (0.75, 1, 0, 1)
        [HideInInspector] m_end_crossfade ("Crossfade", Float) = 0
        [HideInInspector] m_start_flipbookHueShift ("Hue Shift", Float) = 0
        [ToggleUI]_FlipbookHueShiftEnabled ("Enabled", Float) = 0
        _FlipbookHueShiftSpeed ("Shift Speed", Float) = 0
        _FlipbookHueShift ("Hue Shift", Range(0,1)) = 0
        [HideInInspector] m_end_flipbookHueShift ("Hue Shift", Float) = 0
        [HideInInspector] m_end_flipBook ("Flipbook", Float) = 0
        [HideInInspector] m_start_dissolve ("Dissolve", Float) = 0
        [ThryToggle(DISTORT)]_EnableDissolve ("Enable Dissolve", Float) = 0
        [Enum(Basic, 1, Point2Point, 2)] _DissolveType ("Dissolve Type", Int) = 1
        _DissolveEdgeWidth ("Edge Width", Range(0, .5)) = 0.025
        _DissolveEdgeHardness ("Edge Hardness", Range(0, 1)) = 0.5
        _DissolveEdgeColor ("Edge Color", Color) = (1, 1, 1, 1)
        [Gradient]_DissolveEdgeGradient ("Edge Gradient", 2D) = "white" { }
        _DissolveEdgeEmission ("Edge Emission", Range(0, 20)) = 0
        _DissolveTextureColor ("Dissolved Color", Color) = (1, 1, 1, 1)
        _DissolveToTexture ("Dissolved Texture", 2D) = "white" { }
        [HideInInspector][Vector2]_DissolveToTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DissolveToTextureUV ("UV", Int) = 0
        _DissolveToEmissionStrength ("Dissolved Emission Strength", Range(0, 20)) = 0
        _DissolveNoiseTexture ("Dissolve Gradient", 2D) = "white" { }
        [HideInInspector][Vector2]_DissolveNoiseTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DissolveNoiseTextureUV ("UV", Int) = 0
        [HideInInspector][ToggleUI]_DissolveInvertNoise ("Invert?", Float) = 0
        _DissolveDetailNoise ("Dissolve Noise", 2D) = "black" { }
        [HideInInspector][Vector2]_DissolveDetailNoisePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DissolveDetailNoiseUV ("UV", Int) = 0
        [HideInInspector][ToggleUI]_DissolveInvertDetailNoise ("Invert?", Float) = 0
        _DissolveDetailStrength ("Dissolve Detail Strength", Range(0, 1)) = 0.1
        _DissolveAlpha ("Dissolve Alpha", Range(0, 1)) = 0
        _DissolveMask ("Dissolve Mask", 2D) = "white" { }
        [ToggleUI]_DissolveUseVertexColors ("VertexColor.g Mask", Float) = 0
        [HideInInspector][Vector2]_DissolveMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _DissolveMaskUV ("UV", Int) = 0
        [HideInInspector][ToggleUI]_DissolveMaskInvert ("Invert?", Float) = 0
        _ContinuousDissolve ("Continuous Dissolve Speed", Float) = 0
        [HideInInspector] m_start_dissolveMasking ("Effect Masking", Float) = 0
        [Enum(Undissolved, 0, Dissolved, 1, Both, 2)] _DissolveEmissionSide ("Emission 1", Int) = 2
        [Enum(Undissolved, 0, Dissolved, 1, Both, 2)] _DissolveEmission1Side ("Emission 2", Int) = 2
        [HideInInspector] m_end_dissolveMasking ("Effect Masking", Float) = 0
        [HideInInspector] m_start_pointToPoint ("point to point", Float) = 0
        [Enum(Local, 0, World, 1, Vertex Colors, 2)] _DissolveP2PWorldLocal ("World/Local", Int) = 0
        _DissolveP2PEdgeLength ("Edge Length", Float) = 0.1
        [Vector3]_DissolveStartPoint ("Start Point", Vector) = (0, -1, 0, 0)
        [Vector3]_DissolveEndPoint ("End Point", Vector) = (0, 1, 0, 0)
        [HideInInspector] m_end_pointToPoint ("Point To Point", Float) = 0
        [HideInInspector] m_start_dissolveHueShift ("Hue Shift", Float) = 0
        [ToggleUI]_DissolveHueShiftEnabled ("Dissolved Enabled", Float) = 0
        _DissolveHueShiftSpeed ("Dissolved Speed", Float) = 0
        _DissolveHueShift ("Dissolved Shift", Range(0,1)) = 0
        [ToggleUI]_DissolveEdgeHueShiftEnabled ("Edge Enabled", Float) = 0
        _DissolveEdgeHueShiftSpeed ("Edge Speed", Float) = 0
        _DissolveEdgeHueShift ("Edge Shift", Range(0,1)) = 0
        [HideInInspector] m_end_dissolveHueShift ("Hue Shift", Float) = 0
        [HideInInspector] m_start_BonusSliders ("Locked In Anim Sliders", Float) = 0
        _DissolveAlpha0 ("Dissolve Alpha 0", Range(-1, 1)) = 0
        _DissolveAlpha1 ("Dissolve Alpha 1", Range(-1, 1)) = 0
        _DissolveAlpha2 ("Dissolve Alpha 2", Range(-1, 1)) = 0
        _DissolveAlpha3 ("Dissolve Alpha 3", Range(-1, 1)) = 0
        _DissolveAlpha4 ("Dissolve Alpha 4", Range(-1, 1)) = 0
        _DissolveAlpha5 ("Dissolve Alpha 5", Range(-1, 1)) = 0
        _DissolveAlpha6 ("Dissolve Alpha 6", Range(-1, 1)) = 0
        _DissolveAlpha7 ("Dissolve Alpha 7", Range(-1, 1)) = 0
        _DissolveAlpha8 ("Dissolve Alpha 8", Range(-1, 1)) = 0
        _DissolveAlpha9 ("Dissolve Alpha 9", Range(-1, 1)) = 0
        [HideInInspector] m_end_BonusSliders ("Locked In Sliders", Float) = 0
        [HideInInspector] m_start_dissolveAudioLink ("Audio Link ♫--{reference_property:_EnableDissolveAudioLink, condition_showS:_EnableAudioLink==1}", Float) = 0
        [HideInInspector][ToggleUI] _EnableDissolveAudioLink ("Enabled?", Float) = 0
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDissolveAlphaBand ("Dissolve Alpha Band", Int) = 0
        [Vector2]_AudioLinkDissolveAlpha ("Dissolve Alpha Mod", Vector) = (0, 0, 0, 0)
        [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _AudioLinkDissolveDetailBand ("Dissolve Detail Band", Int) = 0
        [Vector2]_AudioLinkDissolveDetail ("Dissolve Detail Mod", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_end_dissolveAudioLink ("Audio Link", Float) = 0
        [HideInInspector] m_end_dissolve ("Dissolve", Float) = 0
        [HideInInspector] m_start_panosphereOptions ("Panosphere / Cubemaps", Float) = 0
        [ThryToggle(_DETAIL_MULX2)]_PanoToggle ("Enable Panosphere", Float) = 0
        [ToggleUI]_PanoInfiniteStereoToggle ("Infinite Stereo", Float) = 0
        _PanosphereColor ("Color", Color) = (1, 1, 1, 1)
        _PanosphereTexture ("Texture", 2D) = "white" { }
        _PanoMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_PanoMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _PanoMaskUV ("UV", Int) = 0
        _PanoEmission ("Emission Strength", Range(0, 10)) = 0
        _PanoBlend ("Alpha", Range(0, 1)) = 0
        [Vector3]_PanospherePan ("Pan Speed", Vector) = (0, 0, 0, 0)
        [ToggleUI]_PanoCubeMapToggle ("Use Cubemap", Float) = 0
        [TextureNoSO]_PanoCubeMap ("CubeMap", Cube) = "" { }
        [HideInInspector] m_end_panosphereOptions ("Panosphere / Cubemaps", Float) = 0
        [HideInInspector] m_start_glitter ("Glitter / Sparkle", Float) = 0
        [ThryToggle(_SUNDISK_SIMPLE)]_GlitterEnable ("Enable Glitter?", Float) = 0
        [Enum(Angle, 0, Linear Emission, 1)]_GlitterMode ("Mode", Int) = 0
        [Enum(Circle, 0, Square, 1)]_GlitterShape ("Shape", Int) = 0
        [Enum(Add, 0, Replace, 1)] _GlitterBlendType ("Blend Mode", Int) = 0
        [HDR]_GlitterColor ("Color", Color) = (1, 1, 1)
        _GlitterUseSurfaceColor ("Use Surface Color", Range(0, 1)) = 0
        _GlitterColorMap ("Glitter Color Map", 2D) = "white" { }
        [HideInInspector][Vector2]_GlitterColorMapPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _GlitterColorMapUV ("UV", Int) = 0
        [HideInInspector][Vector2]_GlitterPan ("Panning", Vector) = (0, 0, 0, 0)
        _GlitterMask ("Glitter Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_GlitterMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _GlitterMaskUV ("UV", Int) = 0
        _GlitterTexture ("Glitter Texture--{reference_properties:[_GlitterTexturePan]}", 2D) = "white" { }
        [HideInInspector][Vector2]_GlitterTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [Vector2]_GlitterUVPanning ("Panning Speed", Vector) = (0,0,0,0)
        _GlitterTextureRotation ("Rotation Speed", Float) = 0
        _GlitterFrequency ("Glitter Density", Float) = 300.0
        _GlitterJitter ("Glitter Jitter", Range(0, 1)) = 1.0
        _GlitterSpeed ("Glitter Speed", Float) = 10.0
        _GlitterSize ("Glitter Size", Range(0, 1)) = .3
        _GlitterContrast ("Glitter Contrast--{condition_show:{type:PROPERTY_BOOL,data:_GlitterMode==0}}", Range(1, 1000)) = 300
        _GlitterAngleRange ("Glitter Angle Range--{condition_show:{type:PROPERTY_BOOL,data:_GlitterMode==0}}", Range(0, 90)) = 90
        _GlitterMinBrightness ("Glitter Min Brightness", Range(0, 1)) = 0
        _GlitterBrightness ("Glitter Max Brightness", Range(0, 40)) = 3
        _GlitterBias ("Glitter Bias--{condition_show:{type:PROPERTY_BOOL,data:_GlitterMode==0}}", Range(0, 1)) = .8
        _GlitterHideInShadow("Hide in shadow", Range(0,1)) = 0
        _GlitterCenterSize ("dim light--{condition_show:{type:AND,condition1:{type:PROPERTY_BOOL,data:_GlitterMode==1},condition2:{type:PROPERTY_BOOL,data:_GlitterShape==1}}}", Range(0, 1)) = .08
        _glitterFrequencyLinearEmissive ("Frequency--{condition_show:{type:PROPERTY_BOOL,data:_GlitterMode==1}}", Range(0, 100)) = 20
        _GlitterJaggyFix ("Jaggy Fix--{condition_show:{type:PROPERTY_BOOL,data:_GlitterShape==1}}", Range(0, .1)) = .0
        [HideInInspector] m_start_glitterHueShift ("Hue Shift", Float) = 0
        [ToggleUI]_GlitterHueShiftEnabled ("Enabled", Float) = 0
        _GlitterHueShiftSpeed ("Shift Speed", Float) = 0
        _GlitterHueShift ("Hue Shift", Range(0,1)) = 0
        [HideInInspector] m_end_glitterHueShift ("Hue Shift", Float) = 0
        [HideInInspector] m_start_glitterRandom ("Random Things", Float) = 0
        [ToggleUI]_GlitterRandomColors ("Random Colors", Float) = 0
        [MultiSlider]_GlitterMinMaxSaturation ("Saturation Range", Vector) = (0.8, 1, 0, 1)
        [MultiSlider]_GlitterMinMaxBrightness ("Brightness Range", Vector) = (0.8, 1, 0, 1)
        [ToggleUI]_GlitterRandomSize("Random Size?", Float) = 0
        [MultiSlider]_GlitterMinMaxSize ("Size Range", Vector) = (0.1, 0.5, 0, 1)
        [ToggleUI]_GlitterRandomRotation("Random Tex Rotation", Float) = 0
        [HideInInspector] m_end_glitterRandom ("Random Colors", Float) = 0
        [HideInInspector] m_end_glitter ("Glitter / Sparkle", Float) = 0
        [HideInInspector] m_start_Text ("MSDF Text Overlay", Float) = 0
        _TextGlyphs ("Font Array", 2D) = "black" { }
        _TextPixelRange ("Pixel Range", Float) = 4.0
        [ThryToggle(EFFECT_BUMP)]_TextEnabled ("Text?", Float) = 0
        [HideInInspector] m_start_TextFPS ("FPS", Float) = 0
        [ToggleUI]_TextFPSEnabled ("FPS Text?", Float) = 0
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _TextFPSUV ("FPS UV", Int) = 0
        _TextFPSColor ("Color", Color) = (1, 1, 1, 1)
        _TextFPSEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        [Vector2]_TextFPSOffset ("Offset", Vector) = (0, 0, 0, 0)
        _TextFPSRotation ("Rotation", Range(0, 360)) = 0
        [Vector2]_TextFPSScale ("Scale", Vector) = (1, 1, 1, 1)
        _TextFPSPadding ("Padding Reduction", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_end_TextFPS ("FPS", Float) = 0
        [HideInInspector] m_start_TextPosition ("Position", Float) = 0
        [ToggleUI]_TextPositionEnabled ("Position Text?", Float) = 0
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _TextPositionUV ("Position UV", Int) = 0
        _TextPositionColor ("Color", Color) = (1, 0, 1, 1)
        _TextPositionEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        [Vector2]_TextPositionOffset ("Offset", Vector) = (0, 0, 0, 0)
        _TextPositionRotation ("Rotation", Range(0, 360)) = 0
        [Vector2]_TextPositionScale ("Scale", Vector) = (1, 1, 1, 1)
        _TextPositionPadding ("Padding Reduction", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_end_TextPosition ("Position", Float) = 0
        [HideInInspector] m_start_TextInstanceTime ("Instance Time", Float) = 0
        [ToggleUI]_TextTimeEnabled ("Time Text?", Float) = 0
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _TextTimeUV ("Time UV", Int) = 0
        _TextTimeColor ("Color", Color) = (1, 0, 1, 1)
        _TextTimeEmissionStrength ("Emission Strength", Range(0, 20)) = 0
        [Vector2]_TextTimeOffset ("Offset", Vector) = (0, 0, 0, 0)
        _TextTimeRotation ("Rotation", Range(0, 360)) = 0
        [Vector2]_TextTimeScale ("Scale", Vector) = (1, 1, 1, 1)
        _TextTimePadding ("Padding Reduction", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_end_TextInstanceTime ("Instance Time", Float) = 0
        [HideInInspector] m_end_Text ("MSDF Text Overlay", Float) = 0
        [HideInInspector] m_start_mirrorOptions ("Mirror", Float) = 0
        [ThryToggle(_REQUIRE_UV2)]_EnableMirrorOptions ("Enable Mirror Options", Float) = 0
        [Enum(ShowInBoth, 0, ShowOnlyInMirror, 1, DontShowInMirror, 2)] _Mirror ("Show in mirror", Int) = 0
        [ToggleUI]_EnableMirrorTexture ("Enable Mirror Texture", Float) = 0
        _MirrorTexture ("Mirror Tex", 2D) = "white" { }
        [HideInInspector][Vector2]_MirrorTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _MirrorTextureUV ("UV", Int) = 0
        [HideInInspector] m_end_mirrorOptions ("Mirror", Float) = 0
        [HideInInspector] m_start_distanceFade ("Distance Fade", Float) = 0
        _MainFadeTexture ("Fade Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_MainFadeTexturePan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _MainFadeTextureUV ("UV", Int) = 0
        [Enum(Object Position, 0, Pixel Position, 1)] _MainFadeType ("Pos To Use", Int) = 1
        _MainMinAlpha ("Minimum Alpha", Range(0, 1)) = 0
        _MainMaxAlpha ("Maximum Alpha", Range(0, 1)) = 1
        _MainDistanceFadeMin ("Distance Min", Float) = 0
        _MainDistanceFadeMax ("Distance Max", Float) = 0
        [HideInInspector] m_end_distanceFade ("Distance Fade", Float) = 0
        [HideInInspector] m_start_angularFade ("Angular Fade", Float) = 0
        [ThryToggle(_SUNDISK_NONE)]_EnableRandom ("Enable Angular Fade", Float) = 0
        [Enum(Camera Face Model, 0, Model Face Camera, 1, Face Each Other, 2)] _AngleType ("Angle Type", Int) = 0
        [Enum(Model, 0, Vertex, 1)] _AngleCompareTo ("Model or Vert Positon", Int) = 0
        [Vector3]_AngleForwardDirection ("Forward Direction", Vector) = (0, 0, 1, 0)
        _CameraAngleMin ("Camera Angle Min", Range(0, 180)) = 45
        _CameraAngleMax ("Camera Angle Max", Range(0, 180)) = 90
        _ModelAngleMin ("Model Angle Min", Range(0, 180)) = 45
        _ModelAngleMax ("Model Angle Max", Range(0, 180)) = 90
        _AngleMinAlpha ("Min Alpha", Range(0, 1)) = 0
        [HideInInspector] m_end_angularFade ("Angular Fade", Float) = 0
        [HideInInspector] m_start_distortionFlow ("UV Distortion", Float) = 0
            [ThryToggle(USER_LUT)] _EnableDistortion ("Enabled?", Float) = 0
            _DistortionMask ("Mask--{reference_properties:[_DistortionMaskPan, _DistortionMaskUV]}", 2D) = "white" { }
            [HideInInspector][Vector2]_DistortionMaskPan ("Panning", Vector) = (0, 0, 0, 0)
            [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3)] _DistortionMaskUV ("UV", Int) = 0
            _DistortionFlowTexture ("Distortion Texture 1", 2D) = "black" { }
            _DistortionFlowTexture1 ("Distortion Texture 2", 2D) = "black" { }
            _DistortionStrength ("Strength1", Float) = 0.5
            _DistortionStrength1 ("Strength2", Float) = 0.5
            [Vector2]_DistortionSpeed ("Speed1", Vector) = (0.5, 0.5, 0, 0)
            [Vector2]_DistortionSpeed1 ("Speed2", Vector) = (0.5, 0.5, 0, 0)
            [HideInInspector] m_start_DistortionAudioLink ("Audio Link ♫--{reference_property:_EnableDistortionAudioLink, condition_showS:_EnableAudioLink==1}", Float) = 0
                [HideInInspector][ToggleUI] _EnableDistortionAudioLink ("Enabled?", Float) = 0
                [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _DistortionStrengthAudioLinkBand ("Strength 1 Band", Int) = 0
                [Vector2]_DistortionStrengthAudioLink ("Strength 1 Offset Range", Vector) = (0, 0, 0, 0)
                [Enum(Bass, 0, Low Mid, 1, High Mid, 2, Treble, 3)] _DistortionStrength1AudioLinkBand ("Strength 2 Band", Int) = 0
                [Vector2]_DistortionStrength1AudioLink ("Strength 2 Offset Range", Vector) = (0, 0, 0, 0)
            [HideInInspector] m_end_DistortionAudioLink ("Audio Link", Float) = 0
        [HideInInspector] m_end_distortionFlow ("UV Distortion", Float) = 0
        [HideInInspector] m_start_audioLink ("Audio Link--{reference_property:_EnableAudioLink}", Float) = 0
        [HideInInspector][ThryToggle(COLOR_GRADING_LOG_VIEW)] _EnableAudioLink ("Enabled?", Float) = 0
        [Helpbox(1)] _AudioLinkHelp ("This section houses the global controls for audio link. Controls for individual features are in their respective sections. (Emission, Dissolve, etc...)", Int) = 0
        [ToggleUI] _AudioLinkAnimToggle ("Anim Toggle", Float) = 1
        _AudioLinkDelay ("Delay", Range(0,1)) = 0
        [ToggleUI]_AudioLinkAveraging ("Enable averaging", Float) = 0
        _AudioLinkAverageRange ("Average Sampling Range", Range(0,1)) = .5
        [HideInInspector] m_start_audioLinkDebug ("Debug--{reference_property:_EnableAudioLinkDebug}", Float) = 0
        [HideInInspector][ToggleUI] _EnableAudioLinkDebug("Enable?", Float) = 0
        _AudioLinkDebugTreble ("Treble", Range(0,1)) = 0
        _AudioLinkDebugHighMid ("High Mid", Range(0,1)) = 0
        _AudioLinkDebugLowMid ("Low Mid", Range(0,1)) = 0
        _AudioLinkDebugBass ("Bass", Range(0,1)) = 0
        [ToggleUI] _AudioLinkDebugAnimate ("Debug Animate", Float) = 0
        [ToggleUI]_AudioLinkTextureVisualization("Visualize Texture", Float) = 0
        [HideInInspector] m_end_audioLinkDebug ("Debug", Float) = 0
        [HideInInspector] m_end_audioLink ("Audio Link", Float) = 0
        [HideInInspector] m_Patreon ("Patreon (Pro Only)", Float) = 0
        [Helpbox(1)] _PatreonHelpBox("This section is included to let people know what's included in the pro shader. Nothing here can be used in toon. Feel free to hide this section with the custom UI dropdown at the top of the material.", Int) = 0
        [HideInInspector] m_start_Video ("Video", Float) = 0
        [HideInInspector] m_start_VideoSettings ("Video Texture Settings", Float) = 0
        [HideInInspector] m_end_VideoSettings ("Video Texture Settings", Float) = 0
        [HideInInspector] m_start_VideoDebug ("Video Debug", Float) = 0
        [HideInInspector] m_end_VideoDebug ("Video Debug", Float) = 0
        [HideInInspector] m_start_CRT ("CRT Options", Float) = 0
        [HideInInspector] m_end_CRT ("CRT Options", Float) = 0
        [HideInInspector] m_start_Gameboy ("Gameboy Options", Float) = 0
        [HideInInspector] m_end_Gameboy ("Gameboy Options", Float) = 0
        [HideInInspector] m_end_Video ("Video", Float) = 0
        [HideInInspector] m_start_TouchOptions ("Touch FX", Float) = 0
        [HideInInspector] m_start_Bulge ("Bulge", Float) = 0
        [HideInInspector] m_end_Bulge ("Bulge", Float) = 0
        [HideInInspector] m_start_TouchGlow ("Touch Color", Float) = 0
        [HideInInspector] m_end_TouchGlow ("Touch Color", Float) = 0
        [HideInInspector] m_end_TouchOptions ("Touch FX", Float) = 0
        [HideInInspector] m_start_Hologram ("Hologram Alpha", Float) = 0
        [HideInInspector] m_start_FresnelAlpha ("Fresnel Alpha", Float) = 0
        [HideInInspector] m_end_FresnelAlpha ("Fresnel Alpha", Float) = 0
        [HideInInspector] m_end_Hologram ("Hologram Alpha", Float) = 0
        [HideInInspector] m_start_GrabPass ("GrabPass Transparency", Float) = 0
        [HideInInspector] m_start_Refraction ("Refraction", Float) = 0
        [HideInInspector] m_end_Refraction ("Refraction", Float) = 0
        [HideInInspector] m_start_Blur ("Blur", Float) = 0
        [HideInInspector] m_end_Blur ("Blur", Float) = 0
        [HideInInspector] m_end_GrabPass ("GrabPass Transparency", Float) = 0
        [HideInInspector] m_start_Iridescence ("Iridescence", Float) = 0
        [HideInInspector] m_end_Iridescence ("Iridescence", Float) = 0
        [HideInInspector] m_start_VertexGlitch ("Vertex Glitching", Float) = 0
        [HideInInspector] m_end_VertexGlitch ("Vertex Glitching", Float) = 0
        [HideInInspector] m_start_Spawns ("Spawns", Float) = 0
        [HideInInspector] m_start_ScifiSpawnIn ("Sci Fi", Float) = 0
        [HideInInspector] m_end_SciFiSpawnIn ("Sci Fi", Float) = 0
        [HideInInspector] m_end_Spawns ("Spawns", Float) = 0
        [HideInInspector] m_start_Voronoi ("Voronoi", Float) = 0
        [HideInInspector] m_start_voronoiRandom ("Voronoi Random Cell Color", Float) = 0
        [HideInInspector] m_end_voronoiRandom ("Voronoi Random Cell Color", Float) = 0
        [HideInInspector] m_end_Voronoi ("Vertex Glitching", Float) = 0
        [HideInInspector] m_start_BlackLight ("Black Light Mask", Float) = 0
        [HideInInspector] m_end_BlackLight ("Black Light", Float) = 0
        [HideInInspector] m_outlineOptions ("Outlines", Float) = 0
        [ToggleUI]_commentIfZero_EnableOutlinePass ("Enable Outlines", float) = 0
        [Enum(Basic, 0, Tint, 1, Rim Light, 2, Directional, 3, DropShadow, 4)]_OutlineMode ("Mode", Int) = 0
        _OutlineTintMix ("Tint Mix--{condition_show:{type:PROPERTY_BOOL,data:_OutlineMode==1}}", Range(0, 1)) = 0
        _OutlineRimLightBlend ("Rim Light Blend--{condition_show:{type:PROPERTY_BOOL,data:_OutlineMode==2}}", Range(0, 1)) = 0
        _OutlinePersonaDirection ("directional Offset XY--{condition_show:{type:PROPERTY_BOOL,data:_OutlineMode==3}}", Vector) = (1, 0, 0, 0)
        _OutlineDropShadowOffset ("Drop Direction XY--{condition_show:{type:PROPERTY_BOOL,data:_OutlineMode==4}}", Vector) = (1, 0, 0, 0)
        [ToggleUI]_OutlineFixedSize ("Fixed Size?", Float) = 0
        _OutlinesMaxDistance ("Fixed Size Max Distance", Float) = 9999
        [Enum(Off, 0, Normals, 1, Mask VC.r, 2)]_OutlineUseVertexColors ("Vertex Color", Float) = 0
        [ToggleUI]_OutlineLit ("Enable Lighting", Float) = 1
        _LineWidth ("Width", Float) = 0
        _LineColor ("Color", Color) = (1, 1, 1, 1)
        _OutlineEmission ("Outline Emission", Float) = 0
        _OutlineTexture ("Outline Texture--{reference_properties:[_OutlineTexturePan, _OutlineTextureUV]}", 2D) = "white" { }
        [HideInInspector][Vector2]_OutlineTexturePan ("Outline Texture Pan", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _OutlineTextureUV ("UV", Int) = 0
        _OutlineMask ("Outline Mask--{reference_properties:[_OutlineMaskPan, _OutlineMaskUV]}", 2D) = "white" { }
        [HideInInspector][Vector2]_OutlineMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3)] _OutlineMaskUV ("UV", Int) = 0
        _OutlineShadowStrength ("Shadow Strength", Range(0, 1)) = 1
        [Header(Hue Shift)]
        [ToggleUI]_OutlineHueShift ("Hue Shift?", Float) = 0
        _OutlineHueOffset ("Shift", Range(0, 1)) = 0
        _OutlineHueOffsetSpeed ("Shift Speed", Float) = 0
        [HideInInspector] m_start_outlineAdvanced ("Advanced", Float) = 0
        [Vector2]_OutlineFadeDistance ("Outline distance Fade", Vector) = (0, 0, 0, 0)
        [Enum(UnityEngine.Rendering.CullMode)] _OutlineCull ("Cull", Float) = 1
        _OutlineOffsetFactor("Offset Factor", Float) = 0
        _OutlineOffsetUnits("Offset Units", Float) = 0
        [HideInInspector] m_end_outlineAdvanced ("Advanced", Float) = 0
        [HideInInspector] m_ParallaxMap ("Parallax", Float) = 0
        [ThryToggle(_PARALLAXMAP)]_ParallaxMap ("Enable Parallax FX", Float) = 0
        [ToggleUI]_ParallaxHeightMapEnabled ("Enable Parallax Height", Float) = 0
        [ToggleUI]_ParallaxInternalMapEnabled ("Enable Parallax Internal", Float) = 0
        [HideInInspector] m_start_parallaxHeightmap ("Heightmap", Float) = 0
        [Vector2]_ParallaxHeightMapPan ("Pan", Vector) = (0, 0, 0, 0)
        [Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3)] _ParallaxUV ("Parallax UV", Int) = 0
        _ParallaxHeightMap ("Height Map", 2D) = "black" { }
        _ParallaxHeightMapMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_ParallaxHeightMapMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _ParallaxHeightMapMaskUV ("UV", Int) = 0
        _ParallaxStrength ("Parallax Strength", Range(0, 1)) = 0
        [HideInInspector] m_end_parallaxHeightmap ("Heightmap", Float) = 0
        [HideInInspector] m_start_parallaxInternal ("Internal", Float) = 0
        [Enum(Basic, 0, HeightMap, 1)] _ParallaxInternalHeightmapMode ("Parallax Mode", Int) = 0
        [ToggleUI]_ParallaxInternalHeightFromAlpha ("HeightFromAlpha", Float) = 0
        _ParallaxInternalMap ("Internal Map", 2D) = "black" { }
        _ParallaxInternalMapMask ("Mask", 2D) = "white" { }
        [HideInInspector][Vector2]_ParallaxInternalMapMaskPan ("Panning", Vector) = (0, 0, 0, 0)
        [HideInInspector][Enum(UV0, 0, UV1, 1, UV2, 2, UV3, 3, distorteduv0, 4)] _ParallaxInternalMapMaskUV ("UV", Int) = 0
        _ParallaxInternalIterations ("Parallax Internal Iterations", Range(1, 50)) = 1
        _ParallaxInternalMinDepth ("Min Depth", Float) = 0
        _ParallaxInternalMaxDepth ("Max Depth", Float) = 1
        _ParallaxInternalMinFade ("Min Depth Brightness", Range(0, 5)) = 0
        _ParallaxInternalMaxFade ("Max Depth Brightness", Range(0, 5)) = 1
        _ParallaxInternalMinColor ("Min Depth Color", Color) = (1, 1, 1, 1)
        _ParallaxInternalMaxColor ("Max Depth Color", Color) = (1, 1, 1, 1)
        [Vector2]_ParallaxInternalPanSpeed ("Pan Speed", Vector) = (0, 0, 0, 0)
        [Vector2]_ParallaxInternalPanDepthSpeed ("Per Level Speed Multiplier", Vector) = (0, 0, 0, 0)
        [HideInInspector] m_end_parallaxInternal ("Internal", Float) = 0
        [HideInInspector] m_start_parallaxAdvanced ("Advanced", Float) = 0
        _ParallaxBias ("Parallax Bias (0.42)", Float) = 0.42
        [HideInInspector] m_end_parallaxAdvanced ("Advanced", Float) = 0
        [HideInInspector] m_PostProcessing ("Post Processing", Float) = 0
        [Helpbox(1)] _PPHelp ("This section is designed for you to make adjustments to your final look in game through animations not to permentantly change settings before uploading.", Int) = 0
        _PPLightingMultiplier ("Lighting Mulitplier", Float) = 1
        _PPEmissionMultiplier ("Emission Multiplier", Float) = 1
        [HideInInspector] m_renderingOptions ("Rendering Options", Float) = 0
        [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2
        [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 4
        [Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Int) = 1
        [Enum(Thry.ColorMask)] _ColorMask ("Color Mask", Int) = 15
        _OffsetFactor ("Offset Factor", Float) = 0.0
        _OffsetUnits ("Offset Units", Float) = 0.0
        [ToggleUI]_IgnoreFog ("Ignore Fog", Float) = 0
        [HideInInspector] Instancing ("Instancing", Float) = 0 //add this property for instancing variants settings to be shown
        [HideInInspector] m_start_blending ("Blending", Float) = 0
        [Enum(Thry.BlendOp)]_BlendOp ("RGB Blend Op", Int) = 0
        [Enum(Thry.BlendOp)]_BlendOpAlpha ("Alpha Blend Op", Int) = 0
        [Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("Source Blend", Int) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("Destination Blend", Int) = 0
        [HideInInspector] m_end_blending ("Blending", Float) = 0
        [HideInInspector] m_start_StencilPassOptions ("Stencil", Float) = 0
        [IntRange] _StencilRef ("Stencil Reference Value", Range(0, 255)) = 0
        [IntRange] _StencilReadMask ("Stencil ReadMask Value", Range(0, 255)) = 255
        [IntRange] _StencilWriteMask ("Stencil WriteMask Value", Range(0, 255)) = 255
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilPassOp ("Stencil Pass Op", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilFailOp ("Stencil Fail Op", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilZFailOp ("Stencil ZFail Op", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _StencilCompareFunction ("Stencil Compare Function", Float) = 8
        [HideInInspector] m_end_StencilPassOptions ("Stencil", Float) = 0
        [HideInInspector] m_start_OutlineStencil ("Outline Stencil--{ condition_show:{type:PROPERTY_BOOL,data:_commentIfZero_EnableOutlinePass==1}}", Float) = 0
        [IntRange] _OutlineStencilRef ("Stencil Reference Value", Range(0, 255)) = 0
        [IntRange] _OutlineStencilReadMask ("Stencil ReadMask Value", Range(0, 255)) = 255
        [IntRange] _OutlineStencilWriteMask ("Stencil WriteMask Value", Range(0, 255)) = 255
        [Enum(UnityEngine.Rendering.StencilOp)] _OutlineStencilPassOp ("Stencil Pass Op", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _OutlineStencilFailOp ("Stencil Fail Op", Float) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _OutlineStencilZFailOp ("Stencil ZFail Op", Float) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _OutlineStencilCompareFunction ("Stencil Compare Function", Float) = 8
        [HideInInspector] m_end_OutlineStencil ("Outline Stencil", Float) = 0
        [HideInInspector] m_start_debugOptions ("Debug", Float) = 0
        [HideInInspector][ThryToggle(_COLOROVERLAY_ON)]_DebugEnabled ("Display Debug Info", Float) = 0
        _VertexUnwrap ("Unwrap", Range(0, 1)) = 0
        [Enum(Off, 0, Vertex Normal, 1, Pixel Normal, 2, Tangent, 3, Binormal, 4, Local 0 Distance, 5)] _DebugMeshData ("Mesh Data", Int) = 0
        [Enum(Off, 0, Attenuation, 1, Direct Lighting, 2, Indirect Lighting, 3, light Map, 4, Ramped Light Map, 5, Final Lighting, 6)] _DebugLightingData ("Lighting Data", Int) = 0
        [Enum(Off, 0, View Dir, 1, Tangent View Dir, 2, Forward Dir, 3, WorldPos, 4, View Dot Normal, 5)] _DebugCameraData ("Camera Data", Int) = 0
        [HideInInspector] m_end_debugOptions ("Debug", Float) = 0
    }
    CustomEditor "Thry.ShaderEditor"
    SubShader
    {
        Tags { "RenderType" = "Opaque" "Queue" = "Geometry+10" }
        Pass
        {
            Tags { "LightMode" = "ForwardBase" }
            Stencil
            {
                Ref [_StencilRef]
                ReadMask [_StencilReadMask]
                WriteMask [_StencilWriteMask]
                Comp [_StencilCompareFunction]
                Pass [_StencilPassOp]
                Fail [_StencilFailOp]
                ZFail [_StencilZFailOp]
            }
            ZWrite [_ZWrite]
            Cull [_Cull]
            AlphaToMask [_AlphaToMask]
            ZTest [_ZTest]
            ColorMask [_ColorMask]
            Offset [_OffsetFactor], [_OffsetUnits]
            BlendOp [_BlendOp], [_BlendOpAlpha]
            Blend [_SrcBlend] [_DstBlend]
            CGPROGRAM
#define OPTIMIZER_ENABLED
#define VIGNETTE_MASKED
#define _EMISSION
#define _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
#define PROPSHADER_IS_USING_THRY_EDITOR 69
#define PROPSHADER_MASTER_LABEL 0
#define PROPSHADER_PRESETS 0
#define PROPSHADER_PROPERTIES_LABEL_FILE 0
#define PROPFOOTER_YOUTUBE 0
#define PROPFOOTER_TWITTER 0
#define PROPFOOTER_PATREON 0
#define PROPFOOTER_DISCORD 0
#define PROPFOOTER_GITHUB 0
#define PROP_FORGOTTOLOCKMATERIAL 1
#define PROP_SHADEROPTIMIZERENABLED 0
#define PROP_LOCKTOOLTIP 0
#define PROP_MODE 0
#define PROPM_MAINOPTIONS 1
#define PROP_MAINTEXTUREUV 0
#define PROP_MAINEMISSIONSTRENGTH 0
#define PROP_BUMPMAPUV 0
#define PROP_BUMPSCALE 1
#define PROP_CLIPPINGMASKUV 0
#define PROP_INVERSE_CLIPPING 0
#define PROPM_START_MAINHUESHIFT 1
#define PROP_MAINCOLORADJUSTTEXTUREUV 0
#define PROP_MAINHUESHIFTREPLACE 1
#define PROP_MAINHUESHIFT 0
#define PROP_MAINHUESHIFTSPEED 1
#define PROP_SATURATION 0
#define PROP_MAINBRIGHTNESS 0
#define PROP_MAINHUESHIFTTOGGLE 0
#define PROPM_END_MAINHUESHIFT 0
#define PROPM_START_RGBMASK 0
#define PROP_RGBMASKENABLED 0
#define PROP_RGBUSEVERTEXCOLORS 0
#define PROP_RGBBLENDMULTIPLICATIVE 0
#define PROP_RGBMASKUV 0
#define PROP_RGBRED_UV 0
#define PROP_RGBGREEN_UV 0
#define PROP_RGBBLUE_UV 0
#define PROP_RGBALPHA_UV 0
#define PROP_RGBNORMALSENABLED 0
#define PROP_RGBNORMALBLEND 0
#define PROP_RGBNORMALRUV 0
#define PROP_RGBNORMALRSCALE 0
#define PROP_RGBNORMALGUV 0
#define PROP_RGBNORMALGSCALE 0
#define PROP_RGBNORMALBUV 0
#define PROP_RGBNORMALBSCALE 0
#define PROP_RGBNORMALAUV 0
#define PROP_RGBNORMALASCALE 0
#define PROPM_END_RGBMASK 0
#define PROPM_START_DETAILOPTIONS 0
#define PROP_DETAILENABLED 0
#define PROP_DETAILMASKUV 0
#define PROP_DETAILTEXUV 0
#define PROP_DETAILTEXINTENSITY 1
#define PROP_DETAILBRIGHTNESS 1
#define PROP_DETAILNORMALMAPSCALE 1
#define PROP_DETAILNORMALMAPUV 0
#define PROPM_END_DETAILOPTIONS 0
#define PROPM_START_MAINVERTEXCOLORS 0
#define PROP_MAINVERTEXCOLORINGLINEARSPACE 1
#define PROP_MAINVERTEXCOLORING 0
#define PROP_MAINUSEVERTEXCOLORALPHA 0
#define PROPM_END_MAINVERTEXCOLORS 0
#define PROPM_START_VERTEXMANIPULATION 0
#define PROP_VERTEXMANIPULATIONSENABLED 0
#define PROP_VERTEXMANIPULATIONHEIGHT 0
#define PROP_VERTEXMANIPULATIONHEIGHTUV 0
#define PROP_VERTEXMANIPULATIONHEIGHTBIAS 0
#define PROP_VERTEXROUNDINGENABLED 0
#define PROP_VERTEXROUNDINGDIVISION 500
#define PROPM_END_VERTEXMANIPULATION 0
#define PROPM_START_ALPHA 0
#define PROP_CUTOFF 0.5
#define PROP_DITHERINGENABLED 0
#define PROP_DITHERGRADIENT 0.1
#define PROP_FORCEOPAQUE 0
#define PROP_MAINSHADOWCLIPMOD 0
#define PROP_ALPHATOMASK 0
#define PROP_MAINALPHATOCOVERAGE 0
#define PROP_MAINMIPSCALE 0.25
#define PROP_ALPHAPREMULTIPLY 0
#define PROP_ALPHAMOD 0
#define PROPM_END_ALPHA 0
#define PROPM_START_DECALSECTION 0
#define PROP_DECALMASKUV 0
#define PROPM_START_DECAL0 0
#define PROP_DECALENABLED 0
#define PROP_DECALEMISSIONSTRENGTH 0
#define PROP_DECALTEXTUREUV 0
#define PROP_DECALTILED 0
#define PROP_DECAL0DEPTH 0
#define PROP_DECALROTATION 0
#define PROP_DECALROTATIONSPEED 0
#define PROP_DECALBLENDTYPE 0
#define PROP_DECALBLENDALPHA 1
#define PROP_DECALHUESHIFTENABLED 0
#define PROP_DECALHUESHIFTSPEED 0
#define PROP_DECALHUESHIFT 0
#define PROPM_START_DECAL0AUDIOLINK 0
#define PROP_AUDIOLINKDECAL0SCALEBAND 0
#define PROP_AUDIOLINKDECAL0ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL0ALPHABAND 0
#define PROP_AUDIOLINKDECAL0EMISSIONBAND 0
#define PROPM_END_DECAL0AUDIOLINK 0
#define PROPM_END_DECAL0 0
#define PROPM_START_DECAL1 0
#define PROP_DECALENABLED1 0
#define PROP_DECALEMISSIONSTRENGTH1 0
#define PROP_DECALTEXTURE1UV 0
#define PROP_DECALTILED1 0
#define PROP_DECAL1DEPTH 0
#define PROP_DECALROTATION1 0
#define PROP_DECALROTATIONSPEED1 0
#define PROP_DECALBLENDTYPE1 0
#define PROP_DECALBLENDALPHA1 1
#define PROP_DECALHUESHIFTENABLED1 0
#define PROP_DECALHUESHIFTSPEED1 0
#define PROP_DECALHUESHIFT1 0
#define PROPM_START_DECAL1AUDIOLINK 0
#define PROP_AUDIOLINKDECAL1SCALEBAND 0
#define PROP_AUDIOLINKDECAL1ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL1ALPHABAND 0
#define PROP_AUDIOLINKDECAL1EMISSIONBAND 0
#define PROPM_END_DECAL1AUDIOLINK 0
#define PROPM_END_DECAL1 0
#define PROPM_START_DECAL2 0
#define PROP_DECALENABLED2 0
#define PROP_DECALEMISSIONSTRENGTH2 0
#define PROP_DECALTEXTURE2UV 0
#define PROP_DECALTILED2 0
#define PROP_DECAL2DEPTH 0
#define PROP_DECALROTATION2 0
#define PROP_DECALROTATIONSPEED2 0
#define PROP_DECALBLENDTYPE2 0
#define PROP_DECALBLENDALPHA2 1
#define PROP_DECALHUESHIFTENABLED2 0
#define PROP_DECALHUESHIFTSPEED2 0
#define PROP_DECALHUESHIFT2 0
#define PROPM_START_DECAL2AUDIOLINK 0
#define PROP_AUDIOLINKDECAL2SCALEBAND 0
#define PROP_AUDIOLINKDECAL2ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL2ALPHABAND 0
#define PROP_AUDIOLINKDECAL2EMISSIONBAND 0
#define PROPM_END_DECAL2AUDIOLINK 0
#define PROPM_END_DECAL2 0
#define PROPM_START_DECAL3 0
#define PROP_DECALENABLED3 0
#define PROP_DECALEMISSIONSTRENGTH3 0
#define PROP_DECALTEXTURE3UV 0
#define PROP_DECALTILED3 0
#define PROP_DECAL3DEPTH 0
#define PROP_DECALROTATION3 0
#define PROP_DECALROTATIONSPEED3 0
#define PROP_DECALBLENDTYPE3 0
#define PROP_DECALBLENDALPHA3 1
#define PROP_DECALHUESHIFTENABLED3 0
#define PROP_DECALHUESHIFTSPEED3 0
#define PROP_DECALHUESHIFT3 0
#define PROPM_START_DECAL3AUDIOLINK 0
#define PROP_AUDIOLINKDECAL3SCALEBAND 0
#define PROP_AUDIOLINKDECAL3ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL3ALPHABAND 0
#define PROP_AUDIOLINKDECAL3EMISSIONBAND 0
#define PROPM_END_DECAL3AUDIOLINK 0
#define PROPM_END_DECAL3 0
#define PROPM_END_DECALSECTION 0
#define PROPM_START_BACKFACE 0
#define PROP_BACKFACEENABLED 0
#define PROP_BACKFACEREPLACEALPHA 0
#define PROP_BACKFACETEXTUREUV 0
#define PROP_BACKFACEDETAILINTENSITY 1
#define PROP_BACKFACEHUESHIFT 0
#define PROP_BACKFACEEMISSIONSTRENGTH 0
#define PROPM_END_BACKFACE 0
#define PROPM_LIGHTINGOPTIONS 1
#define PROPM_START_LIGHTING 1
#define PROP_ENABLELIGHTING 1
#define PROP_LIGHTINGMODE 1
#define PROP_LIGHTINGSTANDARDSMOOTHNESS 0
#define PROP_LIGHTINGWRAPPEDWRAP 0
#define PROP_LIGHTINGWRAPPEDNORMALIZATION 0
#define PROP_LIGHTINGRAMPTYPE 0
#define PROP_1ST_SHADEMAPUV 0
#define PROP_USE_1STSHADEMAPALPHA_AS_SHADOWMASK 0
#define PROP_1STSHADEMAPMASK_INVERSE 0
#define PROP_USE_BASEAS1ST 0
#define PROP_2ND_SHADEMAPUV 0
#define PROP_USE_2NDSHADEMAPALPHA_AS_SHADOWMASK 0
#define PROP_2NDSHADEMAPMASK_INVERSE 0
#define PROP_USE_1STAS2ND 0
#define PROP_BASECOLOR_STEP 0.5
#define PROP_BASESHADE_FEATHER 0.0001
#define PROP_SHADECOLOR_STEP 0
#define PROP_1ST2ND_SHADES_FEATHER 0.0001
#define PROP_TOONRAMP
#define PROP_LIGHTINGSHADOWMASKUV 0
#define PROP_SHADOWOFFSET 0
#define PROP_LIGHTINGGRADIENTSTART 0
#define PROP_LIGHTINGGRADIENTEND 0.5
#define PROP_SSSSCALE 1
#define PROP_SSSBUMPBLUR 0.7
#define PROP_SHADOWSTRENGTH 1
#define PROP_ATTENUATIONMULTIPLIER 0
#define PROP_LIGHTINGIGNOREAMBIENTCOLOR 0
#define PROPM_START_LIGHTINGMODIFIERS 0
#define PROP_LIGHTINGDIRECTCOLORMODE 0
#define PROP_LIGHTINGINDIRECTCOLORMODE 0
#define PROP_LIGHTINGUNCAPPED 0
#define PROP_LIGHTINGONLYUNITYSHADOWS 0
#define PROP_LIGHTINGMONOCHROMATIC 0
#define PROP_LIGHTINGMINLIGHTBRIGHTNESS 0
#define PROP_LIGHTINGMINSHADOWBRIGHTNESSRATIO 0
#define PROPM_END_LIGHTINGMODIFIERS 0
#define PROPM_START_DETAILSHADOWS 0
#define PROP_LIGHTINGDETAILSHADOWSENABLED 0
#define PROP_LIGHTINGDETAILSHADOWSUV 0
#define PROP_LIGHTINGDETAILSTRENGTH 1
#define PROPM_END_DETAILSHADOWS 0
#define PROPM_START_AMBIENTOCCLUSION 0
#define PROP_LIGHTINGENABLEAO 0
#define PROP_LIGHTINGAOTEXUV 0
#define PROP_AOSTRENGTH 1
#define PROPM_END_AMBIENTOCCLUSION 0
#define PROPM_START_LIGHTINGHSL 0
#define PROP_LIGHTINGENABLEHSL 0
#define PROP_LIGHTINGHSLINTENSITY 1
#define PROP_LIGHTINGSHADOWHUE 0.5
#define PROP_LIGHTINGSHADOWSATURATION 0.5
#define PROP_LIGHTINGSHADOWLIGHTNESS 0.5
#define PROPM_END_LIGHTINGHSL 0
#define PROPM_START_LIGHTINGADVANCED 1
#define PROP_LIGHTINGADDITIVEENABLE 1
#define PROP_LIGHTINGADDITIVETYPE 0
#define PROP_LIGHTINGADDITIVEGRADIENTSTART 0
#define PROP_LIGHTINGADDITIVEGRADIENTEND 0.5
#define PROP_LIGHTINGADDITIVEPASSTHROUGH 0.5
#define PROP_LIGHTINGADDITIVEDETAILSTRENGTH 1
#define PROP_LIGHTINGADDITIVELIMITINTENSITY 0
#define PROP_LIGHTINGADDITIVEMAXINTENSITY 1
#define PROP_DISABLEDIRECTIONALINADD 1
#define PROPM_END_LIGHTINGADVANCED 0
#define PROPM_END_LIGHTING 0
#define PROPM_START_SUBSURFACE 0
#define PROP_ENABLESSS 0
#define PROP_SSSTHICKNESSMAPUV 0
#define PROP_SSSTHICKNESSMOD 0
#define PROP_SSSSCALE 0.25
#define PROP_SSSPOWER 5
#define PROP_SSSDISTORTION 1
#define PROPM_END_SUBSURFACE 0
#define PROPM_START_RIMLIGHTOPTIONS 0
#define PROP_ENABLERIMLIGHTING 0
#define PROP_RIMLIGHTNORMAL 1
#define PROP_RIMLIGHTINGINVERT 0
#define PROP_RIMWIDTH 0.8
#define PROP_RIMSHARPNESS 0.25
#define PROP_RIMSTRENGTH 0
#define PROP_RIMBRIGHTEN 0
#define PROP_RIMLIGHTCOLORBIAS 1
#define PROP_RIMTEXUV 0
#define PROP_RIMMASKUV 0
#define PROPM_START_RIMHUESHIFT 0
#define PROP_RIMHUESHIFTENABLED 0
#define PROP_RIMHUESHIFTSPEED 0
#define PROP_RIMHUESHIFT 0
#define PROPM_END_RIMHUESHIFT 0
#define PROPM_START_RIMWIDTHNOISE 0
#define PROP_RIMWIDTHNOISETEXTUREUV 0
#define PROP_RIMWIDTHNOISESTRENGTH 0.1
#define PROPM_END_RIMWIDTHNOISE 0
#define PROPM_START_SHADOWMIX 0
#define PROP_SHADOWMIX 0
#define PROP_SHADOWMIXTHRESHOLD 0.5
#define PROP_SHADOWMIXWIDTHMOD 0.5
#define PROPM_END_SHADOWMIX 0
#define PROPM_START_RIMAUDIOLINK 0
#define PROP_AUDIOLINKRIMWIDTHBAND 0
#define PROP_AUDIOLINKRIMEMISSIONBAND 0
#define PROP_AUDIOLINKRIMBRIGHTNESSBAND 0
#define PROPM_END_RIMAUDIOLINK 0
#define PROPM_END_RIMLIGHTOPTIONS 0
#define PROPM_START_REFLECTIONRIM 0
#define PROP_ENABLEENVIRONMENTALRIM 0
#define PROP_RIMENVIROMASKUV 0
#define PROP_RIMENVIROBLUR 0.7
#define PROP_RIMENVIROWIDTH 0.45
#define PROP_RIMENVIROSHARPNESS 0
#define PROP_RIMENVIROMINBRIGHTNESS 0
#define PROP_RIMENVIROINTENSITY 1
#define PROPM_END_REFLECTIONRIM 0
#define PROPM_START_BAKEDLIGHTING 0
#define PROP_SPECULARLMOCCLUSION 0
#define PROP_SPECLMOCCLUSIONADJUST 0.2
#define PROP_GIEMISSIONMULTIPLIER 1
#define PROPDSGI 0
#define PROPLIGHTMAPFLAGS 0
#define PROPM_END_BAKEDLIGHTING 0
#define PROP_LOCKTOOLTIP 0
#define PROPM_START_BRDF 0
#define PROP_ENABLEBRDF 0
#define PROP_BRDFMETALLICGLOSSMAPTOOLTIP 0
#define PROP_BRDFINVERTGLOSSINESS 0
#define PROP_BRDFMETALLICGLOSSMAPUV 0
#define PROP_BRDFSPECULARMAPTOOLTIP 0
#define PROP_BRDFSPECULARMAPUV 0
#define PROP_BRDFMETALLICMAPTOOLTIP 0
#define PROP_BRDFMETALLICMAPUV 0
#define PROP_BRDFMETALLIC 0
#define PROP_BRDFGLOSSINESS 0
#define PROP_BRDFREFLECTANCE 0.5
#define PROP_BRDFANISOTROPY 0
#define PROP_BRDFMETALLICSPECIGNORESBASECOLOR 0
#define PROP_BRDFREFLECTIONSENABLED 1
#define PROP_BRDFSPECULARENABLED 1
#define PROP_BRDFFALLBACK
#define PROP_BRDFFORCEFALLBACK 0
#define PROPM_END_BRDF 0
#define PROPM_START_METALLIC 0
#define PROP_ENABLEMETALLIC 0
#define PROP_CUBEMAP
#define PROP_SAMPLEWORLD 0
#define PROP_METALLICTINTMAPUV 0
#define PROP_METALLICMASKUV 0
#define PROP_METALLIC 0
#define PROP_SMOOTHNESSMASKUV 0
#define PROP_INVERTSMOOTHNESS 0
#define PROP_SMOOTHNESS 0
#define PROPM_END_METALLIC 0
#define PROPM_START_CLEARCOAT 0
#define PROP_ENABLECLEARCOAT 0
#define PROP_CLEARCOATHELPBOX 0
#define PROP_CLEARCOATMAPUV 0
#define PROP_CLEARCOATINVERTSMOOTHNESS 0
#define PROP_CLEARCOAT 1
#define PROP_CLEARCOATGLOSSINESS 0
#define PROP_CLEARCOATANISOTROPY 0
#define PROP_CLEARCOATENABLEREFLECTIONS 1
#define PROP_CLEARCOATENABLESPECULAR 1
#define PROP_CLEARCOATFORCEFALLBACK 0
#define PROPM_END_CLEARCOAT 0
#define PROPM_START_MATCAP 0
#define PROP_MATCAPENABLE 0
#define PROP_MATCAPBORDER 0.43
#define PROP_MATCAPMASKUV 0
#define PROP_MATCAPMASKINVERT 0
#define PROP_MATCAPEMISSIONSTRENGTH 0
#define PROP_MATCAPINTENSITY 1
#define PROP_MATCAPLIGHTMASK 0
#define PROP_MATCAPREPLACE 1
#define PROP_MATCAPMULTIPLY 0
#define PROP_MATCAPADD 0
#define PROP_MATCAPNORMAL 1
#define PROPM_START_MATCAPHUESHIFT 0
#define PROP_MATCAPHUESHIFTENABLED 0
#define PROP_MATCAPHUESHIFTSPEED 0
#define PROP_MATCAPHUESHIFT 0
#define PROPM_END_MATCAPHUESHIFT 0
#define PROPM_END_MATCAP 0
#define PROPM_START_MATCAP2 0
#define PROP_MATCAP2ENABLE 0
#define PROP_MATCAP2BORDER 0.43
#define PROP_MATCAP2MASKUV 0
#define PROP_MATCAP2MASKINVERT 0
#define PROP_MATCAP2EMISSIONSTRENGTH 0
#define PROP_MATCAP2INTENSITY 1
#define PROP_MATCAP2LIGHTMASK 0
#define PROP_MATCAP2REPLACE 0
#define PROP_MATCAP2MULTIPLY 0
#define PROP_MATCAP2ADD 0
#define PROP_MATCAP2NORMAL 1
#define PROPM_START_MATCAP2HUESHIFT 0
#define PROP_MATCAP2HUESHIFTENABLED 0
#define PROP_MATCAP2HUESHIFTSPEED 0
#define PROP_MATCAP2HUESHIFT 0
#define PROPM_END_MATCAP2HUESHIFT 0
#define PROPM_END_MATCAP2 0
#define PROPM_START_SPECULAR 0
#define PROP_ENABLESPECULAR 0
#define PROP_SPECULARTYPE 1
#define PROP_SPECULARNORMAL 1
#define PROP_SPECULARMETALLIC 0
#define PROP_SPECULARMAXBRIGHTNESS 0
#define PROP_SPECULARMETALLICMAPUV 0
#define PROP_SPECULARSMOOTHNESS 1
#define PROP_SPECULARMAPUV 0
#define PROP_SPECULARINVERTSMOOTHNESS 0
#define PROP_SPECULARMASKUV 0
#define PROP_SMOOTHNESSFROM 1
#define PROP_SPECWHATTANGENT 0
#define PROP_ANISOSPEC1ALPHA 1
#define PROP_ANISOSPEC2ALPHA 1
#define PROP_SPEC1OFFSET 0
#define PROP_SPEC2SMOOTHNESS 0
#define PROP_ANISOUSETANGENTMAP 0
#define PROP_ANISOTANGENTMAPUV 0
#define PROP_SPECULARTOONSTART 0.95
#define PROP_SPECULARTOONEND 1
#define PROP_SPECULARANISOJITTERMIRRORED 0
#define PROP_SPECULARANISOJITTERMICROMULTIPLIER 0
#define PROP_SPECULARANISOJITTERMICROUV 0
#define PROP_SPECULARANISOJITTERMACROMULTIPLIER 0
#define PROP_SPECULARANISOJITTERMACROUV 0
#define PROPM_END_SPECULAR 0
#define PROPM_START_SPECULAR1 0
#define PROP_ENABLESPECULAR1 0
#define PROP_SPECULARTYPE1 1
#define PROP_SPECULARNORMAL1 1
#define PROP_SPECULARMETALLIC1 0
#define PROP_SPECULARMAXBRIGHTNESS1 0
#define PROP_SPECULARMETALLICMAP1UV 0
#define PROP_SPECULARSMOOTHNESS1 0.75
#define PROP_SPECULARMAP1UV 0
#define PROP_SPECULARINVERTSMOOTHNESS1 0
#define PROP_SPECULARMASK1UV 0
#define PROP_SMOOTHNESSFROM1 1
#define PROP_SPECWHATTANGENT1 0
#define PROP_ANISOSPEC1ALPHA1 1
#define PROP_ANISOSPEC2ALPHA1 1
#define PROP_SPEC1OFFSET1 0
#define PROP_SPEC2SMOOTHNESS1 0
#define PROP_ANISOUSETANGENTMAP1 0
#define PROP_ANISOTANGENTMAP1UV 0
#define PROP_SPECULARTOONSTART1 0.95
#define PROP_SPECULARTOONEND1 1
#define PROP_SPECULARANISOJITTERMIRRORED1 0
#define PROP_SPECULARANISOJITTERMICROMULTIPLIER1 0
#define PROP_SPECULARANISOJITTERMICRO1UV 0
#define PROP_SPECULARANISOJITTERMACROMULTIPLIER1 0
#define PROP_SPECULARANISOJITTERMACRO1UV 0
#define PROPM_END_SPECULAR1 0
#define PROPM_SPECIAL_EFFECTS 1
#define PROPM_START_EMISSIONOPTIONS 1
#define PROP_ENABLEEMISSION 1
#define PROP_EMISSIONREPLACE 0
#define PROP_EMISSIONBASECOLORASMAP 0
#define PROP_EMISSIONMAPUV 0
#define PROP_EMISSIONMASKUV 0
#define PROP_EMISSIONSTRENGTH 2
#define PROP_EMISSIONHUESHIFTENABLED 0
#define PROP_EMISSIONHUESHIFT 0
#define PROP_EMISSIONHUESHIFTSPEED 5
#define PROPM_START_CENTEROUTEMISSION 1
#define PROP_EMISSIONCENTEROUTENABLED 0
#define PROP_EMISSIONCENTEROUTSPEED 5
#define PROPM_END_CENTEROUTEMISSION 0
#define PROPM_START_GLOWINDARKEMISSIONOPTIONS 0
#define PROP_ENABLEGITDEMISSION 0
#define PROP_GITDEWORLDORMESH 0
#define PROP_GITDEMINEMISSIONMULTIPLIER 1
#define PROP_GITDEMAXEMISSIONMULTIPLIER 0
#define PROP_GITDEMINLIGHT 0
#define PROP_GITDEMAXLIGHT 1
#define PROPM_END_GLOWINDARKEMISSIONOPTIONS 0
#define PROPM_START_BLINKINGEMISSIONOPTIONS 0
#define PROP_EMISSIONBLINKINGENABLED 0
#define PROP_EMISSIVEBLINK_MIN 0
#define PROP_EMISSIVEBLINK_MAX 1
#define PROP_EMISSIVEBLINK_VELOCITY 4
#define PROP_EMISSIONBLINKINGOFFSET 0
#define PROPM_END_BLINKINGEMISSIONOPTIONS 0
#define PROPM_START_SCROLLINGEMISSIONOPTIONS 0
#define PROP_SCROLLINGEMISSION 0
#define PROP_EMISSIONSCROLLINGUSECURVE 0
#define PROP_EMISSIONSCROLLINGVERTEXCOLOR 0
#define PROP_EMISSIVESCROLL_WIDTH 10
#define PROP_EMISSIVESCROLL_VELOCITY 10
#define PROP_EMISSIVESCROLL_INTERVAL 20
#define PROP_EMISSIONSCROLLINGOFFSET 0
#define PROPM_END_SCROLLINGEMISSIONOPTIONS 0
#define PROPM_START_EMISSIONAUDIOLINK 0
#define PROP_ENABLEEMISSIONSTRENGTHAUDIOLINK 0
#define PROP_AUDIOLINKEMISSIONSTRENGTHBAND 0
#define PROP_ENABLEEMISSIONCENTEROUTAUDIOLINK 0
#define PROP_EMISSIONCENTEROUTAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSIONCENTEROUTBAND 0
#define PROP_EMISSIONCENTEROUTADDAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSIONCENTEROUTADDBAND 0
#define PROP_AUDIOLINKADDEMISSIONBAND 0
#define PROPM_END_EMISSIONAUDIOLINK 0
#define PROPM_END_EMISSIONOPTIONS 0
#define PROPM_START_EMISSION1OPTIONS 0
#define PROP_ENABLEEMISSION1 0
#define PROP_EMISSIONBASECOLORASMAP1 0
#define PROP_EMISSIONMAP1UV 0
#define PROP_EMISSIONMASK1UV 0
#define PROP_EMISSIONSTRENGTH1 0
#define PROP_EMISSIONHUESHIFTENABLED1 0
#define PROP_EMISSIONHUESHIFT1 0
#define PROP_EMISSIONHUESHIFTSPEED1 0
#define PROPM_START_CENTEROUTEMISSION1 0
#define PROP_EMISSIONCENTEROUTENABLED1 0
#define PROP_EMISSIONCENTEROUTSPEED1 5
#define PROPM_END_CENTEROUTEMISSION1 0
#define PROPM_START_GLOWINDARKEMISSIONOPTIONS1 0
#define PROP_ENABLEGITDEMISSION1 0
#define PROP_GITDEWORLDORMESH1 0
#define PROP_GITDEMINEMISSIONMULTIPLIER1 1
#define PROP_GITDEMAXEMISSIONMULTIPLIER1 0
#define PROP_GITDEMINLIGHT1 0
#define PROP_GITDEMAXLIGHT1 1
#define PROPM_END_GLOWINDARKEMISSIONOPTIONS1 0
#define PROPM_START_BLINKINGEMISSIONOPTIONS1 0
#define PROP_EMISSIONBLINKINGENABLED1 0
#define PROP_EMISSIVEBLINK_MIN1 0
#define PROP_EMISSIVEBLINK_MAX1 1
#define PROP_EMISSIVEBLINK_VELOCITY1 4
#define PROP_EMISSIONBLINKINGOFFSET1 0
#define PROPM_END_BLINKINGEMISSIONOPTIONS1 0
#define PROPM_START_SCROLLINGEMISSIONOPTIONS1 0
#define PROP_SCROLLINGEMISSION1 0
#define PROP_EMISSIONSCROLLINGUSECURVE1 0
#define PROP_EMISSIONSCROLLINGVERTEXCOLOR1 0
#define PROP_EMISSIVESCROLL_WIDTH1 10
#define PROP_EMISSIVESCROLL_VELOCITY1 10
#define PROP_EMISSIVESCROLL_INTERVAL1 20
#define PROP_EMISSIONSCROLLINGOFFSET1 0
#define PROPM_END_SCROLLINGEMISSION1OPTIONS 0
#define PROPM_START_EMISSION1AUDIOLINK 0
#define PROP_ENABLEEMISSION1STRENGTHAUDIOLINK 0
#define PROP_AUDIOLINKEMISSION1STRENGTHBAND 0
#define PROP_ENABLEEMISSION1CENTEROUTAUDIOLINK 0
#define PROP_EMISSION1CENTEROUTAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSION1CENTEROUTBAND 0
#define PROP_EMISSION1CENTEROUTADDAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSION1CENTEROUTADDBAND 0
#define PROP_AUDIOLINKADDEMISSION1BAND 0
#define PROPM_END_EMISSION1AUDIOLINK 0
#define PROPM_END_EMISSION1OPTIONS 0
#define PROPM_START_PATHING 0
#define PROP_ENABLEPATHING 0
#define PROP_PATHINGMAPUV 0
#define PROP_PATHINGCOLORMAPUV 0
#define PROP_PATHTYPER 0
#define PROP_PATHTYPEG 0
#define PROP_PATHTYPEB 0
#define PROPM_START_PATHAUDIOLINK 0
#define PROP_AUDIOLINKPATHTIMEOFFSETBANDR 0
#define PROP_AUDIOLINKPATHTIMEOFFSETBANDG 0
#define PROP_AUDIOLINKPATHTIMEOFFSETBANDB 0
#define PROP_AUDIOLINKPATHEMISSIONADDBANDR 0
#define PROP_AUDIOLINKPATHEMISSIONADDBANDG 0
#define PROP_AUDIOLINKPATHEMISSIONADDBANDB 0
#define PROP_AUDIOLINKPATHWIDTHOFFSETBANDR 0
#define PROP_AUDIOLINKPATHWIDTHOFFSETBANDG 0
#define PROP_AUDIOLINKPATHWIDTHOFFSETBANDB 0
#define PROPM_END_PATHAUDIOLINK 0
#define PROPM_END_PATHING 0
#define PROPM_START_FLIPBOOK 0
#define PROP_ENABLEFLIPBOOK 0
#define PROP_FLIPBOOKALPHACONTROLSFINALALPHA 0
#define PROP_FLIPBOOKINTENSITYCONTROLSALPHA 0
#define PROP_FLIPBOOKCOLORREPLACES 0
#define PROP_FLIPBOOKTEXARRAYUV 0
#define PROP_FLIPBOOKMASKUV 0
#define PROP_FLIPBOOKTOTALFRAMES 1
#define PROP_FLIPBOOKFPS 30
#define PROP_FLIPBOOKTILED 0
#define PROP_FLIPBOOKEMISSIONSTRENGTH 0
#define PROP_FLIPBOOKROTATION 0
#define PROP_FLIPBOOKROTATIONSPEED 0
#define PROP_FLIPBOOKREPLACE 1
#define PROP_FLIPBOOKMULTIPLY 0
#define PROP_FLIPBOOKADD 0
#define PROPM_START_FLIPBOOKAUDIOLINK 0
#define PROP_AUDIOLINKFLIPBOOKSCALEBAND 0
#define PROP_AUDIOLINKFLIPBOOKALPHABAND 0
#define PROP_AUDIOLINKFLIPBOOKEMISSIONBAND 0
#define PROP_AUDIOLINKFLIPBOOKFRAMEBAND 0
#define PROPM_END_FLIPBOOKAUDIOLINK 0
#define PROPM_START_MANUALFLIPBOOKCONTROL 0
#define PROP_FLIPBOOKCURRENTFRAME -1
#define PROPM_END_MANUALFLIPBOOKCONTROL 0
#define PROPM_START_CROSSFADE 0
#define PROP_FLIPBOOKCROSSFADEENABLED 0
#define PROPM_END_CROSSFADE 0
#define PROPM_START_FLIPBOOKHUESHIFT 0
#define PROP_FLIPBOOKHUESHIFTENABLED 0
#define PROP_FLIPBOOKHUESHIFTSPEED 0
#define PROP_FLIPBOOKHUESHIFT 0
#define PROPM_END_FLIPBOOKHUESHIFT 0
#define PROPM_END_FLIPBOOK 0
#define PROPM_START_DISSOLVE 0
#define PROP_ENABLEDISSOLVE 0
#define PROP_DISSOLVETYPE 1
#define PROP_DISSOLVEEDGEWIDTH 0.025
#define PROP_DISSOLVEEDGEHARDNESS 0.5
#define PROP_DISSOLVEEDGEEMISSION 0
#define PROP_DISSOLVETOTEXTUREUV 0
#define PROP_DISSOLVETOEMISSIONSTRENGTH 0
#define PROP_DISSOLVENOISETEXTUREUV 0
#define PROP_DISSOLVEINVERTNOISE 0
#define PROP_DISSOLVEDETAILNOISEUV 0
#define PROP_DISSOLVEINVERTDETAILNOISE 0
#define PROP_DISSOLVEDETAILSTRENGTH 0.1
#define PROP_DISSOLVEALPHA 0
#define PROP_DISSOLVEUSEVERTEXCOLORS 0
#define PROP_DISSOLVEMASKUV 0
#define PROP_DISSOLVEMASKINVERT 0
#define PROP_CONTINUOUSDISSOLVE 0
#define PROPM_START_DISSOLVEMASKING 0
#define PROP_DISSOLVEEMISSIONSIDE 2
#define PROP_DISSOLVEEMISSION1SIDE 2
#define PROPM_END_DISSOLVEMASKING 0
#define PROPM_START_POINTTOPOINT 0
#define PROP_DISSOLVEP2PWORLDLOCAL 0
#define PROP_DISSOLVEP2PEDGELENGTH 0.1
#define PROPM_END_POINTTOPOINT 0
#define PROPM_START_DISSOLVEHUESHIFT 0
#define PROP_DISSOLVEHUESHIFTENABLED 0
#define PROP_DISSOLVEHUESHIFTSPEED 0
#define PROP_DISSOLVEHUESHIFT 0
#define PROP_DISSOLVEEDGEHUESHIFTENABLED 0
#define PROP_DISSOLVEEDGEHUESHIFTSPEED 0
#define PROP_DISSOLVEEDGEHUESHIFT 0
#define PROPM_END_DISSOLVEHUESHIFT 0
#define PROPM_START_BONUSSLIDERS 0
#define PROP_DISSOLVEALPHA0 0
#define PROP_DISSOLVEALPHA1 0
#define PROP_DISSOLVEALPHA2 0
#define PROP_DISSOLVEALPHA3 0
#define PROP_DISSOLVEALPHA4 0
#define PROP_DISSOLVEALPHA5 0
#define PROP_DISSOLVEALPHA6 0
#define PROP_DISSOLVEALPHA7 0
#define PROP_DISSOLVEALPHA8 0
#define PROP_DISSOLVEALPHA9 0
#define PROPM_END_BONUSSLIDERS 0
#define PROPM_START_DISSOLVEAUDIOLINK 0
#define PROP_ENABLEDISSOLVEAUDIOLINK 0
#define PROP_AUDIOLINKDISSOLVEALPHABAND 0
#define PROP_AUDIOLINKDISSOLVEDETAILBAND 0
#define PROPM_END_DISSOLVEAUDIOLINK 0
#define PROPM_END_DISSOLVE 0
#define PROPM_START_PANOSPHEREOPTIONS 0
#define PROP_PANOTOGGLE 0
#define PROP_PANOINFINITESTEREOTOGGLE 0
#define PROP_PANOMASKUV 0
#define PROP_PANOEMISSION 0
#define PROP_PANOBLEND 0
#define PROP_PANOCUBEMAPTOGGLE 0
#define PROPM_END_PANOSPHEREOPTIONS 0
#define PROPM_START_GLITTER 0
#define PROP_GLITTERENABLE 0
#define PROP_GLITTERMODE 0
#define PROP_GLITTERSHAPE 0
#define PROP_GLITTERBLENDTYPE 0
#define PROP_GLITTERUSESURFACECOLOR 0
#define PROP_GLITTERCOLORMAPUV 0
#define PROP_GLITTERMASKUV 0
#define PROP_GLITTERTEXTUREROTATION 0
#define PROP_GLITTERFREQUENCY 300
#define PROP_GLITTERJITTER 1
#define PROP_GLITTERSPEED 10
#define PROP_GLITTERSIZE 0.3
#define PROP_GLITTERCONTRAST 300
#define PROP_GLITTERANGLERANGE 90
#define PROP_GLITTERMINBRIGHTNESS 0
#define PROP_GLITTERBRIGHTNESS 3
#define PROP_GLITTERBIAS 0.8
#define PROP_GLITTERHIDEINSHADOW 0
#define PROP_GLITTERCENTERSIZE 0.08
#define PROP_GLITTERFREQUENCYLINEAREMISSIVE 20
#define PROP_GLITTERJAGGYFIX 0
#define PROPM_START_GLITTERHUESHIFT 0
#define PROP_GLITTERHUESHIFTENABLED 0
#define PROP_GLITTERHUESHIFTSPEED 0
#define PROP_GLITTERHUESHIFT 0
#define PROPM_END_GLITTERHUESHIFT 0
#define PROPM_START_GLITTERRANDOM 0
#define PROP_GLITTERRANDOMCOLORS 0
#define PROP_GLITTERRANDOMSIZE 0
#define PROP_GLITTERRANDOMROTATION 0
#define PROPM_END_GLITTERRANDOM 0
#define PROPM_END_GLITTER 0
#define PROPM_START_TEXT 0
#define PROP_TEXTPIXELRANGE 4
#define PROP_TEXTENABLED 0
#define PROPM_START_TEXTFPS 0
#define PROP_TEXTFPSENABLED 0
#define PROP_TEXTFPSUV 0
#define PROP_TEXTFPSEMISSIONSTRENGTH 0
#define PROP_TEXTFPSROTATION 0
#define PROPM_END_TEXTFPS 0
#define PROPM_START_TEXTPOSITION 0
#define PROP_TEXTPOSITIONENABLED 0
#define PROP_TEXTPOSITIONUV 0
#define PROP_TEXTPOSITIONEMISSIONSTRENGTH 0
#define PROP_TEXTPOSITIONROTATION 0
#define PROPM_END_TEXTPOSITION 0
#define PROPM_START_TEXTINSTANCETIME 0
#define PROP_TEXTTIMEENABLED 0
#define PROP_TEXTTIMEUV 0
#define PROP_TEXTTIMEEMISSIONSTRENGTH 0
#define PROP_TEXTTIMEROTATION 0
#define PROPM_END_TEXTINSTANCETIME 0
#define PROPM_END_TEXT 0
#define PROPM_START_MIRROROPTIONS 0
#define PROP_ENABLEMIRROROPTIONS 0
#define PROP_MIRROR 0
#define PROP_ENABLEMIRRORTEXTURE 0
#define PROP_MIRRORTEXTUREUV 0
#define PROPM_END_MIRROROPTIONS 0
#define PROPM_START_DISTANCEFADE 0
#define PROP_MAINFADETEXTUREUV 0
#define PROP_MAINFADETYPE 1
#define PROP_MAINMINALPHA 0
#define PROP_MAINMAXALPHA 1
#define PROP_MAINDISTANCEFADEMIN 0
#define PROP_MAINDISTANCEFADEMAX 0
#define PROPM_END_DISTANCEFADE 0
#define PROPM_START_ANGULARFADE 0
#define PROP_ENABLERANDOM 0
#define PROP_ANGLETYPE 0
#define PROP_ANGLECOMPARETO 0
#define PROP_CAMERAANGLEMIN 45
#define PROP_CAMERAANGLEMAX 90
#define PROP_MODELANGLEMIN 45
#define PROP_MODELANGLEMAX 90
#define PROP_ANGLEMINALPHA 0
#define PROPM_END_ANGULARFADE 0
#define PROPM_START_DISTORTIONFLOW 0
#define PROP_ENABLEDISTORTION 0
#define PROP_DISTORTIONMASKUV 0
#define PROP_DISTORTIONSTRENGTH 0.5
#define PROP_DISTORTIONSTRENGTH1 0.5
#define PROPM_START_DISTORTIONAUDIOLINK 0
#define PROP_ENABLEDISTORTIONAUDIOLINK 0
#define PROP_DISTORTIONSTRENGTHAUDIOLINKBAND 0
#define PROP_DISTORTIONSTRENGTH1AUDIOLINKBAND 0
#define PROPM_END_DISTORTIONAUDIOLINK 0
#define PROPM_END_DISTORTIONFLOW 0
#define PROPM_START_AUDIOLINK 0
#define PROP_ENABLEAUDIOLINK 0
#define PROP_AUDIOLINKHELP 0
#define PROP_AUDIOLINKANIMTOGGLE 1
#define PROP_AUDIOLINKDELAY 0
#define PROP_AUDIOLINKAVERAGING 0
#define PROP_AUDIOLINKAVERAGERANGE 0.5
#define PROPM_START_AUDIOLINKDEBUG 0
#define PROP_ENABLEAUDIOLINKDEBUG 0
#define PROP_AUDIOLINKDEBUGTREBLE 0
#define PROP_AUDIOLINKDEBUGHIGHMID 0
#define PROP_AUDIOLINKDEBUGLOWMID 0
#define PROP_AUDIOLINKDEBUGBASS 0
#define PROP_AUDIOLINKDEBUGANIMATE 0
#define PROP_AUDIOLINKTEXTUREVISUALIZATION 0
#define PROPM_END_AUDIOLINKDEBUG 0
#define PROPM_END_AUDIOLINK 0
#define PROPM_PATREON 0
#define PROP_PATREONHELPBOX 0
#define PROPM_START_VIDEO 0
#define PROPM_START_VIDEOSETTINGS 0
#define PROPM_END_VIDEOSETTINGS 0
#define PROPM_START_VIDEODEBUG 0
#define PROPM_END_VIDEODEBUG 0
#define PROPM_START_CRT 0
#define PROPM_END_CRT 0
#define PROPM_START_GAMEBOY 0
#define PROPM_END_GAMEBOY 0
#define PROPM_END_VIDEO 0
#define PROPM_START_TOUCHOPTIONS 0
#define PROPM_START_BULGE 0
#define PROPM_END_BULGE 0
#define PROPM_START_TOUCHGLOW 0
#define PROPM_END_TOUCHGLOW 0
#define PROPM_END_TOUCHOPTIONS 0
#define PROPM_START_HOLOGRAM 0
#define PROPM_START_FRESNELALPHA 0
#define PROPM_END_FRESNELALPHA 0
#define PROPM_END_HOLOGRAM 0
#define PROPM_START_GRABPASS 0
#define PROPM_START_REFRACTION 0
#define PROPM_END_REFRACTION 0
#define PROPM_START_BLUR 0
#define PROPM_END_BLUR 0
#define PROPM_END_GRABPASS 0
#define PROPM_START_IRIDESCENCE 0
#define PROPM_END_IRIDESCENCE 0
#define PROPM_START_VERTEXGLITCH 0
#define PROPM_END_VERTEXGLITCH 0
#define PROPM_START_SPAWNS 0
#define PROPM_START_SCIFISPAWNIN 0
#define PROPM_END_SCIFISPAWNIN 0
#define PROPM_END_SPAWNS 0
#define PROPM_START_VORONOI 0
#define PROPM_START_VORONOIRANDOM 0
#define PROPM_END_VORONOIRANDOM 0
#define PROPM_END_VORONOI 0
#define PROPM_START_BLACKLIGHT 0
#define PROPM_END_BLACKLIGHT 0
#define PROPM_OUTLINEOPTIONS 0
#define PROP_COMMENTIFZERO_ENABLEOUTLINEPASS 0
#define PROP_OUTLINEMODE 0
#define PROP_OUTLINETINTMIX 0
#define PROP_OUTLINERIMLIGHTBLEND 0
#define PROP_OUTLINEFIXEDSIZE 0
#define PROP_OUTLINESMAXDISTANCE 9999
#define PROP_OUTLINEUSEVERTEXCOLORS 0
#define PROP_OUTLINELIT 1
#define PROP_LINEWIDTH 0
#define PROP_OUTLINEEMISSION 0
#define PROP_OUTLINETEXTUREUV 0
#define PROP_OUTLINEMASKUV 0
#define PROP_OUTLINESHADOWSTRENGTH 1
#define PROP_OUTLINEHUESHIFT 0
#define PROP_OUTLINEHUEOFFSET 0
#define PROP_OUTLINEHUEOFFSETSPEED 0
#define PROPM_START_OUTLINEADVANCED 0
#define PROP_OUTLINECULL 1
#define PROP_OUTLINEOFFSETFACTOR 0
#define PROP_OUTLINEOFFSETUNITS 0
#define PROPM_END_OUTLINEADVANCED 0
#define PROPM_PARALLAXMAP 0
#define PROP_PARALLAXMAP 0
#define PROP_PARALLAXHEIGHTMAPENABLED 0
#define PROP_PARALLAXINTERNALMAPENABLED 0
#define PROPM_START_PARALLAXHEIGHTMAP 0
#define PROP_PARALLAXUV 0
#define PROP_PARALLAXHEIGHTMAPMASKUV 0
#define PROP_PARALLAXSTRENGTH 0
#define PROPM_END_PARALLAXHEIGHTMAP 0
#define PROPM_START_PARALLAXINTERNAL 0
#define PROP_PARALLAXINTERNALHEIGHTMAPMODE 0
#define PROP_PARALLAXINTERNALHEIGHTFROMALPHA 0
#define PROP_PARALLAXINTERNALMAPMASKUV 0
#define PROP_PARALLAXINTERNALITERATIONS 1
#define PROP_PARALLAXINTERNALMINDEPTH 0
#define PROP_PARALLAXINTERNALMAXDEPTH 1
#define PROP_PARALLAXINTERNALMINFADE 0
#define PROP_PARALLAXINTERNALMAXFADE 1
#define PROPM_END_PARALLAXINTERNAL 0
#define PROPM_START_PARALLAXADVANCED 0
#define PROP_PARALLAXBIAS 0.42
#define PROPM_END_PARALLAXADVANCED 0
#define PROPM_POSTPROCESSING 0
#define PROP_PPHELP 0
#define PROP_PPLIGHTINGMULTIPLIER 1
#define PROP_PPEMISSIONMULTIPLIER 1
#define PROPM_RENDERINGOPTIONS 0
#define PROP_CULL 2
#define PROP_ZTEST 4
#define PROP_ZWRITE 1
#define PROP_COLORMASK 15
#define PROP_OFFSETFACTOR 0
#define PROP_OFFSETUNITS 0
#define PROP_IGNOREFOG 0
#define PROPINSTANCING 0
#define PROPM_START_BLENDING 0
#define PROP_BLENDOP 0
#define PROP_BLENDOPALPHA 0
#define PROP_SRCBLEND 1
#define PROP_DSTBLEND 0
#define PROPM_END_BLENDING 0
#define PROPM_START_STENCILPASSOPTIONS 0
#define PROP_STENCILREF 0
#define PROP_STENCILREADMASK 255
#define PROP_STENCILWRITEMASK 255
#define PROP_STENCILPASSOP 0
#define PROP_STENCILFAILOP 0
#define PROP_STENCILZFAILOP 0
#define PROP_STENCILCOMPAREFUNCTION 8
#define PROPM_END_STENCILPASSOPTIONS 0
#define PROPM_START_OUTLINESTENCIL 0
#define PROP_OUTLINESTENCILREF 0
#define PROP_OUTLINESTENCILREADMASK 255
#define PROP_OUTLINESTENCILWRITEMASK 255
#define PROP_OUTLINESTENCILPASSOP 0
#define PROP_OUTLINESTENCILFAILOP 0
#define PROP_OUTLINESTENCILZFAILOP 0
#define PROP_OUTLINESTENCILCOMPAREFUNCTION 8
#define PROPM_END_OUTLINESTENCIL 0
#define PROPM_START_DEBUGOPTIONS 0
#define PROP_DEBUGENABLED 0
#define PROP_VERTEXUNWRAP 0
#define PROP_DEBUGMESHDATA 0
#define PROP_DEBUGLIGHTINGDATA 0
#define PROP_DEBUGCAMERADATA 0
#define PROPM_END_DEBUGOPTIONS 0

            #pragma target 5.0
            #define FORWARD_BASE_PASS
            float _Mode;
            #pragma multi_compile _ VERTEXLIGHT_ON
            #pragma multi_compile_instancing
            #pragma multi_compile_fwdbase
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_fog
            #pragma vertex vert
            #pragma fragment frag
            #include "../Includes/CGI_PoiPass.cginc"
            ENDCG
        }
        Pass
        {
            Name "ForwardAddPass"
            Tags { "LightMode" = "ForwardAdd" }
            Stencil
            {
                Ref [_StencilRef]
                Comp [_StencilCompareFunction]
                Pass [_StencilPassOp]
                Fail [_StencilFailOp]
                ZFail [_StencilZFailOp]
            }
            ZWrite Off
            BlendOp [_BlendOp], [_BlendOpAlpha]
            Blend One One
            Cull [_Cull]
            ZTest [_ZTest]
            ColorMask [_ColorMask]
            Offset [_OffsetFactor], [_OffsetUnits]
            CGPROGRAM
#define OPTIMIZER_ENABLED
#define VIGNETTE_MASKED
#define _EMISSION
#define _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
#define PROPSHADER_IS_USING_THRY_EDITOR 69
#define PROPSHADER_MASTER_LABEL 0
#define PROPSHADER_PRESETS 0
#define PROPSHADER_PROPERTIES_LABEL_FILE 0
#define PROPFOOTER_YOUTUBE 0
#define PROPFOOTER_TWITTER 0
#define PROPFOOTER_PATREON 0
#define PROPFOOTER_DISCORD 0
#define PROPFOOTER_GITHUB 0
#define PROP_FORGOTTOLOCKMATERIAL 1
#define PROP_SHADEROPTIMIZERENABLED 0
#define PROP_LOCKTOOLTIP 0
#define PROP_MODE 0
#define PROPM_MAINOPTIONS 1
#define PROP_MAINTEXTUREUV 0
#define PROP_MAINEMISSIONSTRENGTH 0
#define PROP_BUMPMAPUV 0
#define PROP_BUMPSCALE 1
#define PROP_CLIPPINGMASKUV 0
#define PROP_INVERSE_CLIPPING 0
#define PROPM_START_MAINHUESHIFT 1
#define PROP_MAINCOLORADJUSTTEXTUREUV 0
#define PROP_MAINHUESHIFTREPLACE 1
#define PROP_MAINHUESHIFT 0
#define PROP_MAINHUESHIFTSPEED 1
#define PROP_SATURATION 0
#define PROP_MAINBRIGHTNESS 0
#define PROP_MAINHUESHIFTTOGGLE 0
#define PROPM_END_MAINHUESHIFT 0
#define PROPM_START_RGBMASK 0
#define PROP_RGBMASKENABLED 0
#define PROP_RGBUSEVERTEXCOLORS 0
#define PROP_RGBBLENDMULTIPLICATIVE 0
#define PROP_RGBMASKUV 0
#define PROP_RGBRED_UV 0
#define PROP_RGBGREEN_UV 0
#define PROP_RGBBLUE_UV 0
#define PROP_RGBALPHA_UV 0
#define PROP_RGBNORMALSENABLED 0
#define PROP_RGBNORMALBLEND 0
#define PROP_RGBNORMALRUV 0
#define PROP_RGBNORMALRSCALE 0
#define PROP_RGBNORMALGUV 0
#define PROP_RGBNORMALGSCALE 0
#define PROP_RGBNORMALBUV 0
#define PROP_RGBNORMALBSCALE 0
#define PROP_RGBNORMALAUV 0
#define PROP_RGBNORMALASCALE 0
#define PROPM_END_RGBMASK 0
#define PROPM_START_DETAILOPTIONS 0
#define PROP_DETAILENABLED 0
#define PROP_DETAILMASKUV 0
#define PROP_DETAILTEXUV 0
#define PROP_DETAILTEXINTENSITY 1
#define PROP_DETAILBRIGHTNESS 1
#define PROP_DETAILNORMALMAPSCALE 1
#define PROP_DETAILNORMALMAPUV 0
#define PROPM_END_DETAILOPTIONS 0
#define PROPM_START_MAINVERTEXCOLORS 0
#define PROP_MAINVERTEXCOLORINGLINEARSPACE 1
#define PROP_MAINVERTEXCOLORING 0
#define PROP_MAINUSEVERTEXCOLORALPHA 0
#define PROPM_END_MAINVERTEXCOLORS 0
#define PROPM_START_VERTEXMANIPULATION 0
#define PROP_VERTEXMANIPULATIONSENABLED 0
#define PROP_VERTEXMANIPULATIONHEIGHT 0
#define PROP_VERTEXMANIPULATIONHEIGHTUV 0
#define PROP_VERTEXMANIPULATIONHEIGHTBIAS 0
#define PROP_VERTEXROUNDINGENABLED 0
#define PROP_VERTEXROUNDINGDIVISION 500
#define PROPM_END_VERTEXMANIPULATION 0
#define PROPM_START_ALPHA 0
#define PROP_CUTOFF 0.5
#define PROP_DITHERINGENABLED 0
#define PROP_DITHERGRADIENT 0.1
#define PROP_FORCEOPAQUE 0
#define PROP_MAINSHADOWCLIPMOD 0
#define PROP_ALPHATOMASK 0
#define PROP_MAINALPHATOCOVERAGE 0
#define PROP_MAINMIPSCALE 0.25
#define PROP_ALPHAPREMULTIPLY 0
#define PROP_ALPHAMOD 0
#define PROPM_END_ALPHA 0
#define PROPM_START_DECALSECTION 0
#define PROP_DECALMASKUV 0
#define PROPM_START_DECAL0 0
#define PROP_DECALENABLED 0
#define PROP_DECALEMISSIONSTRENGTH 0
#define PROP_DECALTEXTUREUV 0
#define PROP_DECALTILED 0
#define PROP_DECAL0DEPTH 0
#define PROP_DECALROTATION 0
#define PROP_DECALROTATIONSPEED 0
#define PROP_DECALBLENDTYPE 0
#define PROP_DECALBLENDALPHA 1
#define PROP_DECALHUESHIFTENABLED 0
#define PROP_DECALHUESHIFTSPEED 0
#define PROP_DECALHUESHIFT 0
#define PROPM_START_DECAL0AUDIOLINK 0
#define PROP_AUDIOLINKDECAL0SCALEBAND 0
#define PROP_AUDIOLINKDECAL0ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL0ALPHABAND 0
#define PROP_AUDIOLINKDECAL0EMISSIONBAND 0
#define PROPM_END_DECAL0AUDIOLINK 0
#define PROPM_END_DECAL0 0
#define PROPM_START_DECAL1 0
#define PROP_DECALENABLED1 0
#define PROP_DECALEMISSIONSTRENGTH1 0
#define PROP_DECALTEXTURE1UV 0
#define PROP_DECALTILED1 0
#define PROP_DECAL1DEPTH 0
#define PROP_DECALROTATION1 0
#define PROP_DECALROTATIONSPEED1 0
#define PROP_DECALBLENDTYPE1 0
#define PROP_DECALBLENDALPHA1 1
#define PROP_DECALHUESHIFTENABLED1 0
#define PROP_DECALHUESHIFTSPEED1 0
#define PROP_DECALHUESHIFT1 0
#define PROPM_START_DECAL1AUDIOLINK 0
#define PROP_AUDIOLINKDECAL1SCALEBAND 0
#define PROP_AUDIOLINKDECAL1ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL1ALPHABAND 0
#define PROP_AUDIOLINKDECAL1EMISSIONBAND 0
#define PROPM_END_DECAL1AUDIOLINK 0
#define PROPM_END_DECAL1 0
#define PROPM_START_DECAL2 0
#define PROP_DECALENABLED2 0
#define PROP_DECALEMISSIONSTRENGTH2 0
#define PROP_DECALTEXTURE2UV 0
#define PROP_DECALTILED2 0
#define PROP_DECAL2DEPTH 0
#define PROP_DECALROTATION2 0
#define PROP_DECALROTATIONSPEED2 0
#define PROP_DECALBLENDTYPE2 0
#define PROP_DECALBLENDALPHA2 1
#define PROP_DECALHUESHIFTENABLED2 0
#define PROP_DECALHUESHIFTSPEED2 0
#define PROP_DECALHUESHIFT2 0
#define PROPM_START_DECAL2AUDIOLINK 0
#define PROP_AUDIOLINKDECAL2SCALEBAND 0
#define PROP_AUDIOLINKDECAL2ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL2ALPHABAND 0
#define PROP_AUDIOLINKDECAL2EMISSIONBAND 0
#define PROPM_END_DECAL2AUDIOLINK 0
#define PROPM_END_DECAL2 0
#define PROPM_START_DECAL3 0
#define PROP_DECALENABLED3 0
#define PROP_DECALEMISSIONSTRENGTH3 0
#define PROP_DECALTEXTURE3UV 0
#define PROP_DECALTILED3 0
#define PROP_DECAL3DEPTH 0
#define PROP_DECALROTATION3 0
#define PROP_DECALROTATIONSPEED3 0
#define PROP_DECALBLENDTYPE3 0
#define PROP_DECALBLENDALPHA3 1
#define PROP_DECALHUESHIFTENABLED3 0
#define PROP_DECALHUESHIFTSPEED3 0
#define PROP_DECALHUESHIFT3 0
#define PROPM_START_DECAL3AUDIOLINK 0
#define PROP_AUDIOLINKDECAL3SCALEBAND 0
#define PROP_AUDIOLINKDECAL3ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL3ALPHABAND 0
#define PROP_AUDIOLINKDECAL3EMISSIONBAND 0
#define PROPM_END_DECAL3AUDIOLINK 0
#define PROPM_END_DECAL3 0
#define PROPM_END_DECALSECTION 0
#define PROPM_START_BACKFACE 0
#define PROP_BACKFACEENABLED 0
#define PROP_BACKFACEREPLACEALPHA 0
#define PROP_BACKFACETEXTUREUV 0
#define PROP_BACKFACEDETAILINTENSITY 1
#define PROP_BACKFACEHUESHIFT 0
#define PROP_BACKFACEEMISSIONSTRENGTH 0
#define PROPM_END_BACKFACE 0
#define PROPM_LIGHTINGOPTIONS 1
#define PROPM_START_LIGHTING 1
#define PROP_ENABLELIGHTING 1
#define PROP_LIGHTINGMODE 1
#define PROP_LIGHTINGSTANDARDSMOOTHNESS 0
#define PROP_LIGHTINGWRAPPEDWRAP 0
#define PROP_LIGHTINGWRAPPEDNORMALIZATION 0
#define PROP_LIGHTINGRAMPTYPE 0
#define PROP_1ST_SHADEMAPUV 0
#define PROP_USE_1STSHADEMAPALPHA_AS_SHADOWMASK 0
#define PROP_1STSHADEMAPMASK_INVERSE 0
#define PROP_USE_BASEAS1ST 0
#define PROP_2ND_SHADEMAPUV 0
#define PROP_USE_2NDSHADEMAPALPHA_AS_SHADOWMASK 0
#define PROP_2NDSHADEMAPMASK_INVERSE 0
#define PROP_USE_1STAS2ND 0
#define PROP_BASECOLOR_STEP 0.5
#define PROP_BASESHADE_FEATHER 0.0001
#define PROP_SHADECOLOR_STEP 0
#define PROP_1ST2ND_SHADES_FEATHER 0.0001
#define PROP_TOONRAMP
#define PROP_LIGHTINGSHADOWMASKUV 0
#define PROP_SHADOWOFFSET 0
#define PROP_LIGHTINGGRADIENTSTART 0
#define PROP_LIGHTINGGRADIENTEND 0.5
#define PROP_SSSSCALE 1
#define PROP_SSSBUMPBLUR 0.7
#define PROP_SHADOWSTRENGTH 1
#define PROP_ATTENUATIONMULTIPLIER 0
#define PROP_LIGHTINGIGNOREAMBIENTCOLOR 0
#define PROPM_START_LIGHTINGMODIFIERS 0
#define PROP_LIGHTINGDIRECTCOLORMODE 0
#define PROP_LIGHTINGINDIRECTCOLORMODE 0
#define PROP_LIGHTINGUNCAPPED 0
#define PROP_LIGHTINGONLYUNITYSHADOWS 0
#define PROP_LIGHTINGMONOCHROMATIC 0
#define PROP_LIGHTINGMINLIGHTBRIGHTNESS 0
#define PROP_LIGHTINGMINSHADOWBRIGHTNESSRATIO 0
#define PROPM_END_LIGHTINGMODIFIERS 0
#define PROPM_START_DETAILSHADOWS 0
#define PROP_LIGHTINGDETAILSHADOWSENABLED 0
#define PROP_LIGHTINGDETAILSHADOWSUV 0
#define PROP_LIGHTINGDETAILSTRENGTH 1
#define PROPM_END_DETAILSHADOWS 0
#define PROPM_START_AMBIENTOCCLUSION 0
#define PROP_LIGHTINGENABLEAO 0
#define PROP_LIGHTINGAOTEXUV 0
#define PROP_AOSTRENGTH 1
#define PROPM_END_AMBIENTOCCLUSION 0
#define PROPM_START_LIGHTINGHSL 0
#define PROP_LIGHTINGENABLEHSL 0
#define PROP_LIGHTINGHSLINTENSITY 1
#define PROP_LIGHTINGSHADOWHUE 0.5
#define PROP_LIGHTINGSHADOWSATURATION 0.5
#define PROP_LIGHTINGSHADOWLIGHTNESS 0.5
#define PROPM_END_LIGHTINGHSL 0
#define PROPM_START_LIGHTINGADVANCED 1
#define PROP_LIGHTINGADDITIVEENABLE 1
#define PROP_LIGHTINGADDITIVETYPE 0
#define PROP_LIGHTINGADDITIVEGRADIENTSTART 0
#define PROP_LIGHTINGADDITIVEGRADIENTEND 0.5
#define PROP_LIGHTINGADDITIVEPASSTHROUGH 0.5
#define PROP_LIGHTINGADDITIVEDETAILSTRENGTH 1
#define PROP_LIGHTINGADDITIVELIMITINTENSITY 0
#define PROP_LIGHTINGADDITIVEMAXINTENSITY 1
#define PROP_DISABLEDIRECTIONALINADD 1
#define PROPM_END_LIGHTINGADVANCED 0
#define PROPM_END_LIGHTING 0
#define PROPM_START_SUBSURFACE 0
#define PROP_ENABLESSS 0
#define PROP_SSSTHICKNESSMAPUV 0
#define PROP_SSSTHICKNESSMOD 0
#define PROP_SSSSCALE 0.25
#define PROP_SSSPOWER 5
#define PROP_SSSDISTORTION 1
#define PROPM_END_SUBSURFACE 0
#define PROPM_START_RIMLIGHTOPTIONS 0
#define PROP_ENABLERIMLIGHTING 0
#define PROP_RIMLIGHTNORMAL 1
#define PROP_RIMLIGHTINGINVERT 0
#define PROP_RIMWIDTH 0.8
#define PROP_RIMSHARPNESS 0.25
#define PROP_RIMSTRENGTH 0
#define PROP_RIMBRIGHTEN 0
#define PROP_RIMLIGHTCOLORBIAS 1
#define PROP_RIMTEXUV 0
#define PROP_RIMMASKUV 0
#define PROPM_START_RIMHUESHIFT 0
#define PROP_RIMHUESHIFTENABLED 0
#define PROP_RIMHUESHIFTSPEED 0
#define PROP_RIMHUESHIFT 0
#define PROPM_END_RIMHUESHIFT 0
#define PROPM_START_RIMWIDTHNOISE 0
#define PROP_RIMWIDTHNOISETEXTUREUV 0
#define PROP_RIMWIDTHNOISESTRENGTH 0.1
#define PROPM_END_RIMWIDTHNOISE 0
#define PROPM_START_SHADOWMIX 0
#define PROP_SHADOWMIX 0
#define PROP_SHADOWMIXTHRESHOLD 0.5
#define PROP_SHADOWMIXWIDTHMOD 0.5
#define PROPM_END_SHADOWMIX 0
#define PROPM_START_RIMAUDIOLINK 0
#define PROP_AUDIOLINKRIMWIDTHBAND 0
#define PROP_AUDIOLINKRIMEMISSIONBAND 0
#define PROP_AUDIOLINKRIMBRIGHTNESSBAND 0
#define PROPM_END_RIMAUDIOLINK 0
#define PROPM_END_RIMLIGHTOPTIONS 0
#define PROPM_START_REFLECTIONRIM 0
#define PROP_ENABLEENVIRONMENTALRIM 0
#define PROP_RIMENVIROMASKUV 0
#define PROP_RIMENVIROBLUR 0.7
#define PROP_RIMENVIROWIDTH 0.45
#define PROP_RIMENVIROSHARPNESS 0
#define PROP_RIMENVIROMINBRIGHTNESS 0
#define PROP_RIMENVIROINTENSITY 1
#define PROPM_END_REFLECTIONRIM 0
#define PROPM_START_BAKEDLIGHTING 0
#define PROP_SPECULARLMOCCLUSION 0
#define PROP_SPECLMOCCLUSIONADJUST 0.2
#define PROP_GIEMISSIONMULTIPLIER 1
#define PROPDSGI 0
#define PROPLIGHTMAPFLAGS 0
#define PROPM_END_BAKEDLIGHTING 0
#define PROP_LOCKTOOLTIP 0
#define PROPM_START_BRDF 0
#define PROP_ENABLEBRDF 0
#define PROP_BRDFMETALLICGLOSSMAPTOOLTIP 0
#define PROP_BRDFINVERTGLOSSINESS 0
#define PROP_BRDFMETALLICGLOSSMAPUV 0
#define PROP_BRDFSPECULARMAPTOOLTIP 0
#define PROP_BRDFSPECULARMAPUV 0
#define PROP_BRDFMETALLICMAPTOOLTIP 0
#define PROP_BRDFMETALLICMAPUV 0
#define PROP_BRDFMETALLIC 0
#define PROP_BRDFGLOSSINESS 0
#define PROP_BRDFREFLECTANCE 0.5
#define PROP_BRDFANISOTROPY 0
#define PROP_BRDFMETALLICSPECIGNORESBASECOLOR 0
#define PROP_BRDFREFLECTIONSENABLED 1
#define PROP_BRDFSPECULARENABLED 1
#define PROP_BRDFFALLBACK
#define PROP_BRDFFORCEFALLBACK 0
#define PROPM_END_BRDF 0
#define PROPM_START_METALLIC 0
#define PROP_ENABLEMETALLIC 0
#define PROP_CUBEMAP
#define PROP_SAMPLEWORLD 0
#define PROP_METALLICTINTMAPUV 0
#define PROP_METALLICMASKUV 0
#define PROP_METALLIC 0
#define PROP_SMOOTHNESSMASKUV 0
#define PROP_INVERTSMOOTHNESS 0
#define PROP_SMOOTHNESS 0
#define PROPM_END_METALLIC 0
#define PROPM_START_CLEARCOAT 0
#define PROP_ENABLECLEARCOAT 0
#define PROP_CLEARCOATHELPBOX 0
#define PROP_CLEARCOATMAPUV 0
#define PROP_CLEARCOATINVERTSMOOTHNESS 0
#define PROP_CLEARCOAT 1
#define PROP_CLEARCOATGLOSSINESS 0
#define PROP_CLEARCOATANISOTROPY 0
#define PROP_CLEARCOATENABLEREFLECTIONS 1
#define PROP_CLEARCOATENABLESPECULAR 1
#define PROP_CLEARCOATFORCEFALLBACK 0
#define PROPM_END_CLEARCOAT 0
#define PROPM_START_MATCAP 0
#define PROP_MATCAPENABLE 0
#define PROP_MATCAPBORDER 0.43
#define PROP_MATCAPMASKUV 0
#define PROP_MATCAPMASKINVERT 0
#define PROP_MATCAPEMISSIONSTRENGTH 0
#define PROP_MATCAPINTENSITY 1
#define PROP_MATCAPLIGHTMASK 0
#define PROP_MATCAPREPLACE 1
#define PROP_MATCAPMULTIPLY 0
#define PROP_MATCAPADD 0
#define PROP_MATCAPNORMAL 1
#define PROPM_START_MATCAPHUESHIFT 0
#define PROP_MATCAPHUESHIFTENABLED 0
#define PROP_MATCAPHUESHIFTSPEED 0
#define PROP_MATCAPHUESHIFT 0
#define PROPM_END_MATCAPHUESHIFT 0
#define PROPM_END_MATCAP 0
#define PROPM_START_MATCAP2 0
#define PROP_MATCAP2ENABLE 0
#define PROP_MATCAP2BORDER 0.43
#define PROP_MATCAP2MASKUV 0
#define PROP_MATCAP2MASKINVERT 0
#define PROP_MATCAP2EMISSIONSTRENGTH 0
#define PROP_MATCAP2INTENSITY 1
#define PROP_MATCAP2LIGHTMASK 0
#define PROP_MATCAP2REPLACE 0
#define PROP_MATCAP2MULTIPLY 0
#define PROP_MATCAP2ADD 0
#define PROP_MATCAP2NORMAL 1
#define PROPM_START_MATCAP2HUESHIFT 0
#define PROP_MATCAP2HUESHIFTENABLED 0
#define PROP_MATCAP2HUESHIFTSPEED 0
#define PROP_MATCAP2HUESHIFT 0
#define PROPM_END_MATCAP2HUESHIFT 0
#define PROPM_END_MATCAP2 0
#define PROPM_START_SPECULAR 0
#define PROP_ENABLESPECULAR 0
#define PROP_SPECULARTYPE 1
#define PROP_SPECULARNORMAL 1
#define PROP_SPECULARMETALLIC 0
#define PROP_SPECULARMAXBRIGHTNESS 0
#define PROP_SPECULARMETALLICMAPUV 0
#define PROP_SPECULARSMOOTHNESS 1
#define PROP_SPECULARMAPUV 0
#define PROP_SPECULARINVERTSMOOTHNESS 0
#define PROP_SPECULARMASKUV 0
#define PROP_SMOOTHNESSFROM 1
#define PROP_SPECWHATTANGENT 0
#define PROP_ANISOSPEC1ALPHA 1
#define PROP_ANISOSPEC2ALPHA 1
#define PROP_SPEC1OFFSET 0
#define PROP_SPEC2SMOOTHNESS 0
#define PROP_ANISOUSETANGENTMAP 0
#define PROP_ANISOTANGENTMAPUV 0
#define PROP_SPECULARTOONSTART 0.95
#define PROP_SPECULARTOONEND 1
#define PROP_SPECULARANISOJITTERMIRRORED 0
#define PROP_SPECULARANISOJITTERMICROMULTIPLIER 0
#define PROP_SPECULARANISOJITTERMICROUV 0
#define PROP_SPECULARANISOJITTERMACROMULTIPLIER 0
#define PROP_SPECULARANISOJITTERMACROUV 0
#define PROPM_END_SPECULAR 0
#define PROPM_START_SPECULAR1 0
#define PROP_ENABLESPECULAR1 0
#define PROP_SPECULARTYPE1 1
#define PROP_SPECULARNORMAL1 1
#define PROP_SPECULARMETALLIC1 0
#define PROP_SPECULARMAXBRIGHTNESS1 0
#define PROP_SPECULARMETALLICMAP1UV 0
#define PROP_SPECULARSMOOTHNESS1 0.75
#define PROP_SPECULARMAP1UV 0
#define PROP_SPECULARINVERTSMOOTHNESS1 0
#define PROP_SPECULARMASK1UV 0
#define PROP_SMOOTHNESSFROM1 1
#define PROP_SPECWHATTANGENT1 0
#define PROP_ANISOSPEC1ALPHA1 1
#define PROP_ANISOSPEC2ALPHA1 1
#define PROP_SPEC1OFFSET1 0
#define PROP_SPEC2SMOOTHNESS1 0
#define PROP_ANISOUSETANGENTMAP1 0
#define PROP_ANISOTANGENTMAP1UV 0
#define PROP_SPECULARTOONSTART1 0.95
#define PROP_SPECULARTOONEND1 1
#define PROP_SPECULARANISOJITTERMIRRORED1 0
#define PROP_SPECULARANISOJITTERMICROMULTIPLIER1 0
#define PROP_SPECULARANISOJITTERMICRO1UV 0
#define PROP_SPECULARANISOJITTERMACROMULTIPLIER1 0
#define PROP_SPECULARANISOJITTERMACRO1UV 0
#define PROPM_END_SPECULAR1 0
#define PROPM_SPECIAL_EFFECTS 1
#define PROPM_START_EMISSIONOPTIONS 1
#define PROP_ENABLEEMISSION 1
#define PROP_EMISSIONREPLACE 0
#define PROP_EMISSIONBASECOLORASMAP 0
#define PROP_EMISSIONMAPUV 0
#define PROP_EMISSIONMASKUV 0
#define PROP_EMISSIONSTRENGTH 2
#define PROP_EMISSIONHUESHIFTENABLED 0
#define PROP_EMISSIONHUESHIFT 0
#define PROP_EMISSIONHUESHIFTSPEED 5
#define PROPM_START_CENTEROUTEMISSION 1
#define PROP_EMISSIONCENTEROUTENABLED 0
#define PROP_EMISSIONCENTEROUTSPEED 5
#define PROPM_END_CENTEROUTEMISSION 0
#define PROPM_START_GLOWINDARKEMISSIONOPTIONS 0
#define PROP_ENABLEGITDEMISSION 0
#define PROP_GITDEWORLDORMESH 0
#define PROP_GITDEMINEMISSIONMULTIPLIER 1
#define PROP_GITDEMAXEMISSIONMULTIPLIER 0
#define PROP_GITDEMINLIGHT 0
#define PROP_GITDEMAXLIGHT 1
#define PROPM_END_GLOWINDARKEMISSIONOPTIONS 0
#define PROPM_START_BLINKINGEMISSIONOPTIONS 0
#define PROP_EMISSIONBLINKINGENABLED 0
#define PROP_EMISSIVEBLINK_MIN 0
#define PROP_EMISSIVEBLINK_MAX 1
#define PROP_EMISSIVEBLINK_VELOCITY 4
#define PROP_EMISSIONBLINKINGOFFSET 0
#define PROPM_END_BLINKINGEMISSIONOPTIONS 0
#define PROPM_START_SCROLLINGEMISSIONOPTIONS 0
#define PROP_SCROLLINGEMISSION 0
#define PROP_EMISSIONSCROLLINGUSECURVE 0
#define PROP_EMISSIONSCROLLINGVERTEXCOLOR 0
#define PROP_EMISSIVESCROLL_WIDTH 10
#define PROP_EMISSIVESCROLL_VELOCITY 10
#define PROP_EMISSIVESCROLL_INTERVAL 20
#define PROP_EMISSIONSCROLLINGOFFSET 0
#define PROPM_END_SCROLLINGEMISSIONOPTIONS 0
#define PROPM_START_EMISSIONAUDIOLINK 0
#define PROP_ENABLEEMISSIONSTRENGTHAUDIOLINK 0
#define PROP_AUDIOLINKEMISSIONSTRENGTHBAND 0
#define PROP_ENABLEEMISSIONCENTEROUTAUDIOLINK 0
#define PROP_EMISSIONCENTEROUTAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSIONCENTEROUTBAND 0
#define PROP_EMISSIONCENTEROUTADDAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSIONCENTEROUTADDBAND 0
#define PROP_AUDIOLINKADDEMISSIONBAND 0
#define PROPM_END_EMISSIONAUDIOLINK 0
#define PROPM_END_EMISSIONOPTIONS 0
#define PROPM_START_EMISSION1OPTIONS 0
#define PROP_ENABLEEMISSION1 0
#define PROP_EMISSIONBASECOLORASMAP1 0
#define PROP_EMISSIONMAP1UV 0
#define PROP_EMISSIONMASK1UV 0
#define PROP_EMISSIONSTRENGTH1 0
#define PROP_EMISSIONHUESHIFTENABLED1 0
#define PROP_EMISSIONHUESHIFT1 0
#define PROP_EMISSIONHUESHIFTSPEED1 0
#define PROPM_START_CENTEROUTEMISSION1 0
#define PROP_EMISSIONCENTEROUTENABLED1 0
#define PROP_EMISSIONCENTEROUTSPEED1 5
#define PROPM_END_CENTEROUTEMISSION1 0
#define PROPM_START_GLOWINDARKEMISSIONOPTIONS1 0
#define PROP_ENABLEGITDEMISSION1 0
#define PROP_GITDEWORLDORMESH1 0
#define PROP_GITDEMINEMISSIONMULTIPLIER1 1
#define PROP_GITDEMAXEMISSIONMULTIPLIER1 0
#define PROP_GITDEMINLIGHT1 0
#define PROP_GITDEMAXLIGHT1 1
#define PROPM_END_GLOWINDARKEMISSIONOPTIONS1 0
#define PROPM_START_BLINKINGEMISSIONOPTIONS1 0
#define PROP_EMISSIONBLINKINGENABLED1 0
#define PROP_EMISSIVEBLINK_MIN1 0
#define PROP_EMISSIVEBLINK_MAX1 1
#define PROP_EMISSIVEBLINK_VELOCITY1 4
#define PROP_EMISSIONBLINKINGOFFSET1 0
#define PROPM_END_BLINKINGEMISSIONOPTIONS1 0
#define PROPM_START_SCROLLINGEMISSIONOPTIONS1 0
#define PROP_SCROLLINGEMISSION1 0
#define PROP_EMISSIONSCROLLINGUSECURVE1 0
#define PROP_EMISSIONSCROLLINGVERTEXCOLOR1 0
#define PROP_EMISSIVESCROLL_WIDTH1 10
#define PROP_EMISSIVESCROLL_VELOCITY1 10
#define PROP_EMISSIVESCROLL_INTERVAL1 20
#define PROP_EMISSIONSCROLLINGOFFSET1 0
#define PROPM_END_SCROLLINGEMISSION1OPTIONS 0
#define PROPM_START_EMISSION1AUDIOLINK 0
#define PROP_ENABLEEMISSION1STRENGTHAUDIOLINK 0
#define PROP_AUDIOLINKEMISSION1STRENGTHBAND 0
#define PROP_ENABLEEMISSION1CENTEROUTAUDIOLINK 0
#define PROP_EMISSION1CENTEROUTAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSION1CENTEROUTBAND 0
#define PROP_EMISSION1CENTEROUTADDAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSION1CENTEROUTADDBAND 0
#define PROP_AUDIOLINKADDEMISSION1BAND 0
#define PROPM_END_EMISSION1AUDIOLINK 0
#define PROPM_END_EMISSION1OPTIONS 0
#define PROPM_START_PATHING 0
#define PROP_ENABLEPATHING 0
#define PROP_PATHINGMAPUV 0
#define PROP_PATHINGCOLORMAPUV 0
#define PROP_PATHTYPER 0
#define PROP_PATHTYPEG 0
#define PROP_PATHTYPEB 0
#define PROPM_START_PATHAUDIOLINK 0
#define PROP_AUDIOLINKPATHTIMEOFFSETBANDR 0
#define PROP_AUDIOLINKPATHTIMEOFFSETBANDG 0
#define PROP_AUDIOLINKPATHTIMEOFFSETBANDB 0
#define PROP_AUDIOLINKPATHEMISSIONADDBANDR 0
#define PROP_AUDIOLINKPATHEMISSIONADDBANDG 0
#define PROP_AUDIOLINKPATHEMISSIONADDBANDB 0
#define PROP_AUDIOLINKPATHWIDTHOFFSETBANDR 0
#define PROP_AUDIOLINKPATHWIDTHOFFSETBANDG 0
#define PROP_AUDIOLINKPATHWIDTHOFFSETBANDB 0
#define PROPM_END_PATHAUDIOLINK 0
#define PROPM_END_PATHING 0
#define PROPM_START_FLIPBOOK 0
#define PROP_ENABLEFLIPBOOK 0
#define PROP_FLIPBOOKALPHACONTROLSFINALALPHA 0
#define PROP_FLIPBOOKINTENSITYCONTROLSALPHA 0
#define PROP_FLIPBOOKCOLORREPLACES 0
#define PROP_FLIPBOOKTEXARRAYUV 0
#define PROP_FLIPBOOKMASKUV 0
#define PROP_FLIPBOOKTOTALFRAMES 1
#define PROP_FLIPBOOKFPS 30
#define PROP_FLIPBOOKTILED 0
#define PROP_FLIPBOOKEMISSIONSTRENGTH 0
#define PROP_FLIPBOOKROTATION 0
#define PROP_FLIPBOOKROTATIONSPEED 0
#define PROP_FLIPBOOKREPLACE 1
#define PROP_FLIPBOOKMULTIPLY 0
#define PROP_FLIPBOOKADD 0
#define PROPM_START_FLIPBOOKAUDIOLINK 0
#define PROP_AUDIOLINKFLIPBOOKSCALEBAND 0
#define PROP_AUDIOLINKFLIPBOOKALPHABAND 0
#define PROP_AUDIOLINKFLIPBOOKEMISSIONBAND 0
#define PROP_AUDIOLINKFLIPBOOKFRAMEBAND 0
#define PROPM_END_FLIPBOOKAUDIOLINK 0
#define PROPM_START_MANUALFLIPBOOKCONTROL 0
#define PROP_FLIPBOOKCURRENTFRAME -1
#define PROPM_END_MANUALFLIPBOOKCONTROL 0
#define PROPM_START_CROSSFADE 0
#define PROP_FLIPBOOKCROSSFADEENABLED 0
#define PROPM_END_CROSSFADE 0
#define PROPM_START_FLIPBOOKHUESHIFT 0
#define PROP_FLIPBOOKHUESHIFTENABLED 0
#define PROP_FLIPBOOKHUESHIFTSPEED 0
#define PROP_FLIPBOOKHUESHIFT 0
#define PROPM_END_FLIPBOOKHUESHIFT 0
#define PROPM_END_FLIPBOOK 0
#define PROPM_START_DISSOLVE 0
#define PROP_ENABLEDISSOLVE 0
#define PROP_DISSOLVETYPE 1
#define PROP_DISSOLVEEDGEWIDTH 0.025
#define PROP_DISSOLVEEDGEHARDNESS 0.5
#define PROP_DISSOLVEEDGEEMISSION 0
#define PROP_DISSOLVETOTEXTUREUV 0
#define PROP_DISSOLVETOEMISSIONSTRENGTH 0
#define PROP_DISSOLVENOISETEXTUREUV 0
#define PROP_DISSOLVEINVERTNOISE 0
#define PROP_DISSOLVEDETAILNOISEUV 0
#define PROP_DISSOLVEINVERTDETAILNOISE 0
#define PROP_DISSOLVEDETAILSTRENGTH 0.1
#define PROP_DISSOLVEALPHA 0
#define PROP_DISSOLVEUSEVERTEXCOLORS 0
#define PROP_DISSOLVEMASKUV 0
#define PROP_DISSOLVEMASKINVERT 0
#define PROP_CONTINUOUSDISSOLVE 0
#define PROPM_START_DISSOLVEMASKING 0
#define PROP_DISSOLVEEMISSIONSIDE 2
#define PROP_DISSOLVEEMISSION1SIDE 2
#define PROPM_END_DISSOLVEMASKING 0
#define PROPM_START_POINTTOPOINT 0
#define PROP_DISSOLVEP2PWORLDLOCAL 0
#define PROP_DISSOLVEP2PEDGELENGTH 0.1
#define PROPM_END_POINTTOPOINT 0
#define PROPM_START_DISSOLVEHUESHIFT 0
#define PROP_DISSOLVEHUESHIFTENABLED 0
#define PROP_DISSOLVEHUESHIFTSPEED 0
#define PROP_DISSOLVEHUESHIFT 0
#define PROP_DISSOLVEEDGEHUESHIFTENABLED 0
#define PROP_DISSOLVEEDGEHUESHIFTSPEED 0
#define PROP_DISSOLVEEDGEHUESHIFT 0
#define PROPM_END_DISSOLVEHUESHIFT 0
#define PROPM_START_BONUSSLIDERS 0
#define PROP_DISSOLVEALPHA0 0
#define PROP_DISSOLVEALPHA1 0
#define PROP_DISSOLVEALPHA2 0
#define PROP_DISSOLVEALPHA3 0
#define PROP_DISSOLVEALPHA4 0
#define PROP_DISSOLVEALPHA5 0
#define PROP_DISSOLVEALPHA6 0
#define PROP_DISSOLVEALPHA7 0
#define PROP_DISSOLVEALPHA8 0
#define PROP_DISSOLVEALPHA9 0
#define PROPM_END_BONUSSLIDERS 0
#define PROPM_START_DISSOLVEAUDIOLINK 0
#define PROP_ENABLEDISSOLVEAUDIOLINK 0
#define PROP_AUDIOLINKDISSOLVEALPHABAND 0
#define PROP_AUDIOLINKDISSOLVEDETAILBAND 0
#define PROPM_END_DISSOLVEAUDIOLINK 0
#define PROPM_END_DISSOLVE 0
#define PROPM_START_PANOSPHEREOPTIONS 0
#define PROP_PANOTOGGLE 0
#define PROP_PANOINFINITESTEREOTOGGLE 0
#define PROP_PANOMASKUV 0
#define PROP_PANOEMISSION 0
#define PROP_PANOBLEND 0
#define PROP_PANOCUBEMAPTOGGLE 0
#define PROPM_END_PANOSPHEREOPTIONS 0
#define PROPM_START_GLITTER 0
#define PROP_GLITTERENABLE 0
#define PROP_GLITTERMODE 0
#define PROP_GLITTERSHAPE 0
#define PROP_GLITTERBLENDTYPE 0
#define PROP_GLITTERUSESURFACECOLOR 0
#define PROP_GLITTERCOLORMAPUV 0
#define PROP_GLITTERMASKUV 0
#define PROP_GLITTERTEXTUREROTATION 0
#define PROP_GLITTERFREQUENCY 300
#define PROP_GLITTERJITTER 1
#define PROP_GLITTERSPEED 10
#define PROP_GLITTERSIZE 0.3
#define PROP_GLITTERCONTRAST 300
#define PROP_GLITTERANGLERANGE 90
#define PROP_GLITTERMINBRIGHTNESS 0
#define PROP_GLITTERBRIGHTNESS 3
#define PROP_GLITTERBIAS 0.8
#define PROP_GLITTERHIDEINSHADOW 0
#define PROP_GLITTERCENTERSIZE 0.08
#define PROP_GLITTERFREQUENCYLINEAREMISSIVE 20
#define PROP_GLITTERJAGGYFIX 0
#define PROPM_START_GLITTERHUESHIFT 0
#define PROP_GLITTERHUESHIFTENABLED 0
#define PROP_GLITTERHUESHIFTSPEED 0
#define PROP_GLITTERHUESHIFT 0
#define PROPM_END_GLITTERHUESHIFT 0
#define PROPM_START_GLITTERRANDOM 0
#define PROP_GLITTERRANDOMCOLORS 0
#define PROP_GLITTERRANDOMSIZE 0
#define PROP_GLITTERRANDOMROTATION 0
#define PROPM_END_GLITTERRANDOM 0
#define PROPM_END_GLITTER 0
#define PROPM_START_TEXT 0
#define PROP_TEXTPIXELRANGE 4
#define PROP_TEXTENABLED 0
#define PROPM_START_TEXTFPS 0
#define PROP_TEXTFPSENABLED 0
#define PROP_TEXTFPSUV 0
#define PROP_TEXTFPSEMISSIONSTRENGTH 0
#define PROP_TEXTFPSROTATION 0
#define PROPM_END_TEXTFPS 0
#define PROPM_START_TEXTPOSITION 0
#define PROP_TEXTPOSITIONENABLED 0
#define PROP_TEXTPOSITIONUV 0
#define PROP_TEXTPOSITIONEMISSIONSTRENGTH 0
#define PROP_TEXTPOSITIONROTATION 0
#define PROPM_END_TEXTPOSITION 0
#define PROPM_START_TEXTINSTANCETIME 0
#define PROP_TEXTTIMEENABLED 0
#define PROP_TEXTTIMEUV 0
#define PROP_TEXTTIMEEMISSIONSTRENGTH 0
#define PROP_TEXTTIMEROTATION 0
#define PROPM_END_TEXTINSTANCETIME 0
#define PROPM_END_TEXT 0
#define PROPM_START_MIRROROPTIONS 0
#define PROP_ENABLEMIRROROPTIONS 0
#define PROP_MIRROR 0
#define PROP_ENABLEMIRRORTEXTURE 0
#define PROP_MIRRORTEXTUREUV 0
#define PROPM_END_MIRROROPTIONS 0
#define PROPM_START_DISTANCEFADE 0
#define PROP_MAINFADETEXTUREUV 0
#define PROP_MAINFADETYPE 1
#define PROP_MAINMINALPHA 0
#define PROP_MAINMAXALPHA 1
#define PROP_MAINDISTANCEFADEMIN 0
#define PROP_MAINDISTANCEFADEMAX 0
#define PROPM_END_DISTANCEFADE 0
#define PROPM_START_ANGULARFADE 0
#define PROP_ENABLERANDOM 0
#define PROP_ANGLETYPE 0
#define PROP_ANGLECOMPARETO 0
#define PROP_CAMERAANGLEMIN 45
#define PROP_CAMERAANGLEMAX 90
#define PROP_MODELANGLEMIN 45
#define PROP_MODELANGLEMAX 90
#define PROP_ANGLEMINALPHA 0
#define PROPM_END_ANGULARFADE 0
#define PROPM_START_DISTORTIONFLOW 0
#define PROP_ENABLEDISTORTION 0
#define PROP_DISTORTIONMASKUV 0
#define PROP_DISTORTIONSTRENGTH 0.5
#define PROP_DISTORTIONSTRENGTH1 0.5
#define PROPM_START_DISTORTIONAUDIOLINK 0
#define PROP_ENABLEDISTORTIONAUDIOLINK 0
#define PROP_DISTORTIONSTRENGTHAUDIOLINKBAND 0
#define PROP_DISTORTIONSTRENGTH1AUDIOLINKBAND 0
#define PROPM_END_DISTORTIONAUDIOLINK 0
#define PROPM_END_DISTORTIONFLOW 0
#define PROPM_START_AUDIOLINK 0
#define PROP_ENABLEAUDIOLINK 0
#define PROP_AUDIOLINKHELP 0
#define PROP_AUDIOLINKANIMTOGGLE 1
#define PROP_AUDIOLINKDELAY 0
#define PROP_AUDIOLINKAVERAGING 0
#define PROP_AUDIOLINKAVERAGERANGE 0.5
#define PROPM_START_AUDIOLINKDEBUG 0
#define PROP_ENABLEAUDIOLINKDEBUG 0
#define PROP_AUDIOLINKDEBUGTREBLE 0
#define PROP_AUDIOLINKDEBUGHIGHMID 0
#define PROP_AUDIOLINKDEBUGLOWMID 0
#define PROP_AUDIOLINKDEBUGBASS 0
#define PROP_AUDIOLINKDEBUGANIMATE 0
#define PROP_AUDIOLINKTEXTUREVISUALIZATION 0
#define PROPM_END_AUDIOLINKDEBUG 0
#define PROPM_END_AUDIOLINK 0
#define PROPM_PATREON 0
#define PROP_PATREONHELPBOX 0
#define PROPM_START_VIDEO 0
#define PROPM_START_VIDEOSETTINGS 0
#define PROPM_END_VIDEOSETTINGS 0
#define PROPM_START_VIDEODEBUG 0
#define PROPM_END_VIDEODEBUG 0
#define PROPM_START_CRT 0
#define PROPM_END_CRT 0
#define PROPM_START_GAMEBOY 0
#define PROPM_END_GAMEBOY 0
#define PROPM_END_VIDEO 0
#define PROPM_START_TOUCHOPTIONS 0
#define PROPM_START_BULGE 0
#define PROPM_END_BULGE 0
#define PROPM_START_TOUCHGLOW 0
#define PROPM_END_TOUCHGLOW 0
#define PROPM_END_TOUCHOPTIONS 0
#define PROPM_START_HOLOGRAM 0
#define PROPM_START_FRESNELALPHA 0
#define PROPM_END_FRESNELALPHA 0
#define PROPM_END_HOLOGRAM 0
#define PROPM_START_GRABPASS 0
#define PROPM_START_REFRACTION 0
#define PROPM_END_REFRACTION 0
#define PROPM_START_BLUR 0
#define PROPM_END_BLUR 0
#define PROPM_END_GRABPASS 0
#define PROPM_START_IRIDESCENCE 0
#define PROPM_END_IRIDESCENCE 0
#define PROPM_START_VERTEXGLITCH 0
#define PROPM_END_VERTEXGLITCH 0
#define PROPM_START_SPAWNS 0
#define PROPM_START_SCIFISPAWNIN 0
#define PROPM_END_SCIFISPAWNIN 0
#define PROPM_END_SPAWNS 0
#define PROPM_START_VORONOI 0
#define PROPM_START_VORONOIRANDOM 0
#define PROPM_END_VORONOIRANDOM 0
#define PROPM_END_VORONOI 0
#define PROPM_START_BLACKLIGHT 0
#define PROPM_END_BLACKLIGHT 0
#define PROPM_OUTLINEOPTIONS 0
#define PROP_COMMENTIFZERO_ENABLEOUTLINEPASS 0
#define PROP_OUTLINEMODE 0
#define PROP_OUTLINETINTMIX 0
#define PROP_OUTLINERIMLIGHTBLEND 0
#define PROP_OUTLINEFIXEDSIZE 0
#define PROP_OUTLINESMAXDISTANCE 9999
#define PROP_OUTLINEUSEVERTEXCOLORS 0
#define PROP_OUTLINELIT 1
#define PROP_LINEWIDTH 0
#define PROP_OUTLINEEMISSION 0
#define PROP_OUTLINETEXTUREUV 0
#define PROP_OUTLINEMASKUV 0
#define PROP_OUTLINESHADOWSTRENGTH 1
#define PROP_OUTLINEHUESHIFT 0
#define PROP_OUTLINEHUEOFFSET 0
#define PROP_OUTLINEHUEOFFSETSPEED 0
#define PROPM_START_OUTLINEADVANCED 0
#define PROP_OUTLINECULL 1
#define PROP_OUTLINEOFFSETFACTOR 0
#define PROP_OUTLINEOFFSETUNITS 0
#define PROPM_END_OUTLINEADVANCED 0
#define PROPM_PARALLAXMAP 0
#define PROP_PARALLAXMAP 0
#define PROP_PARALLAXHEIGHTMAPENABLED 0
#define PROP_PARALLAXINTERNALMAPENABLED 0
#define PROPM_START_PARALLAXHEIGHTMAP 0
#define PROP_PARALLAXUV 0
#define PROP_PARALLAXHEIGHTMAPMASKUV 0
#define PROP_PARALLAXSTRENGTH 0
#define PROPM_END_PARALLAXHEIGHTMAP 0
#define PROPM_START_PARALLAXINTERNAL 0
#define PROP_PARALLAXINTERNALHEIGHTMAPMODE 0
#define PROP_PARALLAXINTERNALHEIGHTFROMALPHA 0
#define PROP_PARALLAXINTERNALMAPMASKUV 0
#define PROP_PARALLAXINTERNALITERATIONS 1
#define PROP_PARALLAXINTERNALMINDEPTH 0
#define PROP_PARALLAXINTERNALMAXDEPTH 1
#define PROP_PARALLAXINTERNALMINFADE 0
#define PROP_PARALLAXINTERNALMAXFADE 1
#define PROPM_END_PARALLAXINTERNAL 0
#define PROPM_START_PARALLAXADVANCED 0
#define PROP_PARALLAXBIAS 0.42
#define PROPM_END_PARALLAXADVANCED 0
#define PROPM_POSTPROCESSING 0
#define PROP_PPHELP 0
#define PROP_PPLIGHTINGMULTIPLIER 1
#define PROP_PPEMISSIONMULTIPLIER 1
#define PROPM_RENDERINGOPTIONS 0
#define PROP_CULL 2
#define PROP_ZTEST 4
#define PROP_ZWRITE 1
#define PROP_COLORMASK 15
#define PROP_OFFSETFACTOR 0
#define PROP_OFFSETUNITS 0
#define PROP_IGNOREFOG 0
#define PROPINSTANCING 0
#define PROPM_START_BLENDING 0
#define PROP_BLENDOP 0
#define PROP_BLENDOPALPHA 0
#define PROP_SRCBLEND 1
#define PROP_DSTBLEND 0
#define PROPM_END_BLENDING 0
#define PROPM_START_STENCILPASSOPTIONS 0
#define PROP_STENCILREF 0
#define PROP_STENCILREADMASK 255
#define PROP_STENCILWRITEMASK 255
#define PROP_STENCILPASSOP 0
#define PROP_STENCILFAILOP 0
#define PROP_STENCILZFAILOP 0
#define PROP_STENCILCOMPAREFUNCTION 8
#define PROPM_END_STENCILPASSOPTIONS 0
#define PROPM_START_OUTLINESTENCIL 0
#define PROP_OUTLINESTENCILREF 0
#define PROP_OUTLINESTENCILREADMASK 255
#define PROP_OUTLINESTENCILWRITEMASK 255
#define PROP_OUTLINESTENCILPASSOP 0
#define PROP_OUTLINESTENCILFAILOP 0
#define PROP_OUTLINESTENCILZFAILOP 0
#define PROP_OUTLINESTENCILCOMPAREFUNCTION 8
#define PROPM_END_OUTLINESTENCIL 0
#define PROPM_START_DEBUGOPTIONS 0
#define PROP_DEBUGENABLED 0
#define PROP_VERTEXUNWRAP 0
#define PROP_DEBUGMESHDATA 0
#define PROP_DEBUGLIGHTINGDATA 0
#define PROP_DEBUGCAMERADATA 0
#define PROPM_END_DEBUGOPTIONS 0

            #pragma target 5.0
            #define FORWARD_ADD_PASS
            float _Mode;
            #pragma multi_compile_instancing
            #pragma multi_compile_fwdadd_fullshadows
            #pragma vertex vert
            #pragma fragment frag
            #include "../Includes/CGI_PoiPass.cginc"
            ENDCG
        }
        Pass
        {
            Name "ShadowCasterPass"
            Tags { "LightMode" = "ShadowCaster" }
            Stencil
            {
                Ref [_StencilRef]
                Comp [_StencilCompareFunction]
                Pass [_StencilPassOp]
                Fail [_StencilFailOp]
                ZFail [_StencilZFailOp]
            }
            AlphaToMask Off
            ZWrite [_ZWrite]
            Cull [_Cull]
            ZTest [_ZTest]
            ColorMask [_ColorMask]
            Offset [_OffsetFactor], [_OffsetUnits]
            CGPROGRAM
#define OPTIMIZER_ENABLED
#define VIGNETTE_MASKED
#define _EMISSION
#define _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
#define PROPSHADER_IS_USING_THRY_EDITOR 69
#define PROPSHADER_MASTER_LABEL 0
#define PROPSHADER_PRESETS 0
#define PROPSHADER_PROPERTIES_LABEL_FILE 0
#define PROPFOOTER_YOUTUBE 0
#define PROPFOOTER_TWITTER 0
#define PROPFOOTER_PATREON 0
#define PROPFOOTER_DISCORD 0
#define PROPFOOTER_GITHUB 0
#define PROP_FORGOTTOLOCKMATERIAL 1
#define PROP_SHADEROPTIMIZERENABLED 0
#define PROP_LOCKTOOLTIP 0
#define PROP_MODE 0
#define PROPM_MAINOPTIONS 1
#define PROP_MAINTEXTUREUV 0
#define PROP_MAINEMISSIONSTRENGTH 0
#define PROP_BUMPMAPUV 0
#define PROP_BUMPSCALE 1
#define PROP_CLIPPINGMASKUV 0
#define PROP_INVERSE_CLIPPING 0
#define PROPM_START_MAINHUESHIFT 1
#define PROP_MAINCOLORADJUSTTEXTUREUV 0
#define PROP_MAINHUESHIFTREPLACE 1
#define PROP_MAINHUESHIFT 0
#define PROP_MAINHUESHIFTSPEED 1
#define PROP_SATURATION 0
#define PROP_MAINBRIGHTNESS 0
#define PROP_MAINHUESHIFTTOGGLE 0
#define PROPM_END_MAINHUESHIFT 0
#define PROPM_START_RGBMASK 0
#define PROP_RGBMASKENABLED 0
#define PROP_RGBUSEVERTEXCOLORS 0
#define PROP_RGBBLENDMULTIPLICATIVE 0
#define PROP_RGBMASKUV 0
#define PROP_RGBRED_UV 0
#define PROP_RGBGREEN_UV 0
#define PROP_RGBBLUE_UV 0
#define PROP_RGBALPHA_UV 0
#define PROP_RGBNORMALSENABLED 0
#define PROP_RGBNORMALBLEND 0
#define PROP_RGBNORMALRUV 0
#define PROP_RGBNORMALRSCALE 0
#define PROP_RGBNORMALGUV 0
#define PROP_RGBNORMALGSCALE 0
#define PROP_RGBNORMALBUV 0
#define PROP_RGBNORMALBSCALE 0
#define PROP_RGBNORMALAUV 0
#define PROP_RGBNORMALASCALE 0
#define PROPM_END_RGBMASK 0
#define PROPM_START_DETAILOPTIONS 0
#define PROP_DETAILENABLED 0
#define PROP_DETAILMASKUV 0
#define PROP_DETAILTEXUV 0
#define PROP_DETAILTEXINTENSITY 1
#define PROP_DETAILBRIGHTNESS 1
#define PROP_DETAILNORMALMAPSCALE 1
#define PROP_DETAILNORMALMAPUV 0
#define PROPM_END_DETAILOPTIONS 0
#define PROPM_START_MAINVERTEXCOLORS 0
#define PROP_MAINVERTEXCOLORINGLINEARSPACE 1
#define PROP_MAINVERTEXCOLORING 0
#define PROP_MAINUSEVERTEXCOLORALPHA 0
#define PROPM_END_MAINVERTEXCOLORS 0
#define PROPM_START_VERTEXMANIPULATION 0
#define PROP_VERTEXMANIPULATIONSENABLED 0
#define PROP_VERTEXMANIPULATIONHEIGHT 0
#define PROP_VERTEXMANIPULATIONHEIGHTUV 0
#define PROP_VERTEXMANIPULATIONHEIGHTBIAS 0
#define PROP_VERTEXROUNDINGENABLED 0
#define PROP_VERTEXROUNDINGDIVISION 500
#define PROPM_END_VERTEXMANIPULATION 0
#define PROPM_START_ALPHA 0
#define PROP_CUTOFF 0.5
#define PROP_DITHERINGENABLED 0
#define PROP_DITHERGRADIENT 0.1
#define PROP_FORCEOPAQUE 0
#define PROP_MAINSHADOWCLIPMOD 0
#define PROP_ALPHATOMASK 0
#define PROP_MAINALPHATOCOVERAGE 0
#define PROP_MAINMIPSCALE 0.25
#define PROP_ALPHAPREMULTIPLY 0
#define PROP_ALPHAMOD 0
#define PROPM_END_ALPHA 0
#define PROPM_START_DECALSECTION 0
#define PROP_DECALMASKUV 0
#define PROPM_START_DECAL0 0
#define PROP_DECALENABLED 0
#define PROP_DECALEMISSIONSTRENGTH 0
#define PROP_DECALTEXTUREUV 0
#define PROP_DECALTILED 0
#define PROP_DECAL0DEPTH 0
#define PROP_DECALROTATION 0
#define PROP_DECALROTATIONSPEED 0
#define PROP_DECALBLENDTYPE 0
#define PROP_DECALBLENDALPHA 1
#define PROP_DECALHUESHIFTENABLED 0
#define PROP_DECALHUESHIFTSPEED 0
#define PROP_DECALHUESHIFT 0
#define PROPM_START_DECAL0AUDIOLINK 0
#define PROP_AUDIOLINKDECAL0SCALEBAND 0
#define PROP_AUDIOLINKDECAL0ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL0ALPHABAND 0
#define PROP_AUDIOLINKDECAL0EMISSIONBAND 0
#define PROPM_END_DECAL0AUDIOLINK 0
#define PROPM_END_DECAL0 0
#define PROPM_START_DECAL1 0
#define PROP_DECALENABLED1 0
#define PROP_DECALEMISSIONSTRENGTH1 0
#define PROP_DECALTEXTURE1UV 0
#define PROP_DECALTILED1 0
#define PROP_DECAL1DEPTH 0
#define PROP_DECALROTATION1 0
#define PROP_DECALROTATIONSPEED1 0
#define PROP_DECALBLENDTYPE1 0
#define PROP_DECALBLENDALPHA1 1
#define PROP_DECALHUESHIFTENABLED1 0
#define PROP_DECALHUESHIFTSPEED1 0
#define PROP_DECALHUESHIFT1 0
#define PROPM_START_DECAL1AUDIOLINK 0
#define PROP_AUDIOLINKDECAL1SCALEBAND 0
#define PROP_AUDIOLINKDECAL1ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL1ALPHABAND 0
#define PROP_AUDIOLINKDECAL1EMISSIONBAND 0
#define PROPM_END_DECAL1AUDIOLINK 0
#define PROPM_END_DECAL1 0
#define PROPM_START_DECAL2 0
#define PROP_DECALENABLED2 0
#define PROP_DECALEMISSIONSTRENGTH2 0
#define PROP_DECALTEXTURE2UV 0
#define PROP_DECALTILED2 0
#define PROP_DECAL2DEPTH 0
#define PROP_DECALROTATION2 0
#define PROP_DECALROTATIONSPEED2 0
#define PROP_DECALBLENDTYPE2 0
#define PROP_DECALBLENDALPHA2 1
#define PROP_DECALHUESHIFTENABLED2 0
#define PROP_DECALHUESHIFTSPEED2 0
#define PROP_DECALHUESHIFT2 0
#define PROPM_START_DECAL2AUDIOLINK 0
#define PROP_AUDIOLINKDECAL2SCALEBAND 0
#define PROP_AUDIOLINKDECAL2ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL2ALPHABAND 0
#define PROP_AUDIOLINKDECAL2EMISSIONBAND 0
#define PROPM_END_DECAL2AUDIOLINK 0
#define PROPM_END_DECAL2 0
#define PROPM_START_DECAL3 0
#define PROP_DECALENABLED3 0
#define PROP_DECALEMISSIONSTRENGTH3 0
#define PROP_DECALTEXTURE3UV 0
#define PROP_DECALTILED3 0
#define PROP_DECAL3DEPTH 0
#define PROP_DECALROTATION3 0
#define PROP_DECALROTATIONSPEED3 0
#define PROP_DECALBLENDTYPE3 0
#define PROP_DECALBLENDALPHA3 1
#define PROP_DECALHUESHIFTENABLED3 0
#define PROP_DECALHUESHIFTSPEED3 0
#define PROP_DECALHUESHIFT3 0
#define PROPM_START_DECAL3AUDIOLINK 0
#define PROP_AUDIOLINKDECAL3SCALEBAND 0
#define PROP_AUDIOLINKDECAL3ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL3ALPHABAND 0
#define PROP_AUDIOLINKDECAL3EMISSIONBAND 0
#define PROPM_END_DECAL3AUDIOLINK 0
#define PROPM_END_DECAL3 0
#define PROPM_END_DECALSECTION 0
#define PROPM_START_BACKFACE 0
#define PROP_BACKFACEENABLED 0
#define PROP_BACKFACEREPLACEALPHA 0
#define PROP_BACKFACETEXTUREUV 0
#define PROP_BACKFACEDETAILINTENSITY 1
#define PROP_BACKFACEHUESHIFT 0
#define PROP_BACKFACEEMISSIONSTRENGTH 0
#define PROPM_END_BACKFACE 0
#define PROPM_LIGHTINGOPTIONS 1
#define PROPM_START_LIGHTING 1
#define PROP_ENABLELIGHTING 1
#define PROP_LIGHTINGMODE 1
#define PROP_LIGHTINGSTANDARDSMOOTHNESS 0
#define PROP_LIGHTINGWRAPPEDWRAP 0
#define PROP_LIGHTINGWRAPPEDNORMALIZATION 0
#define PROP_LIGHTINGRAMPTYPE 0
#define PROP_1ST_SHADEMAPUV 0
#define PROP_USE_1STSHADEMAPALPHA_AS_SHADOWMASK 0
#define PROP_1STSHADEMAPMASK_INVERSE 0
#define PROP_USE_BASEAS1ST 0
#define PROP_2ND_SHADEMAPUV 0
#define PROP_USE_2NDSHADEMAPALPHA_AS_SHADOWMASK 0
#define PROP_2NDSHADEMAPMASK_INVERSE 0
#define PROP_USE_1STAS2ND 0
#define PROP_BASECOLOR_STEP 0.5
#define PROP_BASESHADE_FEATHER 0.0001
#define PROP_SHADECOLOR_STEP 0
#define PROP_1ST2ND_SHADES_FEATHER 0.0001
#define PROP_TOONRAMP
#define PROP_LIGHTINGSHADOWMASKUV 0
#define PROP_SHADOWOFFSET 0
#define PROP_LIGHTINGGRADIENTSTART 0
#define PROP_LIGHTINGGRADIENTEND 0.5
#define PROP_SSSSCALE 1
#define PROP_SSSBUMPBLUR 0.7
#define PROP_SHADOWSTRENGTH 1
#define PROP_ATTENUATIONMULTIPLIER 0
#define PROP_LIGHTINGIGNOREAMBIENTCOLOR 0
#define PROPM_START_LIGHTINGMODIFIERS 0
#define PROP_LIGHTINGDIRECTCOLORMODE 0
#define PROP_LIGHTINGINDIRECTCOLORMODE 0
#define PROP_LIGHTINGUNCAPPED 0
#define PROP_LIGHTINGONLYUNITYSHADOWS 0
#define PROP_LIGHTINGMONOCHROMATIC 0
#define PROP_LIGHTINGMINLIGHTBRIGHTNESS 0
#define PROP_LIGHTINGMINSHADOWBRIGHTNESSRATIO 0
#define PROPM_END_LIGHTINGMODIFIERS 0
#define PROPM_START_DETAILSHADOWS 0
#define PROP_LIGHTINGDETAILSHADOWSENABLED 0
#define PROP_LIGHTINGDETAILSHADOWSUV 0
#define PROP_LIGHTINGDETAILSTRENGTH 1
#define PROPM_END_DETAILSHADOWS 0
#define PROPM_START_AMBIENTOCCLUSION 0
#define PROP_LIGHTINGENABLEAO 0
#define PROP_LIGHTINGAOTEXUV 0
#define PROP_AOSTRENGTH 1
#define PROPM_END_AMBIENTOCCLUSION 0
#define PROPM_START_LIGHTINGHSL 0
#define PROP_LIGHTINGENABLEHSL 0
#define PROP_LIGHTINGHSLINTENSITY 1
#define PROP_LIGHTINGSHADOWHUE 0.5
#define PROP_LIGHTINGSHADOWSATURATION 0.5
#define PROP_LIGHTINGSHADOWLIGHTNESS 0.5
#define PROPM_END_LIGHTINGHSL 0
#define PROPM_START_LIGHTINGADVANCED 1
#define PROP_LIGHTINGADDITIVEENABLE 1
#define PROP_LIGHTINGADDITIVETYPE 0
#define PROP_LIGHTINGADDITIVEGRADIENTSTART 0
#define PROP_LIGHTINGADDITIVEGRADIENTEND 0.5
#define PROP_LIGHTINGADDITIVEPASSTHROUGH 0.5
#define PROP_LIGHTINGADDITIVEDETAILSTRENGTH 1
#define PROP_LIGHTINGADDITIVELIMITINTENSITY 0
#define PROP_LIGHTINGADDITIVEMAXINTENSITY 1
#define PROP_DISABLEDIRECTIONALINADD 1
#define PROPM_END_LIGHTINGADVANCED 0
#define PROPM_END_LIGHTING 0
#define PROPM_START_SUBSURFACE 0
#define PROP_ENABLESSS 0
#define PROP_SSSTHICKNESSMAPUV 0
#define PROP_SSSTHICKNESSMOD 0
#define PROP_SSSSCALE 0.25
#define PROP_SSSPOWER 5
#define PROP_SSSDISTORTION 1
#define PROPM_END_SUBSURFACE 0
#define PROPM_START_RIMLIGHTOPTIONS 0
#define PROP_ENABLERIMLIGHTING 0
#define PROP_RIMLIGHTNORMAL 1
#define PROP_RIMLIGHTINGINVERT 0
#define PROP_RIMWIDTH 0.8
#define PROP_RIMSHARPNESS 0.25
#define PROP_RIMSTRENGTH 0
#define PROP_RIMBRIGHTEN 0
#define PROP_RIMLIGHTCOLORBIAS 1
#define PROP_RIMTEXUV 0
#define PROP_RIMMASKUV 0
#define PROPM_START_RIMHUESHIFT 0
#define PROP_RIMHUESHIFTENABLED 0
#define PROP_RIMHUESHIFTSPEED 0
#define PROP_RIMHUESHIFT 0
#define PROPM_END_RIMHUESHIFT 0
#define PROPM_START_RIMWIDTHNOISE 0
#define PROP_RIMWIDTHNOISETEXTUREUV 0
#define PROP_RIMWIDTHNOISESTRENGTH 0.1
#define PROPM_END_RIMWIDTHNOISE 0
#define PROPM_START_SHADOWMIX 0
#define PROP_SHADOWMIX 0
#define PROP_SHADOWMIXTHRESHOLD 0.5
#define PROP_SHADOWMIXWIDTHMOD 0.5
#define PROPM_END_SHADOWMIX 0
#define PROPM_START_RIMAUDIOLINK 0
#define PROP_AUDIOLINKRIMWIDTHBAND 0
#define PROP_AUDIOLINKRIMEMISSIONBAND 0
#define PROP_AUDIOLINKRIMBRIGHTNESSBAND 0
#define PROPM_END_RIMAUDIOLINK 0
#define PROPM_END_RIMLIGHTOPTIONS 0
#define PROPM_START_REFLECTIONRIM 0
#define PROP_ENABLEENVIRONMENTALRIM 0
#define PROP_RIMENVIROMASKUV 0
#define PROP_RIMENVIROBLUR 0.7
#define PROP_RIMENVIROWIDTH 0.45
#define PROP_RIMENVIROSHARPNESS 0
#define PROP_RIMENVIROMINBRIGHTNESS 0
#define PROP_RIMENVIROINTENSITY 1
#define PROPM_END_REFLECTIONRIM 0
#define PROPM_START_BAKEDLIGHTING 0
#define PROP_SPECULARLMOCCLUSION 0
#define PROP_SPECLMOCCLUSIONADJUST 0.2
#define PROP_GIEMISSIONMULTIPLIER 1
#define PROPDSGI 0
#define PROPLIGHTMAPFLAGS 0
#define PROPM_END_BAKEDLIGHTING 0
#define PROP_LOCKTOOLTIP 0
#define PROPM_START_BRDF 0
#define PROP_ENABLEBRDF 0
#define PROP_BRDFMETALLICGLOSSMAPTOOLTIP 0
#define PROP_BRDFINVERTGLOSSINESS 0
#define PROP_BRDFMETALLICGLOSSMAPUV 0
#define PROP_BRDFSPECULARMAPTOOLTIP 0
#define PROP_BRDFSPECULARMAPUV 0
#define PROP_BRDFMETALLICMAPTOOLTIP 0
#define PROP_BRDFMETALLICMAPUV 0
#define PROP_BRDFMETALLIC 0
#define PROP_BRDFGLOSSINESS 0
#define PROP_BRDFREFLECTANCE 0.5
#define PROP_BRDFANISOTROPY 0
#define PROP_BRDFMETALLICSPECIGNORESBASECOLOR 0
#define PROP_BRDFREFLECTIONSENABLED 1
#define PROP_BRDFSPECULARENABLED 1
#define PROP_BRDFFALLBACK
#define PROP_BRDFFORCEFALLBACK 0
#define PROPM_END_BRDF 0
#define PROPM_START_METALLIC 0
#define PROP_ENABLEMETALLIC 0
#define PROP_CUBEMAP
#define PROP_SAMPLEWORLD 0
#define PROP_METALLICTINTMAPUV 0
#define PROP_METALLICMASKUV 0
#define PROP_METALLIC 0
#define PROP_SMOOTHNESSMASKUV 0
#define PROP_INVERTSMOOTHNESS 0
#define PROP_SMOOTHNESS 0
#define PROPM_END_METALLIC 0
#define PROPM_START_CLEARCOAT 0
#define PROP_ENABLECLEARCOAT 0
#define PROP_CLEARCOATHELPBOX 0
#define PROP_CLEARCOATMAPUV 0
#define PROP_CLEARCOATINVERTSMOOTHNESS 0
#define PROP_CLEARCOAT 1
#define PROP_CLEARCOATGLOSSINESS 0
#define PROP_CLEARCOATANISOTROPY 0
#define PROP_CLEARCOATENABLEREFLECTIONS 1
#define PROP_CLEARCOATENABLESPECULAR 1
#define PROP_CLEARCOATFORCEFALLBACK 0
#define PROPM_END_CLEARCOAT 0
#define PROPM_START_MATCAP 0
#define PROP_MATCAPENABLE 0
#define PROP_MATCAPBORDER 0.43
#define PROP_MATCAPMASKUV 0
#define PROP_MATCAPMASKINVERT 0
#define PROP_MATCAPEMISSIONSTRENGTH 0
#define PROP_MATCAPINTENSITY 1
#define PROP_MATCAPLIGHTMASK 0
#define PROP_MATCAPREPLACE 1
#define PROP_MATCAPMULTIPLY 0
#define PROP_MATCAPADD 0
#define PROP_MATCAPNORMAL 1
#define PROPM_START_MATCAPHUESHIFT 0
#define PROP_MATCAPHUESHIFTENABLED 0
#define PROP_MATCAPHUESHIFTSPEED 0
#define PROP_MATCAPHUESHIFT 0
#define PROPM_END_MATCAPHUESHIFT 0
#define PROPM_END_MATCAP 0
#define PROPM_START_MATCAP2 0
#define PROP_MATCAP2ENABLE 0
#define PROP_MATCAP2BORDER 0.43
#define PROP_MATCAP2MASKUV 0
#define PROP_MATCAP2MASKINVERT 0
#define PROP_MATCAP2EMISSIONSTRENGTH 0
#define PROP_MATCAP2INTENSITY 1
#define PROP_MATCAP2LIGHTMASK 0
#define PROP_MATCAP2REPLACE 0
#define PROP_MATCAP2MULTIPLY 0
#define PROP_MATCAP2ADD 0
#define PROP_MATCAP2NORMAL 1
#define PROPM_START_MATCAP2HUESHIFT 0
#define PROP_MATCAP2HUESHIFTENABLED 0
#define PROP_MATCAP2HUESHIFTSPEED 0
#define PROP_MATCAP2HUESHIFT 0
#define PROPM_END_MATCAP2HUESHIFT 0
#define PROPM_END_MATCAP2 0
#define PROPM_START_SPECULAR 0
#define PROP_ENABLESPECULAR 0
#define PROP_SPECULARTYPE 1
#define PROP_SPECULARNORMAL 1
#define PROP_SPECULARMETALLIC 0
#define PROP_SPECULARMAXBRIGHTNESS 0
#define PROP_SPECULARMETALLICMAPUV 0
#define PROP_SPECULARSMOOTHNESS 1
#define PROP_SPECULARMAPUV 0
#define PROP_SPECULARINVERTSMOOTHNESS 0
#define PROP_SPECULARMASKUV 0
#define PROP_SMOOTHNESSFROM 1
#define PROP_SPECWHATTANGENT 0
#define PROP_ANISOSPEC1ALPHA 1
#define PROP_ANISOSPEC2ALPHA 1
#define PROP_SPEC1OFFSET 0
#define PROP_SPEC2SMOOTHNESS 0
#define PROP_ANISOUSETANGENTMAP 0
#define PROP_ANISOTANGENTMAPUV 0
#define PROP_SPECULARTOONSTART 0.95
#define PROP_SPECULARTOONEND 1
#define PROP_SPECULARANISOJITTERMIRRORED 0
#define PROP_SPECULARANISOJITTERMICROMULTIPLIER 0
#define PROP_SPECULARANISOJITTERMICROUV 0
#define PROP_SPECULARANISOJITTERMACROMULTIPLIER 0
#define PROP_SPECULARANISOJITTERMACROUV 0
#define PROPM_END_SPECULAR 0
#define PROPM_START_SPECULAR1 0
#define PROP_ENABLESPECULAR1 0
#define PROP_SPECULARTYPE1 1
#define PROP_SPECULARNORMAL1 1
#define PROP_SPECULARMETALLIC1 0
#define PROP_SPECULARMAXBRIGHTNESS1 0
#define PROP_SPECULARMETALLICMAP1UV 0
#define PROP_SPECULARSMOOTHNESS1 0.75
#define PROP_SPECULARMAP1UV 0
#define PROP_SPECULARINVERTSMOOTHNESS1 0
#define PROP_SPECULARMASK1UV 0
#define PROP_SMOOTHNESSFROM1 1
#define PROP_SPECWHATTANGENT1 0
#define PROP_ANISOSPEC1ALPHA1 1
#define PROP_ANISOSPEC2ALPHA1 1
#define PROP_SPEC1OFFSET1 0
#define PROP_SPEC2SMOOTHNESS1 0
#define PROP_ANISOUSETANGENTMAP1 0
#define PROP_ANISOTANGENTMAP1UV 0
#define PROP_SPECULARTOONSTART1 0.95
#define PROP_SPECULARTOONEND1 1
#define PROP_SPECULARANISOJITTERMIRRORED1 0
#define PROP_SPECULARANISOJITTERMICROMULTIPLIER1 0
#define PROP_SPECULARANISOJITTERMICRO1UV 0
#define PROP_SPECULARANISOJITTERMACROMULTIPLIER1 0
#define PROP_SPECULARANISOJITTERMACRO1UV 0
#define PROPM_END_SPECULAR1 0
#define PROPM_SPECIAL_EFFECTS 1
#define PROPM_START_EMISSIONOPTIONS 1
#define PROP_ENABLEEMISSION 1
#define PROP_EMISSIONREPLACE 0
#define PROP_EMISSIONBASECOLORASMAP 0
#define PROP_EMISSIONMAPUV 0
#define PROP_EMISSIONMASKUV 0
#define PROP_EMISSIONSTRENGTH 2
#define PROP_EMISSIONHUESHIFTENABLED 0
#define PROP_EMISSIONHUESHIFT 0
#define PROP_EMISSIONHUESHIFTSPEED 5
#define PROPM_START_CENTEROUTEMISSION 1
#define PROP_EMISSIONCENTEROUTENABLED 0
#define PROP_EMISSIONCENTEROUTSPEED 5
#define PROPM_END_CENTEROUTEMISSION 0
#define PROPM_START_GLOWINDARKEMISSIONOPTIONS 0
#define PROP_ENABLEGITDEMISSION 0
#define PROP_GITDEWORLDORMESH 0
#define PROP_GITDEMINEMISSIONMULTIPLIER 1
#define PROP_GITDEMAXEMISSIONMULTIPLIER 0
#define PROP_GITDEMINLIGHT 0
#define PROP_GITDEMAXLIGHT 1
#define PROPM_END_GLOWINDARKEMISSIONOPTIONS 0
#define PROPM_START_BLINKINGEMISSIONOPTIONS 0
#define PROP_EMISSIONBLINKINGENABLED 0
#define PROP_EMISSIVEBLINK_MIN 0
#define PROP_EMISSIVEBLINK_MAX 1
#define PROP_EMISSIVEBLINK_VELOCITY 4
#define PROP_EMISSIONBLINKINGOFFSET 0
#define PROPM_END_BLINKINGEMISSIONOPTIONS 0
#define PROPM_START_SCROLLINGEMISSIONOPTIONS 0
#define PROP_SCROLLINGEMISSION 0
#define PROP_EMISSIONSCROLLINGUSECURVE 0
#define PROP_EMISSIONSCROLLINGVERTEXCOLOR 0
#define PROP_EMISSIVESCROLL_WIDTH 10
#define PROP_EMISSIVESCROLL_VELOCITY 10
#define PROP_EMISSIVESCROLL_INTERVAL 20
#define PROP_EMISSIONSCROLLINGOFFSET 0
#define PROPM_END_SCROLLINGEMISSIONOPTIONS 0
#define PROPM_START_EMISSIONAUDIOLINK 0
#define PROP_ENABLEEMISSIONSTRENGTHAUDIOLINK 0
#define PROP_AUDIOLINKEMISSIONSTRENGTHBAND 0
#define PROP_ENABLEEMISSIONCENTEROUTAUDIOLINK 0
#define PROP_EMISSIONCENTEROUTAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSIONCENTEROUTBAND 0
#define PROP_EMISSIONCENTEROUTADDAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSIONCENTEROUTADDBAND 0
#define PROP_AUDIOLINKADDEMISSIONBAND 0
#define PROPM_END_EMISSIONAUDIOLINK 0
#define PROPM_END_EMISSIONOPTIONS 0
#define PROPM_START_EMISSION1OPTIONS 0
#define PROP_ENABLEEMISSION1 0
#define PROP_EMISSIONBASECOLORASMAP1 0
#define PROP_EMISSIONMAP1UV 0
#define PROP_EMISSIONMASK1UV 0
#define PROP_EMISSIONSTRENGTH1 0
#define PROP_EMISSIONHUESHIFTENABLED1 0
#define PROP_EMISSIONHUESHIFT1 0
#define PROP_EMISSIONHUESHIFTSPEED1 0
#define PROPM_START_CENTEROUTEMISSION1 0
#define PROP_EMISSIONCENTEROUTENABLED1 0
#define PROP_EMISSIONCENTEROUTSPEED1 5
#define PROPM_END_CENTEROUTEMISSION1 0
#define PROPM_START_GLOWINDARKEMISSIONOPTIONS1 0
#define PROP_ENABLEGITDEMISSION1 0
#define PROP_GITDEWORLDORMESH1 0
#define PROP_GITDEMINEMISSIONMULTIPLIER1 1
#define PROP_GITDEMAXEMISSIONMULTIPLIER1 0
#define PROP_GITDEMINLIGHT1 0
#define PROP_GITDEMAXLIGHT1 1
#define PROPM_END_GLOWINDARKEMISSIONOPTIONS1 0
#define PROPM_START_BLINKINGEMISSIONOPTIONS1 0
#define PROP_EMISSIONBLINKINGENABLED1 0
#define PROP_EMISSIVEBLINK_MIN1 0
#define PROP_EMISSIVEBLINK_MAX1 1
#define PROP_EMISSIVEBLINK_VELOCITY1 4
#define PROP_EMISSIONBLINKINGOFFSET1 0
#define PROPM_END_BLINKINGEMISSIONOPTIONS1 0
#define PROPM_START_SCROLLINGEMISSIONOPTIONS1 0
#define PROP_SCROLLINGEMISSION1 0
#define PROP_EMISSIONSCROLLINGUSECURVE1 0
#define PROP_EMISSIONSCROLLINGVERTEXCOLOR1 0
#define PROP_EMISSIVESCROLL_WIDTH1 10
#define PROP_EMISSIVESCROLL_VELOCITY1 10
#define PROP_EMISSIVESCROLL_INTERVAL1 20
#define PROP_EMISSIONSCROLLINGOFFSET1 0
#define PROPM_END_SCROLLINGEMISSION1OPTIONS 0
#define PROPM_START_EMISSION1AUDIOLINK 0
#define PROP_ENABLEEMISSION1STRENGTHAUDIOLINK 0
#define PROP_AUDIOLINKEMISSION1STRENGTHBAND 0
#define PROP_ENABLEEMISSION1CENTEROUTAUDIOLINK 0
#define PROP_EMISSION1CENTEROUTAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSION1CENTEROUTBAND 0
#define PROP_EMISSION1CENTEROUTADDAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSION1CENTEROUTADDBAND 0
#define PROP_AUDIOLINKADDEMISSION1BAND 0
#define PROPM_END_EMISSION1AUDIOLINK 0
#define PROPM_END_EMISSION1OPTIONS 0
#define PROPM_START_PATHING 0
#define PROP_ENABLEPATHING 0
#define PROP_PATHINGMAPUV 0
#define PROP_PATHINGCOLORMAPUV 0
#define PROP_PATHTYPER 0
#define PROP_PATHTYPEG 0
#define PROP_PATHTYPEB 0
#define PROPM_START_PATHAUDIOLINK 0
#define PROP_AUDIOLINKPATHTIMEOFFSETBANDR 0
#define PROP_AUDIOLINKPATHTIMEOFFSETBANDG 0
#define PROP_AUDIOLINKPATHTIMEOFFSETBANDB 0
#define PROP_AUDIOLINKPATHEMISSIONADDBANDR 0
#define PROP_AUDIOLINKPATHEMISSIONADDBANDG 0
#define PROP_AUDIOLINKPATHEMISSIONADDBANDB 0
#define PROP_AUDIOLINKPATHWIDTHOFFSETBANDR 0
#define PROP_AUDIOLINKPATHWIDTHOFFSETBANDG 0
#define PROP_AUDIOLINKPATHWIDTHOFFSETBANDB 0
#define PROPM_END_PATHAUDIOLINK 0
#define PROPM_END_PATHING 0
#define PROPM_START_FLIPBOOK 0
#define PROP_ENABLEFLIPBOOK 0
#define PROP_FLIPBOOKALPHACONTROLSFINALALPHA 0
#define PROP_FLIPBOOKINTENSITYCONTROLSALPHA 0
#define PROP_FLIPBOOKCOLORREPLACES 0
#define PROP_FLIPBOOKTEXARRAYUV 0
#define PROP_FLIPBOOKMASKUV 0
#define PROP_FLIPBOOKTOTALFRAMES 1
#define PROP_FLIPBOOKFPS 30
#define PROP_FLIPBOOKTILED 0
#define PROP_FLIPBOOKEMISSIONSTRENGTH 0
#define PROP_FLIPBOOKROTATION 0
#define PROP_FLIPBOOKROTATIONSPEED 0
#define PROP_FLIPBOOKREPLACE 1
#define PROP_FLIPBOOKMULTIPLY 0
#define PROP_FLIPBOOKADD 0
#define PROPM_START_FLIPBOOKAUDIOLINK 0
#define PROP_AUDIOLINKFLIPBOOKSCALEBAND 0
#define PROP_AUDIOLINKFLIPBOOKALPHABAND 0
#define PROP_AUDIOLINKFLIPBOOKEMISSIONBAND 0
#define PROP_AUDIOLINKFLIPBOOKFRAMEBAND 0
#define PROPM_END_FLIPBOOKAUDIOLINK 0
#define PROPM_START_MANUALFLIPBOOKCONTROL 0
#define PROP_FLIPBOOKCURRENTFRAME -1
#define PROPM_END_MANUALFLIPBOOKCONTROL 0
#define PROPM_START_CROSSFADE 0
#define PROP_FLIPBOOKCROSSFADEENABLED 0
#define PROPM_END_CROSSFADE 0
#define PROPM_START_FLIPBOOKHUESHIFT 0
#define PROP_FLIPBOOKHUESHIFTENABLED 0
#define PROP_FLIPBOOKHUESHIFTSPEED 0
#define PROP_FLIPBOOKHUESHIFT 0
#define PROPM_END_FLIPBOOKHUESHIFT 0
#define PROPM_END_FLIPBOOK 0
#define PROPM_START_DISSOLVE 0
#define PROP_ENABLEDISSOLVE 0
#define PROP_DISSOLVETYPE 1
#define PROP_DISSOLVEEDGEWIDTH 0.025
#define PROP_DISSOLVEEDGEHARDNESS 0.5
#define PROP_DISSOLVEEDGEEMISSION 0
#define PROP_DISSOLVETOTEXTUREUV 0
#define PROP_DISSOLVETOEMISSIONSTRENGTH 0
#define PROP_DISSOLVENOISETEXTUREUV 0
#define PROP_DISSOLVEINVERTNOISE 0
#define PROP_DISSOLVEDETAILNOISEUV 0
#define PROP_DISSOLVEINVERTDETAILNOISE 0
#define PROP_DISSOLVEDETAILSTRENGTH 0.1
#define PROP_DISSOLVEALPHA 0
#define PROP_DISSOLVEUSEVERTEXCOLORS 0
#define PROP_DISSOLVEMASKUV 0
#define PROP_DISSOLVEMASKINVERT 0
#define PROP_CONTINUOUSDISSOLVE 0
#define PROPM_START_DISSOLVEMASKING 0
#define PROP_DISSOLVEEMISSIONSIDE 2
#define PROP_DISSOLVEEMISSION1SIDE 2
#define PROPM_END_DISSOLVEMASKING 0
#define PROPM_START_POINTTOPOINT 0
#define PROP_DISSOLVEP2PWORLDLOCAL 0
#define PROP_DISSOLVEP2PEDGELENGTH 0.1
#define PROPM_END_POINTTOPOINT 0
#define PROPM_START_DISSOLVEHUESHIFT 0
#define PROP_DISSOLVEHUESHIFTENABLED 0
#define PROP_DISSOLVEHUESHIFTSPEED 0
#define PROP_DISSOLVEHUESHIFT 0
#define PROP_DISSOLVEEDGEHUESHIFTENABLED 0
#define PROP_DISSOLVEEDGEHUESHIFTSPEED 0
#define PROP_DISSOLVEEDGEHUESHIFT 0
#define PROPM_END_DISSOLVEHUESHIFT 0
#define PROPM_START_BONUSSLIDERS 0
#define PROP_DISSOLVEALPHA0 0
#define PROP_DISSOLVEALPHA1 0
#define PROP_DISSOLVEALPHA2 0
#define PROP_DISSOLVEALPHA3 0
#define PROP_DISSOLVEALPHA4 0
#define PROP_DISSOLVEALPHA5 0
#define PROP_DISSOLVEALPHA6 0
#define PROP_DISSOLVEALPHA7 0
#define PROP_DISSOLVEALPHA8 0
#define PROP_DISSOLVEALPHA9 0
#define PROPM_END_BONUSSLIDERS 0
#define PROPM_START_DISSOLVEAUDIOLINK 0
#define PROP_ENABLEDISSOLVEAUDIOLINK 0
#define PROP_AUDIOLINKDISSOLVEALPHABAND 0
#define PROP_AUDIOLINKDISSOLVEDETAILBAND 0
#define PROPM_END_DISSOLVEAUDIOLINK 0
#define PROPM_END_DISSOLVE 0
#define PROPM_START_PANOSPHEREOPTIONS 0
#define PROP_PANOTOGGLE 0
#define PROP_PANOINFINITESTEREOTOGGLE 0
#define PROP_PANOMASKUV 0
#define PROP_PANOEMISSION 0
#define PROP_PANOBLEND 0
#define PROP_PANOCUBEMAPTOGGLE 0
#define PROPM_END_PANOSPHEREOPTIONS 0
#define PROPM_START_GLITTER 0
#define PROP_GLITTERENABLE 0
#define PROP_GLITTERMODE 0
#define PROP_GLITTERSHAPE 0
#define PROP_GLITTERBLENDTYPE 0
#define PROP_GLITTERUSESURFACECOLOR 0
#define PROP_GLITTERCOLORMAPUV 0
#define PROP_GLITTERMASKUV 0
#define PROP_GLITTERTEXTUREROTATION 0
#define PROP_GLITTERFREQUENCY 300
#define PROP_GLITTERJITTER 1
#define PROP_GLITTERSPEED 10
#define PROP_GLITTERSIZE 0.3
#define PROP_GLITTERCONTRAST 300
#define PROP_GLITTERANGLERANGE 90
#define PROP_GLITTERMINBRIGHTNESS 0
#define PROP_GLITTERBRIGHTNESS 3
#define PROP_GLITTERBIAS 0.8
#define PROP_GLITTERHIDEINSHADOW 0
#define PROP_GLITTERCENTERSIZE 0.08
#define PROP_GLITTERFREQUENCYLINEAREMISSIVE 20
#define PROP_GLITTERJAGGYFIX 0
#define PROPM_START_GLITTERHUESHIFT 0
#define PROP_GLITTERHUESHIFTENABLED 0
#define PROP_GLITTERHUESHIFTSPEED 0
#define PROP_GLITTERHUESHIFT 0
#define PROPM_END_GLITTERHUESHIFT 0
#define PROPM_START_GLITTERRANDOM 0
#define PROP_GLITTERRANDOMCOLORS 0
#define PROP_GLITTERRANDOMSIZE 0
#define PROP_GLITTERRANDOMROTATION 0
#define PROPM_END_GLITTERRANDOM 0
#define PROPM_END_GLITTER 0
#define PROPM_START_TEXT 0
#define PROP_TEXTPIXELRANGE 4
#define PROP_TEXTENABLED 0
#define PROPM_START_TEXTFPS 0
#define PROP_TEXTFPSENABLED 0
#define PROP_TEXTFPSUV 0
#define PROP_TEXTFPSEMISSIONSTRENGTH 0
#define PROP_TEXTFPSROTATION 0
#define PROPM_END_TEXTFPS 0
#define PROPM_START_TEXTPOSITION 0
#define PROP_TEXTPOSITIONENABLED 0
#define PROP_TEXTPOSITIONUV 0
#define PROP_TEXTPOSITIONEMISSIONSTRENGTH 0
#define PROP_TEXTPOSITIONROTATION 0
#define PROPM_END_TEXTPOSITION 0
#define PROPM_START_TEXTINSTANCETIME 0
#define PROP_TEXTTIMEENABLED 0
#define PROP_TEXTTIMEUV 0
#define PROP_TEXTTIMEEMISSIONSTRENGTH 0
#define PROP_TEXTTIMEROTATION 0
#define PROPM_END_TEXTINSTANCETIME 0
#define PROPM_END_TEXT 0
#define PROPM_START_MIRROROPTIONS 0
#define PROP_ENABLEMIRROROPTIONS 0
#define PROP_MIRROR 0
#define PROP_ENABLEMIRRORTEXTURE 0
#define PROP_MIRRORTEXTUREUV 0
#define PROPM_END_MIRROROPTIONS 0
#define PROPM_START_DISTANCEFADE 0
#define PROP_MAINFADETEXTUREUV 0
#define PROP_MAINFADETYPE 1
#define PROP_MAINMINALPHA 0
#define PROP_MAINMAXALPHA 1
#define PROP_MAINDISTANCEFADEMIN 0
#define PROP_MAINDISTANCEFADEMAX 0
#define PROPM_END_DISTANCEFADE 0
#define PROPM_START_ANGULARFADE 0
#define PROP_ENABLERANDOM 0
#define PROP_ANGLETYPE 0
#define PROP_ANGLECOMPARETO 0
#define PROP_CAMERAANGLEMIN 45
#define PROP_CAMERAANGLEMAX 90
#define PROP_MODELANGLEMIN 45
#define PROP_MODELANGLEMAX 90
#define PROP_ANGLEMINALPHA 0
#define PROPM_END_ANGULARFADE 0
#define PROPM_START_DISTORTIONFLOW 0
#define PROP_ENABLEDISTORTION 0
#define PROP_DISTORTIONMASKUV 0
#define PROP_DISTORTIONSTRENGTH 0.5
#define PROP_DISTORTIONSTRENGTH1 0.5
#define PROPM_START_DISTORTIONAUDIOLINK 0
#define PROP_ENABLEDISTORTIONAUDIOLINK 0
#define PROP_DISTORTIONSTRENGTHAUDIOLINKBAND 0
#define PROP_DISTORTIONSTRENGTH1AUDIOLINKBAND 0
#define PROPM_END_DISTORTIONAUDIOLINK 0
#define PROPM_END_DISTORTIONFLOW 0
#define PROPM_START_AUDIOLINK 0
#define PROP_ENABLEAUDIOLINK 0
#define PROP_AUDIOLINKHELP 0
#define PROP_AUDIOLINKANIMTOGGLE 1
#define PROP_AUDIOLINKDELAY 0
#define PROP_AUDIOLINKAVERAGING 0
#define PROP_AUDIOLINKAVERAGERANGE 0.5
#define PROPM_START_AUDIOLINKDEBUG 0
#define PROP_ENABLEAUDIOLINKDEBUG 0
#define PROP_AUDIOLINKDEBUGTREBLE 0
#define PROP_AUDIOLINKDEBUGHIGHMID 0
#define PROP_AUDIOLINKDEBUGLOWMID 0
#define PROP_AUDIOLINKDEBUGBASS 0
#define PROP_AUDIOLINKDEBUGANIMATE 0
#define PROP_AUDIOLINKTEXTUREVISUALIZATION 0
#define PROPM_END_AUDIOLINKDEBUG 0
#define PROPM_END_AUDIOLINK 0
#define PROPM_PATREON 0
#define PROP_PATREONHELPBOX 0
#define PROPM_START_VIDEO 0
#define PROPM_START_VIDEOSETTINGS 0
#define PROPM_END_VIDEOSETTINGS 0
#define PROPM_START_VIDEODEBUG 0
#define PROPM_END_VIDEODEBUG 0
#define PROPM_START_CRT 0
#define PROPM_END_CRT 0
#define PROPM_START_GAMEBOY 0
#define PROPM_END_GAMEBOY 0
#define PROPM_END_VIDEO 0
#define PROPM_START_TOUCHOPTIONS 0
#define PROPM_START_BULGE 0
#define PROPM_END_BULGE 0
#define PROPM_START_TOUCHGLOW 0
#define PROPM_END_TOUCHGLOW 0
#define PROPM_END_TOUCHOPTIONS 0
#define PROPM_START_HOLOGRAM 0
#define PROPM_START_FRESNELALPHA 0
#define PROPM_END_FRESNELALPHA 0
#define PROPM_END_HOLOGRAM 0
#define PROPM_START_GRABPASS 0
#define PROPM_START_REFRACTION 0
#define PROPM_END_REFRACTION 0
#define PROPM_START_BLUR 0
#define PROPM_END_BLUR 0
#define PROPM_END_GRABPASS 0
#define PROPM_START_IRIDESCENCE 0
#define PROPM_END_IRIDESCENCE 0
#define PROPM_START_VERTEXGLITCH 0
#define PROPM_END_VERTEXGLITCH 0
#define PROPM_START_SPAWNS 0
#define PROPM_START_SCIFISPAWNIN 0
#define PROPM_END_SCIFISPAWNIN 0
#define PROPM_END_SPAWNS 0
#define PROPM_START_VORONOI 0
#define PROPM_START_VORONOIRANDOM 0
#define PROPM_END_VORONOIRANDOM 0
#define PROPM_END_VORONOI 0
#define PROPM_START_BLACKLIGHT 0
#define PROPM_END_BLACKLIGHT 0
#define PROPM_OUTLINEOPTIONS 0
#define PROP_COMMENTIFZERO_ENABLEOUTLINEPASS 0
#define PROP_OUTLINEMODE 0
#define PROP_OUTLINETINTMIX 0
#define PROP_OUTLINERIMLIGHTBLEND 0
#define PROP_OUTLINEFIXEDSIZE 0
#define PROP_OUTLINESMAXDISTANCE 9999
#define PROP_OUTLINEUSEVERTEXCOLORS 0
#define PROP_OUTLINELIT 1
#define PROP_LINEWIDTH 0
#define PROP_OUTLINEEMISSION 0
#define PROP_OUTLINETEXTUREUV 0
#define PROP_OUTLINEMASKUV 0
#define PROP_OUTLINESHADOWSTRENGTH 1
#define PROP_OUTLINEHUESHIFT 0
#define PROP_OUTLINEHUEOFFSET 0
#define PROP_OUTLINEHUEOFFSETSPEED 0
#define PROPM_START_OUTLINEADVANCED 0
#define PROP_OUTLINECULL 1
#define PROP_OUTLINEOFFSETFACTOR 0
#define PROP_OUTLINEOFFSETUNITS 0
#define PROPM_END_OUTLINEADVANCED 0
#define PROPM_PARALLAXMAP 0
#define PROP_PARALLAXMAP 0
#define PROP_PARALLAXHEIGHTMAPENABLED 0
#define PROP_PARALLAXINTERNALMAPENABLED 0
#define PROPM_START_PARALLAXHEIGHTMAP 0
#define PROP_PARALLAXUV 0
#define PROP_PARALLAXHEIGHTMAPMASKUV 0
#define PROP_PARALLAXSTRENGTH 0
#define PROPM_END_PARALLAXHEIGHTMAP 0
#define PROPM_START_PARALLAXINTERNAL 0
#define PROP_PARALLAXINTERNALHEIGHTMAPMODE 0
#define PROP_PARALLAXINTERNALHEIGHTFROMALPHA 0
#define PROP_PARALLAXINTERNALMAPMASKUV 0
#define PROP_PARALLAXINTERNALITERATIONS 1
#define PROP_PARALLAXINTERNALMINDEPTH 0
#define PROP_PARALLAXINTERNALMAXDEPTH 1
#define PROP_PARALLAXINTERNALMINFADE 0
#define PROP_PARALLAXINTERNALMAXFADE 1
#define PROPM_END_PARALLAXINTERNAL 0
#define PROPM_START_PARALLAXADVANCED 0
#define PROP_PARALLAXBIAS 0.42
#define PROPM_END_PARALLAXADVANCED 0
#define PROPM_POSTPROCESSING 0
#define PROP_PPHELP 0
#define PROP_PPLIGHTINGMULTIPLIER 1
#define PROP_PPEMISSIONMULTIPLIER 1
#define PROPM_RENDERINGOPTIONS 0
#define PROP_CULL 2
#define PROP_ZTEST 4
#define PROP_ZWRITE 1
#define PROP_COLORMASK 15
#define PROP_OFFSETFACTOR 0
#define PROP_OFFSETUNITS 0
#define PROP_IGNOREFOG 0
#define PROPINSTANCING 0
#define PROPM_START_BLENDING 0
#define PROP_BLENDOP 0
#define PROP_BLENDOPALPHA 0
#define PROP_SRCBLEND 1
#define PROP_DSTBLEND 0
#define PROPM_END_BLENDING 0
#define PROPM_START_STENCILPASSOPTIONS 0
#define PROP_STENCILREF 0
#define PROP_STENCILREADMASK 255
#define PROP_STENCILWRITEMASK 255
#define PROP_STENCILPASSOP 0
#define PROP_STENCILFAILOP 0
#define PROP_STENCILZFAILOP 0
#define PROP_STENCILCOMPAREFUNCTION 8
#define PROPM_END_STENCILPASSOPTIONS 0
#define PROPM_START_OUTLINESTENCIL 0
#define PROP_OUTLINESTENCILREF 0
#define PROP_OUTLINESTENCILREADMASK 255
#define PROP_OUTLINESTENCILWRITEMASK 255
#define PROP_OUTLINESTENCILPASSOP 0
#define PROP_OUTLINESTENCILFAILOP 0
#define PROP_OUTLINESTENCILZFAILOP 0
#define PROP_OUTLINESTENCILCOMPAREFUNCTION 8
#define PROPM_END_OUTLINESTENCIL 0
#define PROPM_START_DEBUGOPTIONS 0
#define PROP_DEBUGENABLED 0
#define PROP_VERTEXUNWRAP 0
#define PROP_DEBUGMESHDATA 0
#define PROP_DEBUGLIGHTINGDATA 0
#define PROP_DEBUGCAMERADATA 0
#define PROPM_END_DEBUGOPTIONS 0

            #pragma target 5.0
            #define POI_SHADOW
            float _Mode;
            #pragma multi_compile_instancing
            #pragma vertex vertShadowCaster
            #pragma fragment fragShadowCaster
            #include "../Includes/CGI_PoiPassShadow.cginc"
            ENDCG
        }
        Pass
        {
            Tags { "LightMode" = "Meta" }
            Cull Off
            CGPROGRAM
#define OPTIMIZER_ENABLED
#define VIGNETTE_MASKED
#define _EMISSION
#define _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
#define PROPSHADER_IS_USING_THRY_EDITOR 69
#define PROPSHADER_MASTER_LABEL 0
#define PROPSHADER_PRESETS 0
#define PROPSHADER_PROPERTIES_LABEL_FILE 0
#define PROPFOOTER_YOUTUBE 0
#define PROPFOOTER_TWITTER 0
#define PROPFOOTER_PATREON 0
#define PROPFOOTER_DISCORD 0
#define PROPFOOTER_GITHUB 0
#define PROP_FORGOTTOLOCKMATERIAL 1
#define PROP_SHADEROPTIMIZERENABLED 0
#define PROP_LOCKTOOLTIP 0
#define PROP_MODE 0
#define PROPM_MAINOPTIONS 1
#define PROP_MAINTEXTUREUV 0
#define PROP_MAINEMISSIONSTRENGTH 0
#define PROP_BUMPMAPUV 0
#define PROP_BUMPSCALE 1
#define PROP_CLIPPINGMASKUV 0
#define PROP_INVERSE_CLIPPING 0
#define PROPM_START_MAINHUESHIFT 1
#define PROP_MAINCOLORADJUSTTEXTUREUV 0
#define PROP_MAINHUESHIFTREPLACE 1
#define PROP_MAINHUESHIFT 0
#define PROP_MAINHUESHIFTSPEED 1
#define PROP_SATURATION 0
#define PROP_MAINBRIGHTNESS 0
#define PROP_MAINHUESHIFTTOGGLE 0
#define PROPM_END_MAINHUESHIFT 0
#define PROPM_START_RGBMASK 0
#define PROP_RGBMASKENABLED 0
#define PROP_RGBUSEVERTEXCOLORS 0
#define PROP_RGBBLENDMULTIPLICATIVE 0
#define PROP_RGBMASKUV 0
#define PROP_RGBRED_UV 0
#define PROP_RGBGREEN_UV 0
#define PROP_RGBBLUE_UV 0
#define PROP_RGBALPHA_UV 0
#define PROP_RGBNORMALSENABLED 0
#define PROP_RGBNORMALBLEND 0
#define PROP_RGBNORMALRUV 0
#define PROP_RGBNORMALRSCALE 0
#define PROP_RGBNORMALGUV 0
#define PROP_RGBNORMALGSCALE 0
#define PROP_RGBNORMALBUV 0
#define PROP_RGBNORMALBSCALE 0
#define PROP_RGBNORMALAUV 0
#define PROP_RGBNORMALASCALE 0
#define PROPM_END_RGBMASK 0
#define PROPM_START_DETAILOPTIONS 0
#define PROP_DETAILENABLED 0
#define PROP_DETAILMASKUV 0
#define PROP_DETAILTEXUV 0
#define PROP_DETAILTEXINTENSITY 1
#define PROP_DETAILBRIGHTNESS 1
#define PROP_DETAILNORMALMAPSCALE 1
#define PROP_DETAILNORMALMAPUV 0
#define PROPM_END_DETAILOPTIONS 0
#define PROPM_START_MAINVERTEXCOLORS 0
#define PROP_MAINVERTEXCOLORINGLINEARSPACE 1
#define PROP_MAINVERTEXCOLORING 0
#define PROP_MAINUSEVERTEXCOLORALPHA 0
#define PROPM_END_MAINVERTEXCOLORS 0
#define PROPM_START_VERTEXMANIPULATION 0
#define PROP_VERTEXMANIPULATIONSENABLED 0
#define PROP_VERTEXMANIPULATIONHEIGHT 0
#define PROP_VERTEXMANIPULATIONHEIGHTUV 0
#define PROP_VERTEXMANIPULATIONHEIGHTBIAS 0
#define PROP_VERTEXROUNDINGENABLED 0
#define PROP_VERTEXROUNDINGDIVISION 500
#define PROPM_END_VERTEXMANIPULATION 0
#define PROPM_START_ALPHA 0
#define PROP_CUTOFF 0.5
#define PROP_DITHERINGENABLED 0
#define PROP_DITHERGRADIENT 0.1
#define PROP_FORCEOPAQUE 0
#define PROP_MAINSHADOWCLIPMOD 0
#define PROP_ALPHATOMASK 0
#define PROP_MAINALPHATOCOVERAGE 0
#define PROP_MAINMIPSCALE 0.25
#define PROP_ALPHAPREMULTIPLY 0
#define PROP_ALPHAMOD 0
#define PROPM_END_ALPHA 0
#define PROPM_START_DECALSECTION 0
#define PROP_DECALMASKUV 0
#define PROPM_START_DECAL0 0
#define PROP_DECALENABLED 0
#define PROP_DECALEMISSIONSTRENGTH 0
#define PROP_DECALTEXTUREUV 0
#define PROP_DECALTILED 0
#define PROP_DECAL0DEPTH 0
#define PROP_DECALROTATION 0
#define PROP_DECALROTATIONSPEED 0
#define PROP_DECALBLENDTYPE 0
#define PROP_DECALBLENDALPHA 1
#define PROP_DECALHUESHIFTENABLED 0
#define PROP_DECALHUESHIFTSPEED 0
#define PROP_DECALHUESHIFT 0
#define PROPM_START_DECAL0AUDIOLINK 0
#define PROP_AUDIOLINKDECAL0SCALEBAND 0
#define PROP_AUDIOLINKDECAL0ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL0ALPHABAND 0
#define PROP_AUDIOLINKDECAL0EMISSIONBAND 0
#define PROPM_END_DECAL0AUDIOLINK 0
#define PROPM_END_DECAL0 0
#define PROPM_START_DECAL1 0
#define PROP_DECALENABLED1 0
#define PROP_DECALEMISSIONSTRENGTH1 0
#define PROP_DECALTEXTURE1UV 0
#define PROP_DECALTILED1 0
#define PROP_DECAL1DEPTH 0
#define PROP_DECALROTATION1 0
#define PROP_DECALROTATIONSPEED1 0
#define PROP_DECALBLENDTYPE1 0
#define PROP_DECALBLENDALPHA1 1
#define PROP_DECALHUESHIFTENABLED1 0
#define PROP_DECALHUESHIFTSPEED1 0
#define PROP_DECALHUESHIFT1 0
#define PROPM_START_DECAL1AUDIOLINK 0
#define PROP_AUDIOLINKDECAL1SCALEBAND 0
#define PROP_AUDIOLINKDECAL1ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL1ALPHABAND 0
#define PROP_AUDIOLINKDECAL1EMISSIONBAND 0
#define PROPM_END_DECAL1AUDIOLINK 0
#define PROPM_END_DECAL1 0
#define PROPM_START_DECAL2 0
#define PROP_DECALENABLED2 0
#define PROP_DECALEMISSIONSTRENGTH2 0
#define PROP_DECALTEXTURE2UV 0
#define PROP_DECALTILED2 0
#define PROP_DECAL2DEPTH 0
#define PROP_DECALROTATION2 0
#define PROP_DECALROTATIONSPEED2 0
#define PROP_DECALBLENDTYPE2 0
#define PROP_DECALBLENDALPHA2 1
#define PROP_DECALHUESHIFTENABLED2 0
#define PROP_DECALHUESHIFTSPEED2 0
#define PROP_DECALHUESHIFT2 0
#define PROPM_START_DECAL2AUDIOLINK 0
#define PROP_AUDIOLINKDECAL2SCALEBAND 0
#define PROP_AUDIOLINKDECAL2ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL2ALPHABAND 0
#define PROP_AUDIOLINKDECAL2EMISSIONBAND 0
#define PROPM_END_DECAL2AUDIOLINK 0
#define PROPM_END_DECAL2 0
#define PROPM_START_DECAL3 0
#define PROP_DECALENABLED3 0
#define PROP_DECALEMISSIONSTRENGTH3 0
#define PROP_DECALTEXTURE3UV 0
#define PROP_DECALTILED3 0
#define PROP_DECAL3DEPTH 0
#define PROP_DECALROTATION3 0
#define PROP_DECALROTATIONSPEED3 0
#define PROP_DECALBLENDTYPE3 0
#define PROP_DECALBLENDALPHA3 1
#define PROP_DECALHUESHIFTENABLED3 0
#define PROP_DECALHUESHIFTSPEED3 0
#define PROP_DECALHUESHIFT3 0
#define PROPM_START_DECAL3AUDIOLINK 0
#define PROP_AUDIOLINKDECAL3SCALEBAND 0
#define PROP_AUDIOLINKDECAL3ROTATIONBAND 0
#define PROP_AUDIOLINKDECAL3ALPHABAND 0
#define PROP_AUDIOLINKDECAL3EMISSIONBAND 0
#define PROPM_END_DECAL3AUDIOLINK 0
#define PROPM_END_DECAL3 0
#define PROPM_END_DECALSECTION 0
#define PROPM_START_BACKFACE 0
#define PROP_BACKFACEENABLED 0
#define PROP_BACKFACEREPLACEALPHA 0
#define PROP_BACKFACETEXTUREUV 0
#define PROP_BACKFACEDETAILINTENSITY 1
#define PROP_BACKFACEHUESHIFT 0
#define PROP_BACKFACEEMISSIONSTRENGTH 0
#define PROPM_END_BACKFACE 0
#define PROPM_LIGHTINGOPTIONS 1
#define PROPM_START_LIGHTING 1
#define PROP_ENABLELIGHTING 1
#define PROP_LIGHTINGMODE 1
#define PROP_LIGHTINGSTANDARDSMOOTHNESS 0
#define PROP_LIGHTINGWRAPPEDWRAP 0
#define PROP_LIGHTINGWRAPPEDNORMALIZATION 0
#define PROP_LIGHTINGRAMPTYPE 0
#define PROP_1ST_SHADEMAPUV 0
#define PROP_USE_1STSHADEMAPALPHA_AS_SHADOWMASK 0
#define PROP_1STSHADEMAPMASK_INVERSE 0
#define PROP_USE_BASEAS1ST 0
#define PROP_2ND_SHADEMAPUV 0
#define PROP_USE_2NDSHADEMAPALPHA_AS_SHADOWMASK 0
#define PROP_2NDSHADEMAPMASK_INVERSE 0
#define PROP_USE_1STAS2ND 0
#define PROP_BASECOLOR_STEP 0.5
#define PROP_BASESHADE_FEATHER 0.0001
#define PROP_SHADECOLOR_STEP 0
#define PROP_1ST2ND_SHADES_FEATHER 0.0001
#define PROP_TOONRAMP
#define PROP_LIGHTINGSHADOWMASKUV 0
#define PROP_SHADOWOFFSET 0
#define PROP_LIGHTINGGRADIENTSTART 0
#define PROP_LIGHTINGGRADIENTEND 0.5
#define PROP_SSSSCALE 1
#define PROP_SSSBUMPBLUR 0.7
#define PROP_SHADOWSTRENGTH 1
#define PROP_ATTENUATIONMULTIPLIER 0
#define PROP_LIGHTINGIGNOREAMBIENTCOLOR 0
#define PROPM_START_LIGHTINGMODIFIERS 0
#define PROP_LIGHTINGDIRECTCOLORMODE 0
#define PROP_LIGHTINGINDIRECTCOLORMODE 0
#define PROP_LIGHTINGUNCAPPED 0
#define PROP_LIGHTINGONLYUNITYSHADOWS 0
#define PROP_LIGHTINGMONOCHROMATIC 0
#define PROP_LIGHTINGMINLIGHTBRIGHTNESS 0
#define PROP_LIGHTINGMINSHADOWBRIGHTNESSRATIO 0
#define PROPM_END_LIGHTINGMODIFIERS 0
#define PROPM_START_DETAILSHADOWS 0
#define PROP_LIGHTINGDETAILSHADOWSENABLED 0
#define PROP_LIGHTINGDETAILSHADOWSUV 0
#define PROP_LIGHTINGDETAILSTRENGTH 1
#define PROPM_END_DETAILSHADOWS 0
#define PROPM_START_AMBIENTOCCLUSION 0
#define PROP_LIGHTINGENABLEAO 0
#define PROP_LIGHTINGAOTEXUV 0
#define PROP_AOSTRENGTH 1
#define PROPM_END_AMBIENTOCCLUSION 0
#define PROPM_START_LIGHTINGHSL 0
#define PROP_LIGHTINGENABLEHSL 0
#define PROP_LIGHTINGHSLINTENSITY 1
#define PROP_LIGHTINGSHADOWHUE 0.5
#define PROP_LIGHTINGSHADOWSATURATION 0.5
#define PROP_LIGHTINGSHADOWLIGHTNESS 0.5
#define PROPM_END_LIGHTINGHSL 0
#define PROPM_START_LIGHTINGADVANCED 1
#define PROP_LIGHTINGADDITIVEENABLE 1
#define PROP_LIGHTINGADDITIVETYPE 0
#define PROP_LIGHTINGADDITIVEGRADIENTSTART 0
#define PROP_LIGHTINGADDITIVEGRADIENTEND 0.5
#define PROP_LIGHTINGADDITIVEPASSTHROUGH 0.5
#define PROP_LIGHTINGADDITIVEDETAILSTRENGTH 1
#define PROP_LIGHTINGADDITIVELIMITINTENSITY 0
#define PROP_LIGHTINGADDITIVEMAXINTENSITY 1
#define PROP_DISABLEDIRECTIONALINADD 1
#define PROPM_END_LIGHTINGADVANCED 0
#define PROPM_END_LIGHTING 0
#define PROPM_START_SUBSURFACE 0
#define PROP_ENABLESSS 0
#define PROP_SSSTHICKNESSMAPUV 0
#define PROP_SSSTHICKNESSMOD 0
#define PROP_SSSSCALE 0.25
#define PROP_SSSPOWER 5
#define PROP_SSSDISTORTION 1
#define PROPM_END_SUBSURFACE 0
#define PROPM_START_RIMLIGHTOPTIONS 0
#define PROP_ENABLERIMLIGHTING 0
#define PROP_RIMLIGHTNORMAL 1
#define PROP_RIMLIGHTINGINVERT 0
#define PROP_RIMWIDTH 0.8
#define PROP_RIMSHARPNESS 0.25
#define PROP_RIMSTRENGTH 0
#define PROP_RIMBRIGHTEN 0
#define PROP_RIMLIGHTCOLORBIAS 1
#define PROP_RIMTEXUV 0
#define PROP_RIMMASKUV 0
#define PROPM_START_RIMHUESHIFT 0
#define PROP_RIMHUESHIFTENABLED 0
#define PROP_RIMHUESHIFTSPEED 0
#define PROP_RIMHUESHIFT 0
#define PROPM_END_RIMHUESHIFT 0
#define PROPM_START_RIMWIDTHNOISE 0
#define PROP_RIMWIDTHNOISETEXTUREUV 0
#define PROP_RIMWIDTHNOISESTRENGTH 0.1
#define PROPM_END_RIMWIDTHNOISE 0
#define PROPM_START_SHADOWMIX 0
#define PROP_SHADOWMIX 0
#define PROP_SHADOWMIXTHRESHOLD 0.5
#define PROP_SHADOWMIXWIDTHMOD 0.5
#define PROPM_END_SHADOWMIX 0
#define PROPM_START_RIMAUDIOLINK 0
#define PROP_AUDIOLINKRIMWIDTHBAND 0
#define PROP_AUDIOLINKRIMEMISSIONBAND 0
#define PROP_AUDIOLINKRIMBRIGHTNESSBAND 0
#define PROPM_END_RIMAUDIOLINK 0
#define PROPM_END_RIMLIGHTOPTIONS 0
#define PROPM_START_REFLECTIONRIM 0
#define PROP_ENABLEENVIRONMENTALRIM 0
#define PROP_RIMENVIROMASKUV 0
#define PROP_RIMENVIROBLUR 0.7
#define PROP_RIMENVIROWIDTH 0.45
#define PROP_RIMENVIROSHARPNESS 0
#define PROP_RIMENVIROMINBRIGHTNESS 0
#define PROP_RIMENVIROINTENSITY 1
#define PROPM_END_REFLECTIONRIM 0
#define PROPM_START_BAKEDLIGHTING 0
#define PROP_SPECULARLMOCCLUSION 0
#define PROP_SPECLMOCCLUSIONADJUST 0.2
#define PROP_GIEMISSIONMULTIPLIER 1
#define PROPDSGI 0
#define PROPLIGHTMAPFLAGS 0
#define PROPM_END_BAKEDLIGHTING 0
#define PROP_LOCKTOOLTIP 0
#define PROPM_START_BRDF 0
#define PROP_ENABLEBRDF 0
#define PROP_BRDFMETALLICGLOSSMAPTOOLTIP 0
#define PROP_BRDFINVERTGLOSSINESS 0
#define PROP_BRDFMETALLICGLOSSMAPUV 0
#define PROP_BRDFSPECULARMAPTOOLTIP 0
#define PROP_BRDFSPECULARMAPUV 0
#define PROP_BRDFMETALLICMAPTOOLTIP 0
#define PROP_BRDFMETALLICMAPUV 0
#define PROP_BRDFMETALLIC 0
#define PROP_BRDFGLOSSINESS 0
#define PROP_BRDFREFLECTANCE 0.5
#define PROP_BRDFANISOTROPY 0
#define PROP_BRDFMETALLICSPECIGNORESBASECOLOR 0
#define PROP_BRDFREFLECTIONSENABLED 1
#define PROP_BRDFSPECULARENABLED 1
#define PROP_BRDFFALLBACK
#define PROP_BRDFFORCEFALLBACK 0
#define PROPM_END_BRDF 0
#define PROPM_START_METALLIC 0
#define PROP_ENABLEMETALLIC 0
#define PROP_CUBEMAP
#define PROP_SAMPLEWORLD 0
#define PROP_METALLICTINTMAPUV 0
#define PROP_METALLICMASKUV 0
#define PROP_METALLIC 0
#define PROP_SMOOTHNESSMASKUV 0
#define PROP_INVERTSMOOTHNESS 0
#define PROP_SMOOTHNESS 0
#define PROPM_END_METALLIC 0
#define PROPM_START_CLEARCOAT 0
#define PROP_ENABLECLEARCOAT 0
#define PROP_CLEARCOATHELPBOX 0
#define PROP_CLEARCOATMAPUV 0
#define PROP_CLEARCOATINVERTSMOOTHNESS 0
#define PROP_CLEARCOAT 1
#define PROP_CLEARCOATGLOSSINESS 0
#define PROP_CLEARCOATANISOTROPY 0
#define PROP_CLEARCOATENABLEREFLECTIONS 1
#define PROP_CLEARCOATENABLESPECULAR 1
#define PROP_CLEARCOATFORCEFALLBACK 0
#define PROPM_END_CLEARCOAT 0
#define PROPM_START_MATCAP 0
#define PROP_MATCAPENABLE 0
#define PROP_MATCAPBORDER 0.43
#define PROP_MATCAPMASKUV 0
#define PROP_MATCAPMASKINVERT 0
#define PROP_MATCAPEMISSIONSTRENGTH 0
#define PROP_MATCAPINTENSITY 1
#define PROP_MATCAPLIGHTMASK 0
#define PROP_MATCAPREPLACE 1
#define PROP_MATCAPMULTIPLY 0
#define PROP_MATCAPADD 0
#define PROP_MATCAPNORMAL 1
#define PROPM_START_MATCAPHUESHIFT 0
#define PROP_MATCAPHUESHIFTENABLED 0
#define PROP_MATCAPHUESHIFTSPEED 0
#define PROP_MATCAPHUESHIFT 0
#define PROPM_END_MATCAPHUESHIFT 0
#define PROPM_END_MATCAP 0
#define PROPM_START_MATCAP2 0
#define PROP_MATCAP2ENABLE 0
#define PROP_MATCAP2BORDER 0.43
#define PROP_MATCAP2MASKUV 0
#define PROP_MATCAP2MASKINVERT 0
#define PROP_MATCAP2EMISSIONSTRENGTH 0
#define PROP_MATCAP2INTENSITY 1
#define PROP_MATCAP2LIGHTMASK 0
#define PROP_MATCAP2REPLACE 0
#define PROP_MATCAP2MULTIPLY 0
#define PROP_MATCAP2ADD 0
#define PROP_MATCAP2NORMAL 1
#define PROPM_START_MATCAP2HUESHIFT 0
#define PROP_MATCAP2HUESHIFTENABLED 0
#define PROP_MATCAP2HUESHIFTSPEED 0
#define PROP_MATCAP2HUESHIFT 0
#define PROPM_END_MATCAP2HUESHIFT 0
#define PROPM_END_MATCAP2 0
#define PROPM_START_SPECULAR 0
#define PROP_ENABLESPECULAR 0
#define PROP_SPECULARTYPE 1
#define PROP_SPECULARNORMAL 1
#define PROP_SPECULARMETALLIC 0
#define PROP_SPECULARMAXBRIGHTNESS 0
#define PROP_SPECULARMETALLICMAPUV 0
#define PROP_SPECULARSMOOTHNESS 1
#define PROP_SPECULARMAPUV 0
#define PROP_SPECULARINVERTSMOOTHNESS 0
#define PROP_SPECULARMASKUV 0
#define PROP_SMOOTHNESSFROM 1
#define PROP_SPECWHATTANGENT 0
#define PROP_ANISOSPEC1ALPHA 1
#define PROP_ANISOSPEC2ALPHA 1
#define PROP_SPEC1OFFSET 0
#define PROP_SPEC2SMOOTHNESS 0
#define PROP_ANISOUSETANGENTMAP 0
#define PROP_ANISOTANGENTMAPUV 0
#define PROP_SPECULARTOONSTART 0.95
#define PROP_SPECULARTOONEND 1
#define PROP_SPECULARANISOJITTERMIRRORED 0
#define PROP_SPECULARANISOJITTERMICROMULTIPLIER 0
#define PROP_SPECULARANISOJITTERMICROUV 0
#define PROP_SPECULARANISOJITTERMACROMULTIPLIER 0
#define PROP_SPECULARANISOJITTERMACROUV 0
#define PROPM_END_SPECULAR 0
#define PROPM_START_SPECULAR1 0
#define PROP_ENABLESPECULAR1 0
#define PROP_SPECULARTYPE1 1
#define PROP_SPECULARNORMAL1 1
#define PROP_SPECULARMETALLIC1 0
#define PROP_SPECULARMAXBRIGHTNESS1 0
#define PROP_SPECULARMETALLICMAP1UV 0
#define PROP_SPECULARSMOOTHNESS1 0.75
#define PROP_SPECULARMAP1UV 0
#define PROP_SPECULARINVERTSMOOTHNESS1 0
#define PROP_SPECULARMASK1UV 0
#define PROP_SMOOTHNESSFROM1 1
#define PROP_SPECWHATTANGENT1 0
#define PROP_ANISOSPEC1ALPHA1 1
#define PROP_ANISOSPEC2ALPHA1 1
#define PROP_SPEC1OFFSET1 0
#define PROP_SPEC2SMOOTHNESS1 0
#define PROP_ANISOUSETANGENTMAP1 0
#define PROP_ANISOTANGENTMAP1UV 0
#define PROP_SPECULARTOONSTART1 0.95
#define PROP_SPECULARTOONEND1 1
#define PROP_SPECULARANISOJITTERMIRRORED1 0
#define PROP_SPECULARANISOJITTERMICROMULTIPLIER1 0
#define PROP_SPECULARANISOJITTERMICRO1UV 0
#define PROP_SPECULARANISOJITTERMACROMULTIPLIER1 0
#define PROP_SPECULARANISOJITTERMACRO1UV 0
#define PROPM_END_SPECULAR1 0
#define PROPM_SPECIAL_EFFECTS 1
#define PROPM_START_EMISSIONOPTIONS 1
#define PROP_ENABLEEMISSION 1
#define PROP_EMISSIONREPLACE 0
#define PROP_EMISSIONBASECOLORASMAP 0
#define PROP_EMISSIONMAPUV 0
#define PROP_EMISSIONMASKUV 0
#define PROP_EMISSIONSTRENGTH 2
#define PROP_EMISSIONHUESHIFTENABLED 0
#define PROP_EMISSIONHUESHIFT 0
#define PROP_EMISSIONHUESHIFTSPEED 5
#define PROPM_START_CENTEROUTEMISSION 1
#define PROP_EMISSIONCENTEROUTENABLED 0
#define PROP_EMISSIONCENTEROUTSPEED 5
#define PROPM_END_CENTEROUTEMISSION 0
#define PROPM_START_GLOWINDARKEMISSIONOPTIONS 0
#define PROP_ENABLEGITDEMISSION 0
#define PROP_GITDEWORLDORMESH 0
#define PROP_GITDEMINEMISSIONMULTIPLIER 1
#define PROP_GITDEMAXEMISSIONMULTIPLIER 0
#define PROP_GITDEMINLIGHT 0
#define PROP_GITDEMAXLIGHT 1
#define PROPM_END_GLOWINDARKEMISSIONOPTIONS 0
#define PROPM_START_BLINKINGEMISSIONOPTIONS 0
#define PROP_EMISSIONBLINKINGENABLED 0
#define PROP_EMISSIVEBLINK_MIN 0
#define PROP_EMISSIVEBLINK_MAX 1
#define PROP_EMISSIVEBLINK_VELOCITY 4
#define PROP_EMISSIONBLINKINGOFFSET 0
#define PROPM_END_BLINKINGEMISSIONOPTIONS 0
#define PROPM_START_SCROLLINGEMISSIONOPTIONS 0
#define PROP_SCROLLINGEMISSION 0
#define PROP_EMISSIONSCROLLINGUSECURVE 0
#define PROP_EMISSIONSCROLLINGVERTEXCOLOR 0
#define PROP_EMISSIVESCROLL_WIDTH 10
#define PROP_EMISSIVESCROLL_VELOCITY 10
#define PROP_EMISSIVESCROLL_INTERVAL 20
#define PROP_EMISSIONSCROLLINGOFFSET 0
#define PROPM_END_SCROLLINGEMISSIONOPTIONS 0
#define PROPM_START_EMISSIONAUDIOLINK 0
#define PROP_ENABLEEMISSIONSTRENGTHAUDIOLINK 0
#define PROP_AUDIOLINKEMISSIONSTRENGTHBAND 0
#define PROP_ENABLEEMISSIONCENTEROUTAUDIOLINK 0
#define PROP_EMISSIONCENTEROUTAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSIONCENTEROUTBAND 0
#define PROP_EMISSIONCENTEROUTADDAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSIONCENTEROUTADDBAND 0
#define PROP_AUDIOLINKADDEMISSIONBAND 0
#define PROPM_END_EMISSIONAUDIOLINK 0
#define PROPM_END_EMISSIONOPTIONS 0
#define PROPM_START_EMISSION1OPTIONS 0
#define PROP_ENABLEEMISSION1 0
#define PROP_EMISSIONBASECOLORASMAP1 0
#define PROP_EMISSIONMAP1UV 0
#define PROP_EMISSIONMASK1UV 0
#define PROP_EMISSIONSTRENGTH1 0
#define PROP_EMISSIONHUESHIFTENABLED1 0
#define PROP_EMISSIONHUESHIFT1 0
#define PROP_EMISSIONHUESHIFTSPEED1 0
#define PROPM_START_CENTEROUTEMISSION1 0
#define PROP_EMISSIONCENTEROUTENABLED1 0
#define PROP_EMISSIONCENTEROUTSPEED1 5
#define PROPM_END_CENTEROUTEMISSION1 0
#define PROPM_START_GLOWINDARKEMISSIONOPTIONS1 0
#define PROP_ENABLEGITDEMISSION1 0
#define PROP_GITDEWORLDORMESH1 0
#define PROP_GITDEMINEMISSIONMULTIPLIER1 1
#define PROP_GITDEMAXEMISSIONMULTIPLIER1 0
#define PROP_GITDEMINLIGHT1 0
#define PROP_GITDEMAXLIGHT1 1
#define PROPM_END_GLOWINDARKEMISSIONOPTIONS1 0
#define PROPM_START_BLINKINGEMISSIONOPTIONS1 0
#define PROP_EMISSIONBLINKINGENABLED1 0
#define PROP_EMISSIVEBLINK_MIN1 0
#define PROP_EMISSIVEBLINK_MAX1 1
#define PROP_EMISSIVEBLINK_VELOCITY1 4
#define PROP_EMISSIONBLINKINGOFFSET1 0
#define PROPM_END_BLINKINGEMISSIONOPTIONS1 0
#define PROPM_START_SCROLLINGEMISSIONOPTIONS1 0
#define PROP_SCROLLINGEMISSION1 0
#define PROP_EMISSIONSCROLLINGUSECURVE1 0
#define PROP_EMISSIONSCROLLINGVERTEXCOLOR1 0
#define PROP_EMISSIVESCROLL_WIDTH1 10
#define PROP_EMISSIVESCROLL_VELOCITY1 10
#define PROP_EMISSIVESCROLL_INTERVAL1 20
#define PROP_EMISSIONSCROLLINGOFFSET1 0
#define PROPM_END_SCROLLINGEMISSION1OPTIONS 0
#define PROPM_START_EMISSION1AUDIOLINK 0
#define PROP_ENABLEEMISSION1STRENGTHAUDIOLINK 0
#define PROP_AUDIOLINKEMISSION1STRENGTHBAND 0
#define PROP_ENABLEEMISSION1CENTEROUTAUDIOLINK 0
#define PROP_EMISSION1CENTEROUTAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSION1CENTEROUTBAND 0
#define PROP_EMISSION1CENTEROUTADDAUDIOLINKWIDTH 1
#define PROP_AUDIOLINKEMISSION1CENTEROUTADDBAND 0
#define PROP_AUDIOLINKADDEMISSION1BAND 0
#define PROPM_END_EMISSION1AUDIOLINK 0
#define PROPM_END_EMISSION1OPTIONS 0
#define PROPM_START_PATHING 0
#define PROP_ENABLEPATHING 0
#define PROP_PATHINGMAPUV 0
#define PROP_PATHINGCOLORMAPUV 0
#define PROP_PATHTYPER 0
#define PROP_PATHTYPEG 0
#define PROP_PATHTYPEB 0
#define PROPM_START_PATHAUDIOLINK 0
#define PROP_AUDIOLINKPATHTIMEOFFSETBANDR 0
#define PROP_AUDIOLINKPATHTIMEOFFSETBANDG 0
#define PROP_AUDIOLINKPATHTIMEOFFSETBANDB 0
#define PROP_AUDIOLINKPATHEMISSIONADDBANDR 0
#define PROP_AUDIOLINKPATHEMISSIONADDBANDG 0
#define PROP_AUDIOLINKPATHEMISSIONADDBANDB 0
#define PROP_AUDIOLINKPATHWIDTHOFFSETBANDR 0
#define PROP_AUDIOLINKPATHWIDTHOFFSETBANDG 0
#define PROP_AUDIOLINKPATHWIDTHOFFSETBANDB 0
#define PROPM_END_PATHAUDIOLINK 0
#define PROPM_END_PATHING 0
#define PROPM_START_FLIPBOOK 0
#define PROP_ENABLEFLIPBOOK 0
#define PROP_FLIPBOOKALPHACONTROLSFINALALPHA 0
#define PROP_FLIPBOOKINTENSITYCONTROLSALPHA 0
#define PROP_FLIPBOOKCOLORREPLACES 0
#define PROP_FLIPBOOKTEXARRAYUV 0
#define PROP_FLIPBOOKMASKUV 0
#define PROP_FLIPBOOKTOTALFRAMES 1
#define PROP_FLIPBOOKFPS 30
#define PROP_FLIPBOOKTILED 0
#define PROP_FLIPBOOKEMISSIONSTRENGTH 0
#define PROP_FLIPBOOKROTATION 0
#define PROP_FLIPBOOKROTATIONSPEED 0
#define PROP_FLIPBOOKREPLACE 1
#define PROP_FLIPBOOKMULTIPLY 0
#define PROP_FLIPBOOKADD 0
#define PROPM_START_FLIPBOOKAUDIOLINK 0
#define PROP_AUDIOLINKFLIPBOOKSCALEBAND 0
#define PROP_AUDIOLINKFLIPBOOKALPHABAND 0
#define PROP_AUDIOLINKFLIPBOOKEMISSIONBAND 0
#define PROP_AUDIOLINKFLIPBOOKFRAMEBAND 0
#define PROPM_END_FLIPBOOKAUDIOLINK 0
#define PROPM_START_MANUALFLIPBOOKCONTROL 0
#define PROP_FLIPBOOKCURRENTFRAME -1
#define PROPM_END_MANUALFLIPBOOKCONTROL 0
#define PROPM_START_CROSSFADE 0
#define PROP_FLIPBOOKCROSSFADEENABLED 0
#define PROPM_END_CROSSFADE 0
#define PROPM_START_FLIPBOOKHUESHIFT 0
#define PROP_FLIPBOOKHUESHIFTENABLED 0
#define PROP_FLIPBOOKHUESHIFTSPEED 0
#define PROP_FLIPBOOKHUESHIFT 0
#define PROPM_END_FLIPBOOKHUESHIFT 0
#define PROPM_END_FLIPBOOK 0
#define PROPM_START_DISSOLVE 0
#define PROP_ENABLEDISSOLVE 0
#define PROP_DISSOLVETYPE 1
#define PROP_DISSOLVEEDGEWIDTH 0.025
#define PROP_DISSOLVEEDGEHARDNESS 0.5
#define PROP_DISSOLVEEDGEEMISSION 0
#define PROP_DISSOLVETOTEXTUREUV 0
#define PROP_DISSOLVETOEMISSIONSTRENGTH 0
#define PROP_DISSOLVENOISETEXTUREUV 0
#define PROP_DISSOLVEINVERTNOISE 0
#define PROP_DISSOLVEDETAILNOISEUV 0
#define PROP_DISSOLVEINVERTDETAILNOISE 0
#define PROP_DISSOLVEDETAILSTRENGTH 0.1
#define PROP_DISSOLVEALPHA 0
#define PROP_DISSOLVEUSEVERTEXCOLORS 0
#define PROP_DISSOLVEMASKUV 0
#define PROP_DISSOLVEMASKINVERT 0
#define PROP_CONTINUOUSDISSOLVE 0
#define PROPM_START_DISSOLVEMASKING 0
#define PROP_DISSOLVEEMISSIONSIDE 2
#define PROP_DISSOLVEEMISSION1SIDE 2
#define PROPM_END_DISSOLVEMASKING 0
#define PROPM_START_POINTTOPOINT 0
#define PROP_DISSOLVEP2PWORLDLOCAL 0
#define PROP_DISSOLVEP2PEDGELENGTH 0.1
#define PROPM_END_POINTTOPOINT 0
#define PROPM_START_DISSOLVEHUESHIFT 0
#define PROP_DISSOLVEHUESHIFTENABLED 0
#define PROP_DISSOLVEHUESHIFTSPEED 0
#define PROP_DISSOLVEHUESHIFT 0
#define PROP_DISSOLVEEDGEHUESHIFTENABLED 0
#define PROP_DISSOLVEEDGEHUESHIFTSPEED 0
#define PROP_DISSOLVEEDGEHUESHIFT 0
#define PROPM_END_DISSOLVEHUESHIFT 0
#define PROPM_START_BONUSSLIDERS 0
#define PROP_DISSOLVEALPHA0 0
#define PROP_DISSOLVEALPHA1 0
#define PROP_DISSOLVEALPHA2 0
#define PROP_DISSOLVEALPHA3 0
#define PROP_DISSOLVEALPHA4 0
#define PROP_DISSOLVEALPHA5 0
#define PROP_DISSOLVEALPHA6 0
#define PROP_DISSOLVEALPHA7 0
#define PROP_DISSOLVEALPHA8 0
#define PROP_DISSOLVEALPHA9 0
#define PROPM_END_BONUSSLIDERS 0
#define PROPM_START_DISSOLVEAUDIOLINK 0
#define PROP_ENABLEDISSOLVEAUDIOLINK 0
#define PROP_AUDIOLINKDISSOLVEALPHABAND 0
#define PROP_AUDIOLINKDISSOLVEDETAILBAND 0
#define PROPM_END_DISSOLVEAUDIOLINK 0
#define PROPM_END_DISSOLVE 0
#define PROPM_START_PANOSPHEREOPTIONS 0
#define PROP_PANOTOGGLE 0
#define PROP_PANOINFINITESTEREOTOGGLE 0
#define PROP_PANOMASKUV 0
#define PROP_PANOEMISSION 0
#define PROP_PANOBLEND 0
#define PROP_PANOCUBEMAPTOGGLE 0
#define PROPM_END_PANOSPHEREOPTIONS 0
#define PROPM_START_GLITTER 0
#define PROP_GLITTERENABLE 0
#define PROP_GLITTERMODE 0
#define PROP_GLITTERSHAPE 0
#define PROP_GLITTERBLENDTYPE 0
#define PROP_GLITTERUSESURFACECOLOR 0
#define PROP_GLITTERCOLORMAPUV 0
#define PROP_GLITTERMASKUV 0
#define PROP_GLITTERTEXTUREROTATION 0
#define PROP_GLITTERFREQUENCY 300
#define PROP_GLITTERJITTER 1
#define PROP_GLITTERSPEED 10
#define PROP_GLITTERSIZE 0.3
#define PROP_GLITTERCONTRAST 300
#define PROP_GLITTERANGLERANGE 90
#define PROP_GLITTERMINBRIGHTNESS 0
#define PROP_GLITTERBRIGHTNESS 3
#define PROP_GLITTERBIAS 0.8
#define PROP_GLITTERHIDEINSHADOW 0
#define PROP_GLITTERCENTERSIZE 0.08
#define PROP_GLITTERFREQUENCYLINEAREMISSIVE 20
#define PROP_GLITTERJAGGYFIX 0
#define PROPM_START_GLITTERHUESHIFT 0
#define PROP_GLITTERHUESHIFTENABLED 0
#define PROP_GLITTERHUESHIFTSPEED 0
#define PROP_GLITTERHUESHIFT 0
#define PROPM_END_GLITTERHUESHIFT 0
#define PROPM_START_GLITTERRANDOM 0
#define PROP_GLITTERRANDOMCOLORS 0
#define PROP_GLITTERRANDOMSIZE 0
#define PROP_GLITTERRANDOMROTATION 0
#define PROPM_END_GLITTERRANDOM 0
#define PROPM_END_GLITTER 0
#define PROPM_START_TEXT 0
#define PROP_TEXTPIXELRANGE 4
#define PROP_TEXTENABLED 0
#define PROPM_START_TEXTFPS 0
#define PROP_TEXTFPSENABLED 0
#define PROP_TEXTFPSUV 0
#define PROP_TEXTFPSEMISSIONSTRENGTH 0
#define PROP_TEXTFPSROTATION 0
#define PROPM_END_TEXTFPS 0
#define PROPM_START_TEXTPOSITION 0
#define PROP_TEXTPOSITIONENABLED 0
#define PROP_TEXTPOSITIONUV 0
#define PROP_TEXTPOSITIONEMISSIONSTRENGTH 0
#define PROP_TEXTPOSITIONROTATION 0
#define PROPM_END_TEXTPOSITION 0
#define PROPM_START_TEXTINSTANCETIME 0
#define PROP_TEXTTIMEENABLED 0
#define PROP_TEXTTIMEUV 0
#define PROP_TEXTTIMEEMISSIONSTRENGTH 0
#define PROP_TEXTTIMEROTATION 0
#define PROPM_END_TEXTINSTANCETIME 0
#define PROPM_END_TEXT 0
#define PROPM_START_MIRROROPTIONS 0
#define PROP_ENABLEMIRROROPTIONS 0
#define PROP_MIRROR 0
#define PROP_ENABLEMIRRORTEXTURE 0
#define PROP_MIRRORTEXTUREUV 0
#define PROPM_END_MIRROROPTIONS 0
#define PROPM_START_DISTANCEFADE 0
#define PROP_MAINFADETEXTUREUV 0
#define PROP_MAINFADETYPE 1
#define PROP_MAINMINALPHA 0
#define PROP_MAINMAXALPHA 1
#define PROP_MAINDISTANCEFADEMIN 0
#define PROP_MAINDISTANCEFADEMAX 0
#define PROPM_END_DISTANCEFADE 0
#define PROPM_START_ANGULARFADE 0
#define PROP_ENABLERANDOM 0
#define PROP_ANGLETYPE 0
#define PROP_ANGLECOMPARETO 0
#define PROP_CAMERAANGLEMIN 45
#define PROP_CAMERAANGLEMAX 90
#define PROP_MODELANGLEMIN 45
#define PROP_MODELANGLEMAX 90
#define PROP_ANGLEMINALPHA 0
#define PROPM_END_ANGULARFADE 0
#define PROPM_START_DISTORTIONFLOW 0
#define PROP_ENABLEDISTORTION 0
#define PROP_DISTORTIONMASKUV 0
#define PROP_DISTORTIONSTRENGTH 0.5
#define PROP_DISTORTIONSTRENGTH1 0.5
#define PROPM_START_DISTORTIONAUDIOLINK 0
#define PROP_ENABLEDISTORTIONAUDIOLINK 0
#define PROP_DISTORTIONSTRENGTHAUDIOLINKBAND 0
#define PROP_DISTORTIONSTRENGTH1AUDIOLINKBAND 0
#define PROPM_END_DISTORTIONAUDIOLINK 0
#define PROPM_END_DISTORTIONFLOW 0
#define PROPM_START_AUDIOLINK 0
#define PROP_ENABLEAUDIOLINK 0
#define PROP_AUDIOLINKHELP 0
#define PROP_AUDIOLINKANIMTOGGLE 1
#define PROP_AUDIOLINKDELAY 0
#define PROP_AUDIOLINKAVERAGING 0
#define PROP_AUDIOLINKAVERAGERANGE 0.5
#define PROPM_START_AUDIOLINKDEBUG 0
#define PROP_ENABLEAUDIOLINKDEBUG 0
#define PROP_AUDIOLINKDEBUGTREBLE 0
#define PROP_AUDIOLINKDEBUGHIGHMID 0
#define PROP_AUDIOLINKDEBUGLOWMID 0
#define PROP_AUDIOLINKDEBUGBASS 0
#define PROP_AUDIOLINKDEBUGANIMATE 0
#define PROP_AUDIOLINKTEXTUREVISUALIZATION 0
#define PROPM_END_AUDIOLINKDEBUG 0
#define PROPM_END_AUDIOLINK 0
#define PROPM_PATREON 0
#define PROP_PATREONHELPBOX 0
#define PROPM_START_VIDEO 0
#define PROPM_START_VIDEOSETTINGS 0
#define PROPM_END_VIDEOSETTINGS 0
#define PROPM_START_VIDEODEBUG 0
#define PROPM_END_VIDEODEBUG 0
#define PROPM_START_CRT 0
#define PROPM_END_CRT 0
#define PROPM_START_GAMEBOY 0
#define PROPM_END_GAMEBOY 0
#define PROPM_END_VIDEO 0
#define PROPM_START_TOUCHOPTIONS 0
#define PROPM_START_BULGE 0
#define PROPM_END_BULGE 0
#define PROPM_START_TOUCHGLOW 0
#define PROPM_END_TOUCHGLOW 0
#define PROPM_END_TOUCHOPTIONS 0
#define PROPM_START_HOLOGRAM 0
#define PROPM_START_FRESNELALPHA 0
#define PROPM_END_FRESNELALPHA 0
#define PROPM_END_HOLOGRAM 0
#define PROPM_START_GRABPASS 0
#define PROPM_START_REFRACTION 0
#define PROPM_END_REFRACTION 0
#define PROPM_START_BLUR 0
#define PROPM_END_BLUR 0
#define PROPM_END_GRABPASS 0
#define PROPM_START_IRIDESCENCE 0
#define PROPM_END_IRIDESCENCE 0
#define PROPM_START_VERTEXGLITCH 0
#define PROPM_END_VERTEXGLITCH 0
#define PROPM_START_SPAWNS 0
#define PROPM_START_SCIFISPAWNIN 0
#define PROPM_END_SCIFISPAWNIN 0
#define PROPM_END_SPAWNS 0
#define PROPM_START_VORONOI 0
#define PROPM_START_VORONOIRANDOM 0
#define PROPM_END_VORONOIRANDOM 0
#define PROPM_END_VORONOI 0
#define PROPM_START_BLACKLIGHT 0
#define PROPM_END_BLACKLIGHT 0
#define PROPM_OUTLINEOPTIONS 0
#define PROP_COMMENTIFZERO_ENABLEOUTLINEPASS 0
#define PROP_OUTLINEMODE 0
#define PROP_OUTLINETINTMIX 0
#define PROP_OUTLINERIMLIGHTBLEND 0
#define PROP_OUTLINEFIXEDSIZE 0
#define PROP_OUTLINESMAXDISTANCE 9999
#define PROP_OUTLINEUSEVERTEXCOLORS 0
#define PROP_OUTLINELIT 1
#define PROP_LINEWIDTH 0
#define PROP_OUTLINEEMISSION 0
#define PROP_OUTLINETEXTUREUV 0
#define PROP_OUTLINEMASKUV 0
#define PROP_OUTLINESHADOWSTRENGTH 1
#define PROP_OUTLINEHUESHIFT 0
#define PROP_OUTLINEHUEOFFSET 0
#define PROP_OUTLINEHUEOFFSETSPEED 0
#define PROPM_START_OUTLINEADVANCED 0
#define PROP_OUTLINECULL 1
#define PROP_OUTLINEOFFSETFACTOR 0
#define PROP_OUTLINEOFFSETUNITS 0
#define PROPM_END_OUTLINEADVANCED 0
#define PROPM_PARALLAXMAP 0
#define PROP_PARALLAXMAP 0
#define PROP_PARALLAXHEIGHTMAPENABLED 0
#define PROP_PARALLAXINTERNALMAPENABLED 0
#define PROPM_START_PARALLAXHEIGHTMAP 0
#define PROP_PARALLAXUV 0
#define PROP_PARALLAXHEIGHTMAPMASKUV 0
#define PROP_PARALLAXSTRENGTH 0
#define PROPM_END_PARALLAXHEIGHTMAP 0
#define PROPM_START_PARALLAXINTERNAL 0
#define PROP_PARALLAXINTERNALHEIGHTMAPMODE 0
#define PROP_PARALLAXINTERNALHEIGHTFROMALPHA 0
#define PROP_PARALLAXINTERNALMAPMASKUV 0
#define PROP_PARALLAXINTERNALITERATIONS 1
#define PROP_PARALLAXINTERNALMINDEPTH 0
#define PROP_PARALLAXINTERNALMAXDEPTH 1
#define PROP_PARALLAXINTERNALMINFADE 0
#define PROP_PARALLAXINTERNALMAXFADE 1
#define PROPM_END_PARALLAXINTERNAL 0
#define PROPM_START_PARALLAXADVANCED 0
#define PROP_PARALLAXBIAS 0.42
#define PROPM_END_PARALLAXADVANCED 0
#define PROPM_POSTPROCESSING 0
#define PROP_PPHELP 0
#define PROP_PPLIGHTINGMULTIPLIER 1
#define PROP_PPEMISSIONMULTIPLIER 1
#define PROPM_RENDERINGOPTIONS 0
#define PROP_CULL 2
#define PROP_ZTEST 4
#define PROP_ZWRITE 1
#define PROP_COLORMASK 15
#define PROP_OFFSETFACTOR 0
#define PROP_OFFSETUNITS 0
#define PROP_IGNOREFOG 0
#define PROPINSTANCING 0
#define PROPM_START_BLENDING 0
#define PROP_BLENDOP 0
#define PROP_BLENDOPALPHA 0
#define PROP_SRCBLEND 1
#define PROP_DSTBLEND 0
#define PROPM_END_BLENDING 0
#define PROPM_START_STENCILPASSOPTIONS 0
#define PROP_STENCILREF 0
#define PROP_STENCILREADMASK 255
#define PROP_STENCILWRITEMASK 255
#define PROP_STENCILPASSOP 0
#define PROP_STENCILFAILOP 0
#define PROP_STENCILZFAILOP 0
#define PROP_STENCILCOMPAREFUNCTION 8
#define PROPM_END_STENCILPASSOPTIONS 0
#define PROPM_START_OUTLINESTENCIL 0
#define PROP_OUTLINESTENCILREF 0
#define PROP_OUTLINESTENCILREADMASK 255
#define PROP_OUTLINESTENCILWRITEMASK 255
#define PROP_OUTLINESTENCILPASSOP 0
#define PROP_OUTLINESTENCILFAILOP 0
#define PROP_OUTLINESTENCILZFAILOP 0
#define PROP_OUTLINESTENCILCOMPAREFUNCTION 8
#define PROPM_END_OUTLINESTENCIL 0
#define PROPM_START_DEBUGOPTIONS 0
#define PROP_DEBUGENABLED 0
#define PROP_VERTEXUNWRAP 0
#define PROP_DEBUGMESHDATA 0
#define PROP_DEBUGLIGHTINGDATA 0
#define PROP_DEBUGCAMERADATA 0
#define PROPM_END_DEBUGOPTIONS 0

            #pragma target 5.0
            #define POI_META_PASS
            float _Mode;
            #pragma vertex vert
            #pragma fragment frag
            #include "../Includes/CGI_PoiPass.cginc"
            ENDCG
        }
    }
}

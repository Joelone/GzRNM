Shader "GzRNMPro/SM2/Alpha Cutout/RNM Bumped Diffuse" {
	Properties {
		_Color				("Color", Color) = (1,1,1,1)
		_MainTex 			("Albedo", 2D) = "white" {}
		_BumpMap 			("Normal Map", 2D) = "bump" {}
		_Cutoff				("Alpha cutoff", Range(0,1)) = 0.5
		unity_Lightmap  	("RNM X Component", 2D) = "black" {}
		unity_LightmapInd 	("RNM Y Component", 2D) = "black" {}
		unity_LightmapC		("RNM Z Component", 2D) = "black" {}
		_deval				("INTERNAL", Float) = 0
	}
	SubShader {
		Tags {"IgnoreProjector"="True" "RenderType"="TransparentCutout"}
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert vertex:vert nolightmap alphatest:_Cutoff
		#pragma glsl
		#include "../GzRNMInc.cginc"
		float4		_Color;
		sampler2D 	_MainTex;
		sampler2D 	_BumpMap;
		sampler2D 	unity_Lightmap;
		sampler2D 	unity_LightmapInd;
		sampler2D	unity_LightmapC;
		float		_deval;

		struct Input {
			float2 uv_MainTex;
			float2 uv_BumpMap;
			float2 lmapUV;
		};
		
		float4 unity_LightmapST;
		void vert(inout appdata_full v, out Input o)
		{
			LUVACCESS;
		}
		
		inline half3 CalcCRNM(Input IN, SurfaceOutput o)
		{
			half3 light;
			RNMBASIS;
			RNMDECODE;
			RNMCOMPUTE;
			return light * o.Albedo;
		}

		void surf (Input IN, inout SurfaceOutput o) {
			half4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
			o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
			o.Emission = CalcCRNM(IN, o);
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}

#pragma once

#include "..\Common\DeviceResources.h"
#include "ShaderStructures.h"
#include "..\Common\StepTimer.h"
#include <vector>
#include "DDSTextureLoader.h"

namespace ACW
{
	// This sample renderer instantiates a basic rendering pipeline.
	class Sample3DSceneRenderer
	{
	public:
		Sample3DSceneRenderer(const std::shared_ptr<DX::DeviceResources>& deviceResources);
		void CreateDeviceDependentResources();
		void CreateWindowSizeDependentResources();
		void ReleaseDeviceDependentResources();
		void Update(DX::StepTimer const& timer, const std::vector<bool>& pInput);
		void Render();

	private:
		void DrawSpheres();
		void DrawFractals();
		void DrawTerrain();
		void DrawPlants();
		void DrawWater();
		void DrawSeaObject();
		void DrawSeaObject2();
		void DrawSeaObject3();
		void DrawSeaBubles();
		void DrawFish();
		void DrawFish2();
		void DrawFish3();
		void CreateBuffers();
		void SetBuffers();

		void CreateBlendStates();
		void CreateDepthStencils();
		void CreateRasteriserStates();
		void CreateSamplerState();

	private:
		//Cached pointer to device resources.
		std::shared_ptr<DX::DeviceResources> m_deviceResources;
		Microsoft::WRL::ComPtr<ID3D11DeviceContext3> mContext;

		//Input layout for vertex data
		Microsoft::WRL::ComPtr<ID3D11InputLayout>	m_inputLayout;

		//Cube vertices/indices
		Microsoft::WRL::ComPtr<ID3D11Buffer>		m_vertexBuffer;
		Microsoft::WRL::ComPtr<ID3D11Buffer>		m_indexBuffer;

		//Plant vertices/indicess
		Microsoft::WRL::ComPtr<ID3D11Buffer> mPlantVertexBuffer;
		Microsoft::WRL::ComPtr<ID3D11Buffer> mPlantIndexBuffer;

		//Terrain shaders
		Microsoft::WRL::ComPtr<ID3D11VertexShader> mVertexShaderTerrain;
		Microsoft::WRL::ComPtr<ID3D11PixelShader> mPixelShaderTerrain;
		Microsoft::WRL::ComPtr<ID3D11HullShader> mHullShaderTerrain;
		Microsoft::WRL::ComPtr<ID3D11DomainShader> mDomainShaderTerrain;

		//Spheres shaders
		Microsoft::WRL::ComPtr<ID3D11VertexShader> mVertexShaderSpheres;
		Microsoft::WRL::ComPtr<ID3D11PixelShader> mPixelShaderSpheres;

		//Plant shaders
		Microsoft::WRL::ComPtr<ID3D11VertexShader> mVertexShaderPlants;
		Microsoft::WRL::ComPtr<ID3D11PixelShader> mPixelShaderPlants;
		Microsoft::WRL::ComPtr<ID3D11GeometryShader> mGeometryShaderPlants;

		//Fractal shaders
		Microsoft::WRL::ComPtr<ID3D11VertexShader> mVertexShaderFractals;
		Microsoft::WRL::ComPtr<ID3D11PixelShader> mPixelShaderFractals;

		//SeaObject shaders
		Microsoft::WRL::ComPtr<ID3D11Buffer> mSeaObjectVertexBuffer;
		Microsoft::WRL::ComPtr<ID3D11Buffer> mSeaObjectIndexBuffer;
		Microsoft::WRL::ComPtr<ID3D11VertexShader> mSeaObjectvertexShader;
		Microsoft::WRL::ComPtr<ID3D11PixelShader> mSeaObjectpixelShader;
		Microsoft::WRL::ComPtr<ID3D11GeometryShader> mSeaObjectGeometryShader;

		//SeaObject2 shaders
		Microsoft::WRL::ComPtr<ID3D11Buffer> mSeaObject2VertexBuffer;
		Microsoft::WRL::ComPtr<ID3D11Buffer> mSeaObject2IndexBuffer;
		Microsoft::WRL::ComPtr<ID3D11VertexShader> mSeaObject2vertexShader;
		Microsoft::WRL::ComPtr<ID3D11PixelShader> mSeaObject2pixelShader;

		//SeaObject3 shaders
		Microsoft::WRL::ComPtr<ID3D11Buffer> mSeaObject3VertexBuffer;
		Microsoft::WRL::ComPtr<ID3D11Buffer> mSeaObject3IndexBuffer;
		Microsoft::WRL::ComPtr<ID3D11VertexShader> mSeaObject3vertexShader;
		Microsoft::WRL::ComPtr<ID3D11PixelShader> mSeaObject3pixelShader;
		Microsoft::WRL::ComPtr<ID3D11DomainShader> mSeaObject3DomainShader;
		Microsoft::WRL::ComPtr<ID3D11HullShader> mSeaObject3HullShader;

		//SeaBubbles shaders
		Microsoft::WRL::ComPtr<ID3D11Buffer> mSeaBubblesVertexBuffer;
		Microsoft::WRL::ComPtr<ID3D11Buffer> mSeaBubblesIndexBuffer;
		Microsoft::WRL::ComPtr<ID3D11VertexShader> mSeaBubblesvertexShader;
		Microsoft::WRL::ComPtr<ID3D11PixelShader> mSeaBubblespixelShader;
		Microsoft::WRL::ComPtr<ID3D11GeometryShader>mSeaBubblesGeometryShader;

		//Water shaders
		Microsoft::WRL::ComPtr<ID3D11VertexShader> mVertexShaderWater;
		Microsoft::WRL::ComPtr<ID3D11PixelShader> mPixelShaderWater;
		Microsoft::WRL::ComPtr<ID3D11HullShader> mHullShaderWater;
		Microsoft::WRL::ComPtr<ID3D11DomainShader> mDomainShaderWater;

		//fish
		Microsoft::WRL::ComPtr<ID3D11Buffer> fishVertexBuffer;
		Microsoft::WRL::ComPtr<ID3D11Buffer> fishIndexBuffer;
		Microsoft::WRL::ComPtr<ID3D11VertexShader> fishVertexShader;
		Microsoft::WRL::ComPtr<ID3D11PixelShader> fishPixelShader;
		Microsoft::WRL::ComPtr<ID3D11GeometryShader> fishGeometryShader;

		//fish2
		Microsoft::WRL::ComPtr<ID3D11Buffer> fish2VertexBuffer;
		Microsoft::WRL::ComPtr<ID3D11Buffer> fish2IndexBuffer;
		Microsoft::WRL::ComPtr<ID3D11VertexShader> fish2VertexShader;
		Microsoft::WRL::ComPtr<ID3D11PixelShader> fish2PixelShader;
		Microsoft::WRL::ComPtr<ID3D11GeometryShader> fish2GeometryShader;

		//fish3
		Microsoft::WRL::ComPtr<ID3D11Buffer> fish3VertexBuffer;
		Microsoft::WRL::ComPtr<ID3D11Buffer> fish3IndexBuffer;
		Microsoft::WRL::ComPtr<ID3D11VertexShader> fish3VertexShader;
		Microsoft::WRL::ComPtr<ID3D11PixelShader> fish3PixelShader;
		Microsoft::WRL::ComPtr<ID3D11GeometryShader> fish3GeometryShader;

		//Rasteriser states
		Microsoft::WRL::ComPtr<ID3D11RasterizerState> mDefaultRasteriser;
		Microsoft::WRL::ComPtr<ID3D11RasterizerState> mWireframeRasteriser;

		//Texture/Sampler
		Microsoft::WRL::ComPtr<ID3D11ShaderResourceView> mPlantTexture;
		Microsoft::WRL::ComPtr<ID3D11SamplerState> mSampler;

		//Blend states
		Microsoft::WRL::ComPtr<ID3D11BlendState> mAlphaBlend;
		Microsoft::WRL::ComPtr<ID3D11BlendState> mNoBlend;

		//Depth stencils
		Microsoft::WRL::ComPtr<ID3D11DepthStencilState> mDepthLessThanEqual;
		Microsoft::WRL::ComPtr<ID3D11DepthStencilState> mDepthLessThanEqualAll;

		//Constant buffers pointers
		Microsoft::WRL::ComPtr<ID3D11Buffer>		m_constantBufferCamera;
		Microsoft::WRL::ComPtr<ID3D11Buffer>		mConstantBufferLight;
		Microsoft::WRL::ComPtr<ID3D11Buffer>		mConstantBufferTime;

		//Constant buffers data
		ModelViewProjectionConstantBuffer	m_constantBufferDataCamera;
		LightConstantBuffer mConstantBufferDataLight;
		TimeConstantBuffer mConstantBufferDataTime;

		//Variables
		uint32	m_indexCount;
		uint32 mPlantIndex;
		uint32 mSnakeIndex;
		bool	m_loadingComplete;
		DirectX::XMVECTOR eye = { 0, 4, -12, 1 };
		DirectX::XMVECTOR at = { 0.0f, 5.0f, 1.0f, 0.0f };
		DirectX::XMVECTOR up = { 0.0f, 1.0f, 0.0f, 0.0f };
		DirectX::XMMATRIX lookAt;
		uint32 fishIndex;
	};
}


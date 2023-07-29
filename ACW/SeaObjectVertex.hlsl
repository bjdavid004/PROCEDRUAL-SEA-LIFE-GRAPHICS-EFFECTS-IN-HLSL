//Diamond Coral
cbuffer ModelViewProjectionConstantBuffer : register(b0)
{
    matrix model;
    matrix view;
    matrix projection;
};

struct VertexShaderInput
{
    float3 pos : POSITION;
    float3 color : COLOR0;
};

cbuffer timeConstantBuffer : register(b1)
{
    float time;
    float3 padding;
}

struct PixelShaderInput
{
    float4 pos : SV_POSITION;
    float3 color : COLOR0;
};

PixelShaderInput main(VertexShaderInput input)
{
    PixelShaderInput output;
    float4 pos = float4(input.pos, 1.0f);
    output.pos = pos;
    output.color = input.color;
    output.pos.xyz *= 16.45f;
    output.pos.x += 1.75f;
    output.pos.z += 5;
    output.pos.y -= 7.205f;
    return output;
}

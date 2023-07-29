//Diamond Coral
cbuffer ModelViewProjectionConstantBuffer : register(b0)
{
    matrix model;
    matrix view;
    matrix projection;
};

struct GeometryShaderInput
{
    float4 pos : SV_POSITION;
    float3 color : COLOR0;
};

struct PixelShaderInput
{
    float4 pos : SV_POSITION;
    float3 color : COLOR0;
    float2 uv : TEXCOORD0;
};

cbuffer timeConstantBuffer : register(b1)
{
    float time;
    float3 padding;
}

// Define the geometry shader
[maxvertexcount(9)]
void main(triangle GeometryShaderInput input[3], inout TriangleStream<PixelShaderInput> OutputStream)
{
    // the flower petal shape by manipulating the input vertex position
    float4 pos1 = input[0].pos + float4(0.0, 0.0, 0.0, 0.0);
    float4 pos2 = input[0].pos + float4(0.15, 0.75, 0.0, 0.0);
    float4 pos3 = input[0].pos + float4(-0.15, 0.75, 0.0, 0.0);
    float4 pos4 = input[0].pos + float4(0.45, 0.45, 0.0, 0.0);
    float4 pos5 = input[0].pos + float4(-0.45, 0.45, 0.0, 0.0);

    // Transforming the vertices using the model, view, and projection matrices
    pos1 = mul(pos1, model);
    pos1 = mul(pos1, view);
    pos1 = mul(pos1, projection);
    pos2 = mul(pos2, model);
    pos2 = mul(pos2, view);
    pos2 = mul(pos2, projection);
    pos3 = mul(pos3, model);
    pos3 = mul(pos3, view);
    pos3 = mul(pos3, projection);
    pos4 = mul(pos4, model);
    pos4 = mul(pos4, view);
    pos4 = mul(pos4, projection);
    pos5 = mul(pos5, model);
    pos5 = mul(pos5, view);
    pos5 = mul(pos5, projection);

    // Defining the pixel shader input vertices and their properties

    for (uint i = 0; i < 5; i++)
    {
        PixelShaderInput output = (PixelShaderInput)0;
        output.pos = pos1;
        output.color = input[0].color;
        output.uv = float2(0.5, 0.5);
        OutputStream.Append(output);

        output.pos = pos2;
        output.color = input[0].color;
        output.uv = float2(1.0, 0.5);
        OutputStream.Append(output);

        output.pos = pos3;
        output.color = input[0].color;
        output.uv = float2(0.0, 0.5);
        OutputStream.Append(output);

        output.pos = pos4;
        output.color = input[0].color;
        output.uv = float2(0.5, 1.0);
        OutputStream.Append(output);

        output.pos = pos5;
        output.color = input[0].color;
        output.uv = float2(0.5, 0.0);
        OutputStream.Append(output);

    }
    // Restart the triangle strip
    OutputStream.RestartStrip();
}
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
struct GSOutput
{
    float4 pos : SV_POSITION;
};

[maxvertexcount(9)]
void main(triangle GeometryShaderInput input[3], inout
	TriangleStream<PixelShaderInput> OutputStream
)
{
    PixelShaderInput output = (PixelShaderInput) 0;

    float scalefactor = 0.25f;
    float speedfactor = 2.45f;
    
    for (uint i = 0; i < 3; i++)
    {
        output.pos = input[i].pos;
   
        output.pos.y += time * speedfactor;
        output.pos = mul(output.pos, model);
        output.pos = mul(output.pos, view);
        output.pos = mul(output.pos, projection);
        output.pos.x += 1.3;

        OutputStream.Append(output);
    }
    OutputStream.RestartStrip();

    for (uint i = 0; i < 3; i++)
    {
        output.pos = input[i].pos;
        output.pos.x += 4.3;
        output.pos.y += time * speedfactor;
        output.pos = mul(output.pos, model);
        output.pos = mul(output.pos, view);
        output.pos = mul(output.pos, projection);
        


        OutputStream.Append(output);
    }
    OutputStream.RestartStrip();

    for (uint i = 0; i < 3; i++)
    {
        output.pos = input[i].pos;
        output.pos.x -= 4.8;
        output.pos.y += time * speedfactor;
        output.pos = mul(output.pos, model);
        output.pos = mul(output.pos, view);
        output.pos = mul(output.pos, projection);

        OutputStream.Append(output);
    }
    OutputStream.RestartStrip();

}


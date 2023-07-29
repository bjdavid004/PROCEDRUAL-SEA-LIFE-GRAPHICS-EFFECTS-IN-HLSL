// A constant buffer that stores the three basic column-major matrices for composing geometry.
cbuffer modelViewProjectionConstantBuffer : register(b0)
{
    matrix model;
    matrix view;
    matrix projection;
    float4 eye;
    float4 lookAt;
    float4 upDir;
};

cbuffer timeConstantBuffer : register(b1)
{
    float time;
    float3 padding;
}

struct GeometryShaderInput
{
    float4 pos : SV_POSITION;
};

struct PixelShaderInput
{
    float4 position : SV_POSITION;
    float4 norm : NORMAL;
    float4 posWorld : TEXCOORD;
};

[maxvertexcount(40)]
void main(line GeometryShaderInput input[2], inout TriangleStream<PixelShaderInput> OutputStream)
{
    PixelShaderInput output = (PixelShaderInput)0;

    float4 vPos = input[0].pos;
    float4 vPos2 = input[1].pos;

    // move the fish to 80% of the x-axis
    vPos.x *= 0.8;
    vPos2.x *= 0.8;

    // pull down the fish by 80% along the y-axis
    vPos.y -= 0.6 * vPos.y;
    vPos2.y -= 0.6 * vPos2.y;

    vPos = mul(vPos, view);
    vPos2 = mul(vPos2, view);

    const int pointsOnCircle = 20;

    for (int i = 0; i < pointsOnCircle; i++)
    {
        float fraction = (float)i / (pointsOnCircle - 1);
        float theta = 2 * 3.14 * fraction;

        //Vertex 1
        output.posWorld = input[0].pos + float4(0.0, cos(theta) * 1.3, sin(theta) * 1.3, 0);
        output.norm = float4(0.0, cos(theta) * 1.3, sin(theta) * 1.3, 1);
        output.position = vPos + float4(0.0, cos(theta) * 3.3 - 0.8 * cos(theta) * 1.3, sin(theta) * 1.3, 0);
        output.position = mul(output.position, projection);
        OutputStream.Append(output);

        //Vertex 2
        output.posWorld = input[1].pos + float4(0.0, cos(theta) * 1.3, sin(theta) * 1.3, 0);
        output.norm = float4(0.0, cos(theta) * 1.3, sin(theta) * 1.3, 1);
        output.position = vPos2 + float4(0.0, cos(theta) * 1.3 - 0.8 * cos(theta) * 1.3, sin(theta) * 1.3, 0);
        output.position = mul(output.position, projection);
        OutputStream.Append(output);
    }
}
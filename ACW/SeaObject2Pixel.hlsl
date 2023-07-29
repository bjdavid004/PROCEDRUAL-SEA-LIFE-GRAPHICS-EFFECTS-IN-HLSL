struct PixelShaderInput
{
    float4 pos : SV_POSITION;
    float3 color : COLOR0;
};

float4 main(PixelShaderInput input) : SV_TARGET
{
    float3 color = float3(1, 0, 0);
    return float4(color, 1.0f);
}

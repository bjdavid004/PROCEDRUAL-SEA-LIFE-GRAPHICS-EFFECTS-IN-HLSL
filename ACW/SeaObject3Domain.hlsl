//Blue long Coral
struct DS_OUTPUT
{
	float4 vPosition  : SV_POSITION;
};

struct HS_CONTROL_POINT_OUTPUT
{
	float3 vPosition : WORLDPOS; 
};

cbuffer timeConstantBuffer : register(b1)
{
    float time;
    float3 padding;
}


struct HS_CONSTANT_DATA_OUTPUT
{
	float EdgeTessFactor[3]			: SV_TessFactor;
	float InsideTessFactor			: SV_InsideTessFactor;
};

#define NUM_CONTROL_POINTS 3

[domain("tri")]
DS_OUTPUT main(
	HS_CONSTANT_DATA_OUTPUT input,
	float3 domain : SV_DomainLocation,
	const OutputPatch<HS_CONTROL_POINT_OUTPUT, NUM_CONTROL_POINTS> patch)
{
	DS_OUTPUT Output;

		// Compute the final position of the vertex based on the barycentric coordinates
	float3 p0 = patch[0].vPosition;
	float3 p1 = patch[1].vPosition;
	float3 p2 = patch[2].vPosition;
	float3 position = (1 - domain.x - domain.y) * p0 + domain.x * p1 + domain.y * p2;

	// Modify the shape of the tessellated patch by adding a sinusoidal displacement to the Y coordinate
	float amplitude = 11.2;
	float wavelength = 13.5;
	position.y += amplitude * sin(position.x * wavelength);
    position.y += 2.f;
    position.z += 20;
	Output.vPosition = float4(position, 1);

	return Output;
}

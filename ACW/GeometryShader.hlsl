struct GSOutput
{
	float4 pos : SV_POSITION;
};

[maxvertexcount(3)]
void main(
	triangle float4 input[3] : SV_POSITION, 
	inout TriangleStream< GSOutput > output
)
{
	// Define the vertices of the square
    float4 v0 = float4(-1.5f, -0.5f, 0.0f, 1.0f);
    float4 v1 = float4(-2.5f, 12.5f, 0.0f, 1.0f);
    float4 v2 = float4(3.5f, 2.5f, 0.0f, 1.0f);
    float4 v3 = float4(4.5f, -2.5f, 0.0f, 1.0f);

    // Modify the position of the vertices of the input triangle to form a square
    input[0] = v0;
    input[1] = v1;
    input[2] = v2;

    // Emit the first triangle of the square
    for (int i = 0; i < 3; i++)
    {
        GSOutput element;
        element.pos = input[i];
        output.Append(element);
    }

    // Modify the position of the vertices of the input triangle to form the second triangle of the square
    input[0] = v2;
    input[1] = v3;
    input[2] = v0;

    // Emit the second triangle of the square
    for (int i = 0; i < 3; i++)
    {
        GSOutput element;
        element.pos = input[i];
        output.Append(element);
    }
}
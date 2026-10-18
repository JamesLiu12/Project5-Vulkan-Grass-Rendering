#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(quads, equal_spacing, ccw) in;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare tessellation evaluation shader inputs and outputs

layout(location = 0) in vec4 tcV0[];
layout(location = 1) in vec4 tcV1[];
layout(location = 2) in vec4 tcV2[];
layout(location = 3) in vec3 tcHalfWidth[];

void main() {
    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;
    float oneMinusV = 1.0 - v;

	// TODO: Use u and v to parameterize along the grass blade and output positions for each vertex of the grass blade

    vec3 p0 = tcV0[0].xyz;
    vec3 p1 = tcV1[0].xyz;
    vec3 p2 = tcV2[0].xyz;

    vec3 c = oneMinusV * oneMinusV * p0 + 2.0 * oneMinusV * v * p1 + v * v * p2;

    vec3 worldPos = c + (2.0 * u - 1.0) * tcHalfWidth[0];

    gl_Position = camera.proj * camera.view * vec4(worldPos, 1.0);
}

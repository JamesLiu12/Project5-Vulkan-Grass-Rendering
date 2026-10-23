#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(vertices = 1) out;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare tessellation control shader inputs and outputs

layout(location = 0) in vec4 vV0[];
layout(location = 1) in vec4 vV1[];
layout(location = 2) in vec4 vV2[];
layout(location = 3) in vec3 vHalfWidth[];

layout(location = 0) out vec4 tcV0[];
layout(location = 1) out vec4 tcV1[];
layout(location = 2) out vec4 tcV2[];
layout(location = 3) out vec3 tcHalfWidth[];

in gl_PerVertex {
    vec4 gl_Position;
} gl_in[];

out gl_PerVertex {
    vec4 gl_Position;
} gl_out[];

void main() {
	// Don't move the origin location of the patch
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

	// TODO: Write any shader outputs
    tcV0[gl_InvocationID] = vV0[gl_InvocationID];
    tcV1[gl_InvocationID] = vV1[gl_InvocationID];
    tcV2[gl_InvocationID] = vV2[gl_InvocationID];
    tcHalfWidth[gl_InvocationID] = vHalfWidth[gl_InvocationID];

	// TODO: Set level of tesselation
    gl_TessLevelInner[0] = 1.0;
    gl_TessLevelInner[1] = 4.0;

    gl_TessLevelOuter[0] = 4.0;
    gl_TessLevelOuter[1] = 1.0;
    gl_TessLevelOuter[2] = 4.0;
    gl_TessLevelOuter[3] = 1.0;
}

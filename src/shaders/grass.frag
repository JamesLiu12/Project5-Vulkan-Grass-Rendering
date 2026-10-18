#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare fragment shader inputs

layout(location = 0) in vec3 fragNormal;

layout(location = 0) out vec4 outColor;

void main() {
    // TODO: Compute fragment color

    vec3 lightDir = normalize(vec3(1.0, 1.0, 1.0));
    vec3 lightColor = vec3(1.0, 1.0, 1.0);
    vec3 albedo = vec3(0.2, 0.55, 0.2);

    vec3 normal = normalize(fragNormal);
    float diffuse = abs(dot(normal, lightDir));

    float ambientStrength = 0.25;
    float diffuseStrength = 0.75;

    vec3 color = albedo * lightColor * (ambientStrength + diffuseStrength * diffuse);

    outColor = vec4(color, 1.0);
}

uniform mat4 u_model;
uniform mat4 u_viewprojection;

varying vec2 v_uv;
varying vec3 v_world_position;
varying vec3 v_world_normal;
uniform float u_aspectRatio; // altura/anchura

void main()
{   
    v_uv = gl_MultiTexCoord0.xy;

    // Convert local position to world space
    vec3 world_position = (u_model * vec4(gl_Vertex.xyz, 1.0)).xyz;

    // Convert local normal to world space
    vec3 world_normal = (u_model * vec4(gl_Normal.xyz, 0.0)).xyz;

    // Pass them to the fragment shader interpolated
    v_world_position = world_position;
    v_world_normal = world_normal;

    // Project the vertex using the model view projection matrix
    // Modify Y component with aspect ratio
    gl_Position = u_viewprojection * vec4(world_position.x, (world_position.y - 0.1) * 1, world_position.z, 1.0);

    // Output of the vertex shader
}
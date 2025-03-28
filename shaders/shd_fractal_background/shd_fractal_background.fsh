varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform vec2 u_resolution;
uniform vec4 u_smoke_color;

// Random noise function
float hash(vec2 p) {
    return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}

// Smooth noise
float noise(vec2 x) {
    vec2 p = floor(x);
    vec2 f = fract(x);
    f = f * f * (3.0 - 2.0 * f);
    
    float a = hash(p);
    float b = hash(p + vec2(1.0, 0.0));
    float c = hash(p + vec2(0.0, 1.0));
    float d = hash(p + vec2(1.0, 1.0));
    
    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

// Fractal Brownian Motion
float fbm(vec2 p) {
    float total = 0.0;
    float amplitude = 0.5;
    for (int i = 0; i < 5; i++) {
        total += noise(p) * amplitude;
        p *= 2.0;
        amplitude *= 0.5;
    }
    return total;
}

void main() {
    vec2 uv = v_vTexcoord * u_resolution / min(u_resolution.x, u_resolution.y);
    vec3 color = u_smoke_color.rgb;
    
    // Animate smoke
    vec2 movement = vec2(u_time * 0.1, u_time * 0.05);
    float smoke1 = fbm(uv * 0.5 - movement);
    float smoke2 = fbm(uv * 0.8 + movement * 0.7);
    
    float final_alpha = smoothstep(0.3, 0.8, smoke1 * smoke2);
    final_alpha *= u_smoke_color.a;
    
    gl_FragColor = vec4(color, final_alpha);
}
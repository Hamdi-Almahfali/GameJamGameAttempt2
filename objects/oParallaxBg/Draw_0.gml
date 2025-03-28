// Draw smoke to surface
if (!surface_exists(smoke_surface)) {
    smoke_surface = surface_create(room_width, room_height);
}

surface_set_target(smoke_surface);
    // Clear surface with alpha 0
    draw_clear_alpha(c_black, 0);
    
    // Draw smoke effect
    shader_set(shd_fractal_background);
        // Set shader uniforms
        shader_set_uniform_f(shader_get_uniform(shd_fractal_background, "u_time"), u_time);
        shader_set_uniform_f(shader_get_uniform(shd_fractal_background, "u_resolution"), room_width, room_height);
        shader_set_uniform_f(shader_get_uniform(shd_fractal_background, "u_smoke_color"), 
            color_get_red(smoke_color)/255,
            color_get_green(smoke_color)/255,
            color_get_blue(smoke_color)/255,
            smoke_opacity);
        
        // Draw fullscreen quad
        draw_rectangle(0, 0, room_width, room_height, false);
    shader_reset();
surface_reset_target();

// Draw smoke surface with transparency
draw_surface_ext(smoke_surface, 0, 0, 1, 1, 0, c_white, 0.7);
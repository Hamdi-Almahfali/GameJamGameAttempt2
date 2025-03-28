// Create Event

smoke_surface = -1;
smoke_color = make_color_rgb(150, 150, 150); // Gray smoke color
smoke_speed = 1.0;
smoke_scale = 1.0;
smoke_opacity = 0.3;

// Set up uniforms
u_time = 0;
u_resolution = [room_width, room_height];
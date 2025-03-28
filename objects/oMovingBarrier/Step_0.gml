// If the platform is resting, ensure hsp is zero and count down the rest timer.
if (rest > 0) {
    rest--;
    vsp = 0;
    hsp = 0;
} else {
    // Start moving if not already
    if (!isMoving) {
        isMoving = true;
    }
    
    
    // Set hsp and update position based on target destination.
    if (on_point_a) {

        vsp = move_speed;
        hsp = move_speed;
        y -= vsp;
		x += hsp;
        // Check if we've reached or passed the b_point
        if (y <= yb_point) {
            y = yb_point; // Snap exactly to b_point
            vsp = 0;     // Stop horizontal movement
            isMoving = false;
            on_point_a = false; // Toggle destination
            rest = rest_period; // Reset rest period
        }
    } else {
        vsp = -move_speed;
        hsp = -move_speed;
        y -= vsp;
        x += hsp;
        // Check if we've reached or passed the a_point
        if (y >= ya_point) {
            y = ya_point; // Snap exactly to a_point
            vsp = 0;     // Stop horizontal movement
            isMoving = false;
            on_point_a = true; // Toggle destination
            rest = rest_period; // Reset rest period
        }
    }
}
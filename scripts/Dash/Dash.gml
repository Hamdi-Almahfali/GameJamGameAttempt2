function Dash() {
    // Calculate movement
    var move_x = dash_direction * dash_speed;
    
    // Wall collision check
    if (!place_meeting(x + move_x, y, oWall)) {
        // Move horizontally
        x += move_x;
        dash_progress += abs(move_x);
        
        // Check if dash complete
        if (dash_progress >= dash_distance) {
            EndDash();
        }
    } else {
        // Slide along wall if dash would hit it
        while (!place_meeting(x + sign(move_x), y, oWall) && dash_progress < dash_distance) {
            x += sign(move_x);
            dash_progress++;
        }
        EndDash();
    }
    
    // Update sprite (optional)
    sprite_index = sPlayer_dash;
}

function EndDash() {
    is_dashing = false;
    // Return to appropriate state
    if (place_meeting(x, y+1, oWall)) {
        state = player_state.idle;
    } else {
        state = player_state.air;
    }
}
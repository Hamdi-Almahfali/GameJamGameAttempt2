// STEP EVENT
// Get input
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_jump_press = keyboard_check_pressed(vk_space);
var key_jump_held = keyboard_check(vk_space);
var key_down = keyboard_check(vk_down);

// State machine
switch (state) {
    case player_state.idle:
        // Horizontal deceleration
        hsp *= decel;
        if (abs(hsp) < 0.5) hsp = 0;
        
        // Check for movement input
        var move_dir = key_right - key_left;
        if (move_dir != 0) {
            state = player_state.walk;
        }
        
        // Jump input
        if (key_jump_press && can_jump) {
            vsp = jump_force;
            state = player_state.air;
            can_jump = false;
        }
        
        // Update sprite
        sprite_index = sPlayer_idle;
        break;
        
    case player_state.walk:
        // Horizontal acceleration
        var move_dir = key_right - key_left;
        hsp += move_dir * accel;
        hsp = clamp(hsp, -max_spd, max_spd);
        
        // Decelerate to idle if no input
        if (move_dir == 0) {
            hsp *= decel;
            if (abs(hsp) < 0.5) {
                hsp = 0;
                state = player_state.idle;
            }
        }
        
        // Jump input
        if (key_jump_press && can_jump) {
            vsp = jump_force;
            state = player_state.air;
            can_jump = false;
        }
        
        // Update sprite
        sprite_index = sPlayer_walk;
        break;
        
    case player_state.air:
        // Variable jump height
        if (!key_jump_held && vsp < jump_force / 2) {
            vsp = jump_force / 2;
        }
        
        // Air control
        var move_dir = key_right - key_left;
        hsp += move_dir * air_accel;
        hsp = clamp(hsp, -max_spd, max_spd);
        
        // Update sprites based on vertical speed
        if (vsp < 0) {
            sprite_index = sPlayer_jump;
        } else {
            sprite_index = sPlayer_mid_air;
        }
        
        // Check for ledge grab
        if (ledge_grab_check()) {
            //state = player_state.ledge_grab;
            vsp = 0;
            hsp = 0;
        }
        break;
        
    case player_state.ledge_grab:
        // Disable movement
        hsp = 0;
        vsp = 0;
        
        // Climb up
        if (key_jump_press) {
            state = player_state.air;
            vsp = jump_force * 0.8;
            x += 10 * image_xscale;
        }
        
        // Drop down
        if (key_down) {
            state = player_state.air;
            y += 5;
        }
        
        sprite_index = sPlayer_grab;
        break;
}

// Apply gravity
if (state != player_state.ledge_grab) {
    vsp += grv;
}

// Horizontal collision
if (place_meeting(x + hsp, y, oWall)) {
    while (!place_meeting(x + sign(hsp), y, oWall)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// Vertical collision
if (place_meeting(x, y + vsp, oWall)) {
    while (!place_meeting(x, y + sign(vsp), oWall)) {
        y += sign(vsp);
    }
    vsp = 0;
    if (state == player_state.air) {
        can_jump = true;
        state = hsp == 0 ? player_state.idle : player_state.walk;
    }
} else {
    y += vsp;
}

// Update grounded state
grounded = place_meeting(x, y + 1, oWall);

// Update direction
if (hsp != 0) image_xscale = sign(hsp); 

// Ledge grab check function
function ledge_grab_check() {
    if (state != player_state.air) return false;
    
    var check_dist = 10 * image_xscale;
    var wall_check = place_meeting(x + check_dist, y, oWall);
    var ledge_check = !place_meeting(x + check_dist, y + 20, oWall);
    
    return wall_check && ledge_check;
}
if ( instance_place(x,y+1,oMovingBarrier) ) {
	x += instance_place(x,y+1,oMovingBarrier).hsp;
	y -= instance_place(x,y+1,oMovingBarrier).vsp;
}
// STEP EVENT
// Get input
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_jump_press = keyboard_check_pressed(vk_space);
var key_jump_held = keyboard_check(vk_space);
var key_down = keyboard_check(vk_down);
var mouse_left = mouse_check_button_pressed(mb_left);

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
        // Attack input
        if (mouse_left && can_swing && !holds_gun) {
			image_index = 0;
            state = player_state.attack_still;
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
        
        break;
        
    case player_state.dash:
        // Disable movement
   
        sprite_index = sPlayer_walk_punch;
        break;
	case player_state.attack_still:
	sprite_index = sPlayer_swing_still;
		break;
}

// Apply gravity
if (state != player_state.dash) {
    vsp += grv;
}

// Horizontal collision
if (hsp != 0) {
    if (place_meeting(x + hsp, y, oWall)) {
        var move = hsp;
        while (!place_meeting(x + sign(move), y, oWall) && abs(move) > 0) {
            x += sign(move);
            move -= sign(move);
        }
        hsp = 0;
    }
    x += hsp;
}

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

// VERY BUGGY MOVING PLATFORM CODE -- CHANGE IF YOU SEE THIS COMMENT
var _inst = instance_place(x,y+1,oMovingBarrier);
if ( _inst != noone ) {
	x += _inst.hsp;
	y -= _inst.vsp;
}
if (instance_place(x,y,oMovingBarrier)) 
{
	y -= 1;
}
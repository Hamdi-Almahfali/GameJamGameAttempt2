// STEP EVENT
// Get input
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_dash_press = keyboard_check_pressed(vk_shift);
var key_jump_press = keyboard_check_pressed(vk_space);
var key_jump_held = keyboard_check(vk_space);
var key_down = keyboard_check(vk_down);
var mouse_left = mouse_check_button_pressed(mb_left);
var mouse_right = mouse_check_button_pressed(mb_right);
Player_Manage_CDs();
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
		if (key_jump_press && jumps_left > 0) {
		    vsp = jump_force;
		    state = player_state.air;
		    jumps_left--; 
		    can_jump = (jumps_left > 0); 
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
		Player_Check_Fall();
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
        // Attack input
        if (mouse_left && can_swing && !holds_gun) {
			image_index = 0;
            state = player_state.attack_walk;
        }
        // Jump input
		if (key_jump_press && jumps_left > 0) {
		    vsp = jump_force;
		    state = player_state.air;
		    jumps_left--; 
		    can_jump = (jumps_left > 0); 
		}
        if (key_dash_press && can_dash) {
		    // decide dash direction
		    var input_dir = key_right - key_left;
		    dash_direction = (input_dir != 0) ? input_dir : sign(image_xscale);
    
		    // Initialize dash
		    is_dashing = true;
		    can_dash = false;
		    dash_progress = 0;
		    dash_cooldown = dash_cooldown_max;
		    state = player_state.dash;
		    sprite_index = sPlayer_dash;
		    image_index = 0;
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
        
		if (key_jump_press && jumps_left > 0) {
		    vsp = air_jump_force; // Weaker jump
		    jumps_left--;
		    can_jump = (jumps_left > 0);
        
		    // Optional Add a small horizontal boost
		    //hsp += (key_right - key_left) * 2; 
		    }
	
        // Update sprites based on vertical speed
        if (vsp < 0) {
            sprite_index = sPlayer_jump;
        } else {
            sprite_index = sPlayer_mid_air;
        }
        if (key_dash_press && can_dash) {
		    // Determine dash direction
		    var input_dir = key_right - key_left;
		    dash_direction = (input_dir != 0) ? input_dir : sign(image_xscale);
    
		    // Initialize dash
		    is_dashing = true;
		    can_dash = false;
		    dash_progress = 0;
		    dash_cooldown = dash_cooldown_max;
		    state = player_state.dash;
		    sprite_index = sPlayer_dash;
		    image_index = 0;
		}
        break;
        
    case player_state.dash:
        // Disable movement
		Dash();
        sprite_index = sPlayer_dash;
        break;
		
	case player_state.attack_still:
		var move_dir = key_right - key_left;
	    if (move_dir != 0) {
			state = player_state.walk;
        }
		sprite_index = sPlayer_swing_still;
		break;
	
	case player_state.attack_walk:
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
        
		if(mouse_right)
		{
		Parry();		
		}
		
        // Update sprite
        sprite_index = sPlayer_swing_walk;
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
		jumps_left = max_jumps; // Reset jumps
        state = hsp == 0 ? player_state.idle : player_state.walk;
    }
} else {
    y += vsp;
}

// Update grounded state
grounded = place_meeting(x, y + 1, oWall);

// Update direction
if (hsp != 0) image_xscale = sign(hsp);
if ( is_taking_aim && has_gun)
{ 
        if (mouse_x < x - 16) {
        image_xscale = -1;
    } 
    else if (mouse_x > x + 16) {
        image_xscale = 1;
    }
}
else {
	
}


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

//I'm going to ignore the comment above me.
//Parry update and cooldown:
if(parry_cooldown > 0){
	parry_cooldown--;}
	
if(mouse_right && parry_cooldown <= 0){
	parry_active = true;
	parry_cooldown = 60;
	
	var parryHitbox = instance_create_layer(x, y, "Instances", oParry_Hitbox);
	show_debug_message("Parry Hitbox Created");
	show_debug_message(parryHitbox.x);
	show_debug_message(parryHitbox.y);
	parryHitbox.duration = parry_duration;
	parryHitbox.owner = id; //thank you deepseek for this one im ngl
	
	alarm[0] = parry_duration;
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player_Check_Fall(){
	var is_on_ground = place_meeting(x, y+1, oWall);

	if (was_on_ground && !is_on_ground && state != player_state.air) {
	    // Player walked off a platform without jumping
	    state = player_state.air;
	    jumps_left--; // Consume one jump
	    vsp = 0; // Start falling naturally (or use a tiny downward force if preferred)
	}

	was_on_ground = is_on_ground; // Update for next frame
}
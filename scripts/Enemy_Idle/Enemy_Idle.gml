// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Enemy_Idle(){
	sprite_index = sprite_idle;
	
	
	
	var message_ = "hey";

	if (instance_exists(oPlayer)) {
    // Distance check (50px radius)
    var dx = oPlayer.x - x;
    var dy = oPlayer.y - y;
    var dist = point_distance(0, 0, dx, dy);
    
    if (dist > view_distance) return; // Too far away
    
    // Direction check (only detect in front)
    var player_is_to_right = (oPlayer.x > x);
    
    // If enemy is facing right but player is left (or vice versa), ignore
    if ((image_xscale > 0 && !player_is_to_right) || (image_xscale < 0 && player_is_to_right)) {
        return; // Player is behind
    }
    
    // Optional: Field-of-view angle check (if needed)
    var angle_to_player = point_direction(x, y, oPlayer.x, oPlayer.y);
    var angle_diff = angle_difference((image_xscale > 0) ? 0 : 180, angle_to_player);
    
    if (abs(angle_diff) > 45) return; // Player is outside FOV cone (45° each side)
    
    // Line-of-sight check (walls block vision)
    if (collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, true)) {
        return; // Wall in the way
    }
    
    // If all checks passed, attack!
	alert = true;
    state = ENEMY_STATE.attack;
}

}
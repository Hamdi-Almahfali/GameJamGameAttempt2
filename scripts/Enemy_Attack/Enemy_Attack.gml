// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Enemy_Attack(){
	sprite_index = sprite_attack;
	
	// Turn towards the player
	if (instance_exists(oPlayer)) {
    // Flip sprite based on player position
    if (oPlayer.x < x) {
        image_xscale = -1; // Face left
    } else {
        image_xscale = 1; // Face right
    }
}
	
	// Return to idle if player behind wall
	if (!!collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, true)) 
	{
		state = ENEMY_STATE.idle;
	}
}
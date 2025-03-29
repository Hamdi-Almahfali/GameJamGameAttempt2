// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player_Manage_CDs(){
	//======================
	// Handle dash cooldown
	if (dash_cooldown > 0) {
	    dash_cooldown--;
	} else if (!can_dash) {
	    can_dash = true;
	}
	//======================
	
}
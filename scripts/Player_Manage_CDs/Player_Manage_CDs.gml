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
	// Handle taking aim
	if ( mouse_check_button(mb_right) ) 
	{
		is_taking_aim = true;
	}
	else
	{
		is_taking_aim = false;
	}
	var mx = mouse_x;
    var my = mouse_y;
    var target_angle = point_direction(x, y, mx, my);
	gun.angle = lerp(gun.angle, target_angle, 1);
	if (abs(angle_difference(gun.angle, 0)) > 90) {
			gun.yscale = -1;
        } else {
            gun.yscale = 1;
        }
}
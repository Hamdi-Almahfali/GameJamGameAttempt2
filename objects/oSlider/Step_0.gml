/// @description Insert description here
// You can write your code in this editor
var slider_width = sprite_get_width(sSliderBox2) - 4;
var slider_height = sprite_get_height(sSliderBox2);
if (mouse_check_button(mb_left) && point_in_rectangle(mouse_x, mouse_y, x, y, x + slider_width, y + slider_height)) {
    // Calculate the new slider value based on the mouse's x position
    var new_value = (mouse_x - x + 3) / slider_width;
    // Clamp the value between 0 and 1
	value = lerp(value, new_value, 0.1);
}

switch (index)
{
	
	case 0 :
		global.MASTER_AUDIO = value;
		with (oManager) event_user(0);
		break;
	case 1 :
		global.MUSIC_AUDIO = value;
		with (oManager) event_user(0);
		break;
	default:
	// nun mf
}
	
	
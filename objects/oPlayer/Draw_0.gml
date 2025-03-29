/// @description Insert description here
// You can write your code in this editor


if (global.DEBUG) {
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1)
	if(instance_exists(oParry_Hitbox)){
		draw_rectangle(oParry_Hitbox.bbox_left, oParry_Hitbox.bbox_top, oParry_Hitbox.bbox_right, oParry_Hitbox.bbox_bottom, 1);
		draw_sprite_ext(ParryBox, image_index, oParry_Hitbox.bbox_left, oParry_Hitbox.bbox_top, image_xscale, image_yscale, 0, c_white, image_alpha);
	}
}

switch (sprite_index)
{
	case sPlayer_swing_still :
		draw_self();
		draw_sprite_ext(sSword_still, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
	break;
	case sPlayer_swing_walk :
		draw_self();
		draw_sprite_ext(sSword_walk, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
	break;
	case sPlayer_idle :
		
		if (has_gun && is_taking_aim)
		{
			draw_sprite_ext(sPlayer_idle_noarms, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
			draw_sprite_ext(gun.sprite, 0, x, y + 5, 1, image_xscale, gun.angle, c_white,1);
			draw_sprite_ext(sArm, 8, x, y + 5, 1, gun.yscale, gun.angle, c_white,1);
			
		}
		else
		{
			draw_self();
		}
		break;
	case sPlayer_walk :
	if (has_gun && is_taking_aim)
		{
			draw_sprite_ext(sPlayer_walk_noarms, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
			draw_sprite_ext(gun.sprite, 0, x, y + 5, 1, image_xscale, gun.angle, c_white,1);
			draw_sprite_ext(sArm, 8, x, y + 5, 1, gun.yscale, gun.angle, c_white,1);
			
		}
		else
		{
			draw_self();
		}
		break;
	default :
	draw_self();
	break;

}
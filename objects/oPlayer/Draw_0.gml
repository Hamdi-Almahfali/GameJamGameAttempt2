/// @description Insert description here
// You can write your code in this editor
draw_self();

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
		draw_sprite_ext(sSword_still, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
		break;
	case sPlayer_swing_walk :
		draw_sprite_ext(sSword_walk, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
		break;
}
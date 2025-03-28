/// @description Insert description here
// You can write your code in this editor
draw_sprite(sSliderBox2, 0 , x , y);
var max_width = sprite_get_width(sSliderBox) - 6;
var height = sprite_get_height(sSliderBox) - 20;
var color = make_color_rgb(200, 200, 200);
var r_color = make_color_rgb(37, 12, 12);
var br_color = make_color_rgb(61, 19, 19);
if ( value != 0)
	draw_rectangle_color(x+4,y+4,x+ max_width * value, y + height, color, color, color, color, 0);


// Draw text
draw_set_font(fnAbandon)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_ext_transformed_color(x + max_width / 2 + 6, y + height / 2 - 2, text, 30, 20, 1, 1, 0, br_color, br_color, br_color, br_color, 1);

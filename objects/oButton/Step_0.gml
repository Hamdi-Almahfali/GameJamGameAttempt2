/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if (active)
{
	percent += 1/60; // 60 frames


	position = animcurve_channel_evaluate(curve,percent);

	// size
	var _size_x_start = 1;
	var _size_x_end = max_size;
	var _size_x_distance = _size_x_end - _size_x_start;
	image_xscale = _size_x_start + (_size_x_distance * position);

	var _size_y_start = 1;
	var _size_y_end = max_size;
	var _size_y_distance = _size_y_end - _size_y_start;
	image_yscale = _size_y_start + (_size_y_distance * position);

	var _rot_start = max_rotation;
	var _rot_end = 0;
	var _rot_distance = _rot_end - _rot_start;
	image_angle = _rot_start + (_rot_distance * position);
}
else
{
	image_xscale = lerp(image_xscale, 1, 0.2);
	image_yscale = lerp(image_yscale, 1, 0.2);
	image_angle = lerp(image_angle, 0, 0.2);
}







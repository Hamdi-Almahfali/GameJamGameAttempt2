/// @description Insert description here
// You can write your code in this editor
draw_self();
if (alert) 
{
    draw_sprite(
        sExc_yellow,
        alert_frame, // Use current frame instead of 0
        x - sprite_get_width(sExc_yellow) / 2,
        y - sprite_height
    );
}
if (!global.DEBUG) return;
draw_set_halign(fa_center);
draw_text(x,y-10, state);



// Draw vision cone (red)
var cone_length = view_distance;
var fov_angle = 90;
var base_angle = (image_xscale > 0) ? 0 : 180; // Face right (0°) or left (180°)

// Draw red vision cone (semi-transparent)
draw_set_alpha(0.3);
draw_set_color(c_red);
draw_triangle(
    x, y,
    x + lengthdir_x(cone_length, base_angle - fov_angle / 2),
    y + lengthdir_y(cone_length, base_angle - fov_angle / 2),
    x + lengthdir_x(cone_length, base_angle + fov_angle / 2),
    y + lengthdir_y(cone_length, base_angle + fov_angle / 2),
    false
);
draw_set_alpha(1);

// Check for walls in vision cone and draw them yellow
with (oWall) {
    // Check if wall is inside vision cone
    var wall_angle = point_direction(other.x, other.y, x, y);
    var angle_diff = angle_difference(base_angle, wall_angle);
    
    if (abs(angle_diff) <= fov_angle / 2) { // Inside cone angle
        var dist = point_distance(other.x, other.y, x, y);
        if (dist <= cone_length) { // Inside cone distance
            // Draw yellow rectangle over the wall
            draw_set_color(c_yellow);
            draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
        }
    }
}
            draw_set_color(c_white);


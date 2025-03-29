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
//draw_text(x,y-10, state);



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

// Only proceed if player exists and is in vision cone
if (instance_exists(oPlayer)) {
    var player_angle = point_direction(x, y, oPlayer.x, oPlayer.y);
    var player_dist = point_distance(x, y, oPlayer.x, oPlayer.y);
    var angle_diff = angle_difference(base_angle, player_angle);
    
    if (abs(angle_diff) <= fov_angle/2 && player_dist <= cone_length) {
        // Check for walls blocking line to player
        var blocking_wall = collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, true);
        
        // If a wall is blocking, draw it yellow
        if (blocking_wall != noone) {
            draw_set_color(c_yellow);
            draw_set_alpha(0.7);
            draw_rectangle(
                blocking_wall.bbox_left, blocking_wall.bbox_top,
                blocking_wall.bbox_right, blocking_wall.bbox_bottom,
                true
            );
            draw_set_alpha(1);
        }
    }
}
            draw_set_color(c_white);


/// @description Insert description here
// Base enemy parent object
enum ENEMY_STATE {
	idle,
	walk,
	attack,
	patrol,
	stunned,
	hit,
	dead
}
state = ENEMY_STATE.idle;

grounded = false;
health = 100;
hsp = 0;
vsp = 0;
grv = 0.3;
shoot_cooldown_time = 30;
shoot_cooldown = 0; // Can shoot if cooldown is 0, the cool down time is added everytime a shot is fired
is_dead = false;
is_stunned = false;

// Alert variables
alert = false;            // Tracks if enemy is in alert state
alert_frame = 0;          // Current frame of the animation
alert_max_frames = 5;     // Total frames in sExc_yellow
alert_timer = 0;          // Counts how long the animation has played
alert_speed = 0.2;        // Adjust for faster/slower animation (seconds per frame)

sprite_idle = noone;
sprite_attack = noone;
sprite_walk = noone;
sprite_hurt = noone;
sprite_dead = noone;

view_distance = 300; // can spot the player 50 pixels away
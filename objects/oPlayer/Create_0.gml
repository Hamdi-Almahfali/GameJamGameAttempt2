// CREATE EVENT
enum player_state {
    idle,
    walk,
    jump,
    air,
    dash,
	block,
	attack_still,
	attack_walk,
	runAttack,
	dead
}

state = player_state.idle;
hsp = 0;
vsp = 0;
grv = 0.3;
accel = 0.3;
decel = 0.7;
jump_force = -7;
max_spd = 3;
air_accel = 0.5;
grounded = false;
can_swing = true;
holds_gun = false;
p_health = 3;

//jumps
can_jump = true;
max_jumps = 2; 
jumps_left = max_jumps;
air_jump_force = jump_force * 0.7;
was_on_ground = true; // Tracks previous frame's ground state

// Dash variables
can_dash = true;
is_dashing = false;
dash_cooldown = 0;
dash_cooldown_max = 30; // half a second
dash_distance = 60; 
dash_speed = 5; 
dash_direction = 0;
dash_progress = 0;

//Parry variables
parry_active = false;
parry_duration = 30;
parry_cooldown = 0;

image_speed = 1;

// Initialize sprite
sprite_index = sPlayer_idle;

/*
if (instance_exists(oEnemyHitbox)) {
	instance_place(oParryBox.x, oParryBox.y, oEnemyHitbox)
	Parry();
	
	This is the registration of the parry hitbox with the enemy attack hitbox such that we
	can effectively parry. Use later.
}
*/
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

//jumps
can_jump = true;
max_jumps = 2; 
jumps_left = max_jumps;
air_jump_force = jump_force * 0.7;
was_on_ground = true; // Tracks previous frame's ground state


image_speed = 1;

// Initialize sprite
sprite_index = sPlayer_idle;

/*
if (instance_exists(oEnemyHitbox)) {
	instance_place(oParryBox.x, oParryBox.y, oEnemyHitbox)
	Parry();
}
*/
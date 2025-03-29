/// @description Insert description here
// You can write your code in this editor
image_speed = 1 * global.TIME;
switch (state) // Find functions in the scripts tab
{
	case ENEMY_STATE.idle :
		Enemy_Idle();
	break;
	case ENEMY_STATE.walk :
		Enemy_Walk();
	break;
	case ENEMY_STATE.attack :
		Enemy_Attack();
	break;
	case ENEMY_STATE.patrol :
		Enemy_Patrol();
	break;
	case ENEMY_STATE.stunned :
		Enemy_Stun();
	break;
	case ENEMY_STATE.hit :
		Enemy_Hit();
	break;
	case ENEMY_STATE.dead :
		//Enemy_dead();
		image_index = 1;
		sprite_index = sprite_dead;
		exit;
}
// Apply gravity

vsp += grv;


// Horizontal collision
if (hsp != 0) {
    if (place_meeting(x + hsp, y, oWall)) {
        var move = hsp;
        while (!place_meeting(x + sign(move), y, oWall) && abs(move) > 0) {
            x += sign(move);
            move -= sign(move);
        }
        hsp = 0;
    }
    x += hsp * global.TIME;
}

// Vertical collision
if (place_meeting(x, y + vsp, oWall)) {
    while (!place_meeting(x, y + sign(vsp), oWall)) {
        y += sign(vsp);
    }
    vsp = 0;
} else {
    y += vsp * global.TIME;
}

// Update grounded state
grounded = place_meeting(x, y + 1, oWall);

// Update direction
if (hsp != 0) image_xscale = sign(hsp); 




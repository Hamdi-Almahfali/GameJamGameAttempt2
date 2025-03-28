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
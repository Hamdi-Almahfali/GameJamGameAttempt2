/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case sPlayer_swing_still :
		state = player_state.idle;
		break;
	case sPlayer_swing_walk :
		state = player_state.walk;
		break;
}
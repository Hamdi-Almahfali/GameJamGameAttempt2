oPlayer.p_health--;
show_debug_message(oPlayer.p_health);

instance_destroy();

if(instance_exists(owner)){
	owner.attack_cooldown = 60;
	owner.attack_active = false;
	show_debug_message("attack done");
}
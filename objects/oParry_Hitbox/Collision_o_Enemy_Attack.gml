
	if(instance_exists(owner)){
		owner.parry_success = true;
		//Above is for debugging
		//Here 	we can also make the different parries for projectiles vs melees if we want
		//We just gotta do some shi with the index (like, make it o_projectile for example)
		
		instance_destroy(other);
		//For now, we just destroy the hitbox.
		
		instance_destroy();
		
		owner.parry_cooldown = 60;
		owner.parry_active = false;
		show_debug_message("parry done");
	}

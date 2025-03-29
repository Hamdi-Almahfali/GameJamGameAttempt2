if(other.object_index == o_Enemy_Attack_Hitbox)
{
	if(instance_exists(owner)){
		owner.parry_success = true;
		//Above is for debugging
		//Here 	we can also make the different parries for projectiles vs melees if we want
		//We just gotta do some shi with the index (like, make it o_projectile for example)
		
		instance_destroy(other);
		//For now, we just destroy the hitbox.
	}
}
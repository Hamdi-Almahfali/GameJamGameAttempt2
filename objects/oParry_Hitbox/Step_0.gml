if(instance_exists(owner)){
	x = owner.x;
	y = owner.y;
	}
	
	life++;
	if (life >= max_life){
		instance_destroy();
	}
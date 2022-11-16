/// @description 

if (other.damaged == false and !global.gamePaused and other.image_alpha == 1 and image_alpha == 1) {
	other.damaged=true;
	random_set_seed(current_time);
	dmg = irandom_range(upg[?"mindmg"],upg[?"maxdmg"]);
	other.hp-= dmg;	
	var inst = instance_create_layer(other.x,other.y,"DamageLayer",oDamageText);
	with (inst)
	{
	    dmg=other.dmg;
	}
	other.alarm[1]=15;	
	hits-=1;
}


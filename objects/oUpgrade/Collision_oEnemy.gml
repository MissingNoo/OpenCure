/// @description 

if (other.hittedcooldown[upg[?"id"]] <= 0  and !global.gamePaused and other.image_alpha == 1 and image_alpha == 1) {
	other.hittedcooldown[upg[?"id"]] = upg[?"hitCooldown"];
	other.damaged = true;
	random_set_seed(current_time);
	dmg = irandom_range(upg[?"mindmg"],upg[?"maxdmg"]);
	other.hp-= dmg * global.Player[?"atk"];
	var inst = instance_create_layer(other.x,other.y,"DamageLayer",oDamageText);
	with (inst)
	{
	    dmg=other.dmg;
	}
	other.alarm[1]=15;	
	switch (upg[?"name"]) {
	    case "AmePistol":
	        if (hits == 1 and !AmePistolLastHit and upg[?"level"] >= 4) {
			    AmePistolLastHit=true;
				hits+=5;
				direction=direction*180;
			}
	        break;
	    default:
	        break;
	}
	hits-=1;
}




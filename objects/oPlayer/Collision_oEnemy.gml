/// @description 
if (other.canattack and !global.gamePaused) {
	//damaged=true;
	var damage = damageCalculation(other.atk);
	if (Shield > 0) {
	    Shield -= damage;
	}
	else {
	    HP -= damage;
	}
	//alarm[1]=60;
	other.canattack=false;
	other.alarm[0]=15;
	var inst = instance_create_layer(x,y,"DamageLayer",oDamageText);
	with (inst)
	{
	    dmg=round(damage);
	}
}

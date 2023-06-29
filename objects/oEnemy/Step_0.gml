
// Feather disable GM2017
if(global.gamePaused == false and instance_exists(target)){
	
	if (boss) {
	    if(target.x < x) image_xscale=-2;
		if(target.x > x) image_xscale=2;
		image_yscale = 2;
	}
	else{
		if(target.x < x) image_xscale=-1;
		if(target.x > x) image_xscale=1;
		image_yscale = 1;
	}
	
	//if(target.y < y) y-=.5;
		//if(target.y > y) y+=.5;
		var nearupgrade;
		if (instance_exists(oUpgrade) and instance_exists(target)) {
			nearupgrade = instance_nearest(x,y,oUpgrade);
			if (instance_exists(oUpgrade) and nearupgrade.upg[$"id"] == Weapons.PowerofAtlantis and distance_to_object(nearupgrade) < 100) {
			    var _is_colliding = collision_point(x,y, oUpgrade,false, true)
				if (_is_colliding != noone and _is_colliding.upg[$"id"] == Weapons.PowerofAtlantis) {
				    direction=point_direction(x,y,_is_colliding.x,_is_colliding.y + (sprite_get_height(sWaterPoolStart) / 2));
				}	
			}else {
				if (pattern != Patterns.Horde and pattern != Patterns.WallBoth) {
					    direction=point_direction(x,y,target.x,target.y);
					}
				}
		}	
		
		if (distance_to_point(dieX, y) < 10) {
			dropxp = false;
		    hp = 0;			
		}
	
	if (hp<=0) {
		if (!deathSent) {
		    deathSent = true;
			buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
			buffer_write(oClient.clientBuffer, buffer_u8, Network.Destroy);
			buffer_write(oClient.clientBuffer, buffer_u16, enemyID);
			buffer_write(oClient.clientBuffer, buffer_string, global.roomname);
			network_send_packet(oClient.client, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
		}
		
		image_alpha-=.05;
		x-=image_xscale;
		if (boss and global.ScreenShake == 1) {
			oGame.shake_magnitude=6;
		}
		if (image_alpha == 0) {
		    instance_destroy();
		}
	}
	// Feather disable once GM2016
	atk = (baseATK + (2 * global.timeA)) * (1 + (global.timeB / 25));
	if (canwalk) {
	    speed = (baseSPD + (0.12 * global.timeA)) * (1 + (global.timeB / 25));
	}
	else{
		speed = 0;
	}
	
	
	var debuffLenght = array_length(debuffs);
	for (var i = 0; i < debuffLenght; ++i) {
	    if (debuffs[i].id == BuffNames.Slowness) {
		    speed = speed * 0.2;
		}
	}
	
	#region debuff cooldown
		for (var i = 0; i < debuffLenght; ++i) {
			if (!variable_struct_exists(debuffs[i], "time")) { break; }
		    if (debuffs[i].time > 0) {
			    debuffs[i].time -= 1/60;
				//show_message(debuffs[i].cooldown);
			}
			else {
			    array_delete(debuffs, i, 1);
			}
		}
	#endregion
	
}
var pausedamaged = false;






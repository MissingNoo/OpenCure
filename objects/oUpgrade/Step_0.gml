xpreviousprevious = x - (x - xprevious);
ypreviousprevious = y - (y - yprevious);
if (global.testvar == "") {
    global.testvar = upg;
}
if (socket == oPlayer.socket) {
    owner = instance_nearest(x,y,oPlayer);
}else{
	owner = instance_nearest(x,y, oSlave);
}
#region Connected to Character
if (!global.gamePaused) {
	if (subImg < maxImg and sprReset) {
	    subImg += sprSpeed / game_get_speed(sprSpeedType) * Delta;
		if (subImg > maxImg) {
		    subImg = maxImg;
			event_perform(ev_other, ev_animation_end);
		}
	}
	#region broadcasts
	switch (upg[$ "id"]) {
	    case Weapons.MiCometMeteor:
	        if (floor(subImg) == 2 and !summoned) {
			    summoned = true;
				instance_create_depth(x, y - (sprite_get_height(WEAPONS_LIST[Weapons.MiCometPool][1][$ "sprite"]) * WEAPONS_LIST[Weapons.MiCometPool][1][$ "size"]) / 2, depth, oUpgrade,{
					upg : WEAPONS_LIST[Weapons.MiCometPool][1],
					speed : WEAPONS_LIST[Weapons.MiCometPool][1][$ "speed"],
					hits : WEAPONS_LIST[Weapons.MiCometPool][1][$ "hits"],
					shoots : WEAPONS_LIST[Weapons.MiCometPool][1][$ "shoots"],
					sprite_index : WEAPONS_LIST[Weapons.MiCometPool][1][$ "sprite"],
					level : WEAPONS_LIST[Weapons.MiCometPool][1][$ "level"],
					mindmg: WEAPONS_LIST[Weapons.MiCometPool][1][$ "mindmg"],
					maxdmg: WEAPONS_LIST[Weapons.MiCometPool][1][$ "maxdmg"]
				});
			}
	        break;
	    default:
	        // code here
	        break;
	}
	#endregion
	for (var i = 0; i < array_length(dAlarm); ++i) {
	    if (dAlarm[i] != -1) {
		    dAlarm[i] -= 1 * Delta;
		}
		if (dAlarm[i] < 0 and dAlarm[i] != -1) {
		    dAlarm[i] = -1;
			event_user(i);
		}
	}
	if (speed > 0 and upg[$ "id"] != Weapons.CuttingBoard) {
	    speed=upg[$ "speed"] * Delta;
	}
	if (afterimagecount < 0.30) {
	    afterimagecount += 1 * Delta;
	}
	else{
		afterimagecount = 0;
		array_push(afterimage[0],x);
		array_push(afterimage[1],y);
		array_push(afterimage[2],round(subImg));
		if (array_length(afterimage[0]) > 4) {
		    array_shift(afterimage[0]);
		    array_shift(afterimage[1]);
		    array_shift(afterimage[2]);
		}
	}
	
	switch (upg[$ "id"]) {
		case Weapons.GuraTrident:{
			x=owner.x;
			y=owner.y-8;
			break;}
		case Weapons.InaTentacle:{
			//var dirr = (image_xscale > 0) ? 32 : -32;
			//x=owner.x+dirr;
			x=owner.x;
			y=owner.y-8;
			break;}
		case Weapons.PlugAsaCoco:{
			//if (alarm_get(1) > 0) {
			if (dAlarm[1] > 0) {
			    y-=1.75;
				// feather disable once GM1041
				if (instance_exists(ce)) {
					direction = point_direction(x,y,ce.x, ce.y);
					image_angle = point_direction(x,y,ce.x, ce.y);
				}				
			}else {image_alpha = 1;}		
			break;}
		case Weapons.BlBook:{
			x = owner.x + lengthdir_x(orbitLength, round(orbitPlace));
			y = owner.y - 16 + lengthdir_y(orbitLength, round(orbitPlace));
			orbitPlace-=3 * Delta;
			break;}
		case Weapons.BLFujoshiBook:{
			orbitLength = 100;
			x = owner.x + lengthdir_x(orbitLength, round(orbitPlace));
			y = owner.y - 16 + lengthdir_y(orbitLength, round(orbitPlace));
			orbitPlace -= 8 * Delta;
			//orbitPlace = oGui.f;
			break;}
		case Weapons.BLFujoshiAxe:{
			orbitLength = 190;
			x = owner.x + lengthdir_x(orbitLength, round(orbitPlace));
			y = owner.y - 16 + lengthdir_y(orbitLength, round(orbitPlace));
			orbitPlace -= 10 * Delta;
			//orbitPlace = oGui.f;
			break;}
		case Weapons.BoneBros:{
			slashTimer += 1 * Delta;
			bulletTimer += 1 * Delta;
			if (slashTimer > 5) {
			    slashTimer = 0;
				instance_create_layer(x, y, "Upgrades", oUpgrade,{
					upg : WEAPONS_LIST[Weapons.BoneBrosSlash][1],
					speed : WEAPONS_LIST[Weapons.BoneBrosSlash][1][$ "speed"],
					hits : WEAPONS_LIST[Weapons.BoneBrosSlash][1][$ "hits"],
					shoots : WEAPONS_LIST[Weapons.BoneBrosSlash][1][$ "shoots"],
					sprite_index : WEAPONS_LIST[Weapons.BoneBrosSlash][1][$ "sprite"],
					level : WEAPONS_LIST[Weapons.BoneBrosSlash][1][$ "level"],
					mindmg: WEAPONS_LIST[Weapons.BoneBrosSlash][1][$ "mindmg"],
					maxdmg: WEAPONS_LIST[Weapons.BoneBrosSlash][1][$ "maxdmg"],
					direction : global.arrowDir + irandom_range(0, 30)
				});
			}
			if (bulletTimer > 3) {
			    bulletTimer = 0;
				instance_create_layer(x, y, "Upgrades", oUpgrade,{
					upg : WEAPONS_LIST[Weapons.BoneBrosBullet][1],
					speed : WEAPONS_LIST[Weapons.BoneBrosBullet][1][$ "speed"],
					hits : WEAPONS_LIST[Weapons.BoneBrosBullet][1][$ "hits"],
					shoots : WEAPONS_LIST[Weapons.BoneBrosBullet][1][$ "shoots"],
					sprite_index : WEAPONS_LIST[Weapons.BoneBrosBullet][1][$ "sprite"],
					level : WEAPONS_LIST[Weapons.BoneBrosBullet][1][$ "level"],
					mindmg: WEAPONS_LIST[Weapons.BoneBrosBullet][1][$ "mindmg"],
					maxdmg: WEAPONS_LIST[Weapons.BoneBrosBullet][1][$ "maxdmg"],
					direction : (global.arrowDir + 180) + irandom_range(0, 30)
				});
			}
			break;}
		case Weapons.AbsoluteWall:{
			var _offset = 0;
			switch (wallNumber) {
			    case 0:
			        _offset = 0;
			        break;
			    case 1:
			        _offset = 90;
			        break;
			    case 2:
			        _offset = 180;
			        break;
			    case 3:
			        _offset = 270;
			        break;
			}
			//orbitPlace = _offset;
			//orbitLength = 100;
			//image_angle = global.arrowDir + _offset;
			image_angle = global.arrowDir + _offset;
			//x = owner.x + lengthdir_x(orbitLength, round(orbitPlace));
			x = owner.x;
			//y = owner.y - 16 + lengthdir_y(orbitLength, round(orbitPlace));
			y = owner.y - 16;
			image_xscale = image_yscale + 0.5;
			break;}
		case Weapons.PsychoAxe:{
			//part_type_sprite(part, upg[$ "sprite"], false, false, image_index);
			x = xstart + lengthdir_x(round(orbitLength), round(orbitPlace));
			y = ystart + lengthdir_y(round(orbitLength), round(orbitPlace));
			orbitPlace -= 4 * Delta;
			orbitLength += 0.75 * Delta;
			//part_particles_create_colour(partSystem, xprevious, yprevious, part, c_yellow, 1);
			break;}
		case Weapons.CuttingBoard:{
			if (distance_to_point(xstart, ystart) > 5) {
				speed -= .30 * Delta;
				if (speed < 0) {
				    speed = 0;
				}
			}
			break;}
		case Weapons.Glowstick:{
			if (hits <= 0) {
			    sprite_index = sGlowstickThumbExplosion;
				speed = 0;
			}
			if (distance_to_object(owner) > 200) {
			    direction = point_direction(x,y,owner.x, owner.y);
			}
			break;}
		case Weapons.SpiderCooking:{
			x = owner.x;
			y = owner.y - (sprite_get_height(global.player[?"sprite"]) / 3);
			break;}
		case Weapons.IdolSong:{
			x = sine_wave(current_time  / 1000, 1 * (shoots % 2) ? 1 : -1, upg[$ "travelWidth"], idolStartX);
			break;}
		case Weapons.BounceBall:{
			//if (direction != 270) {
			//    direction += 15 * (direction > 270) ? 1 : -1 ;
			//}
			
			//if (direction < 270) {
			//    direction += 5;
			//}
			//if (direction > 270) {
			//    direction -= 5;
			//}
			if (vspeed < upg[$ "speed"]) {
				vspeed += 0.55 * Delta;
			}
			move_and_collide(hspd, vspd, oEnemy);
			image_angle+=10;
			break;
		}
		case Weapons.BreatheInTypeAsacoco:{
			if (sprite_index == sBreathAsacoco) {
			    image_xscale = 1;
				image_yscale = 1;
				image_angle += (asaRotationSpeed * asaDirection) * Delta;
			}
			else{
				image_xscale = upg[$ "size"];
				image_yscale = upg[$ "size"];
			}
			if (vspd < 50 and asaDuration > 0) {
			    vspd += 0.40 * Delta;
			}
			if (asaDuration > 0) {
			    asaDuration -= 1/60 * Delta;
			}
			else{
				vspd = 0;
				hspd = 0;
				speed = 0;
				asaSpeed = 0;
				sprite_index = sBombExplosion;
				image_angle = 0;
				image_index = 0;
			}
			y += vspd * Delta;
			x += (asaSpeed * asaDirection) * Delta;
			break;}
		case Weapons.EliteCooking:{
			if (poolSize != 1) {
			    poolSize -= 1;
			}			
			break;}
		case Weapons.StreamOfTears:{
			if (shoots == -1) {
			    x = owner.x + lengthdir_x(16, round(orbitPlace));
				y = owner.y + lengthdir_y(16, round(orbitPlace));
				orbitPlace += 2 * Delta;
				image_angle = point_direction(owner.x, owner.y, x, y);
			}
			else{
				x = owner.x - lengthdir_x(16, round(orbitPlace));
				y = owner.y - lengthdir_y(16, round(orbitPlace));
				orbitPlace += 2 * Delta;
				image_angle = point_direction(owner.x, owner.y, x, y);
			}
			break;}
			case Weapons.ImDieExplosion:{
				explosionSize += .10;
				image_xscale = explosionSize;
				image_yscale = explosionSize;
				oGame.shakeMagnitude = oGui.e;
				break;}
		//case Weapons.XPotato:{
		//	image_angle += .5;
		//	if (x > oPlayer.x + (view_wport[0] / 2)) { direction += 180; }
		//	if (x < oPlayer.x - (view_wport[0] / 2)) { direction += 180; }
		//	if (y > oPlayer.y + (view_hport[0] / 2)) { direction += 180; }
		//	if (y < oPlayer.y - (view_hport[0] / 2)) { direction += 180; }
		//	break;
		//}
	}
}
#endregion



if (hits <= 0 and upg[$ "id"] != Weapons.Glowstick) {
	image_alpha=0;
}

//if (socket == oPlayer.socket) {
sendMessage({
	command : Network.UpdateUpgrade,
	socket,
	upgID,
	sprite_index,
	direction,
	x,
	y,
	image_alpha,
	image_angle,
	image_xscale,
	image_yscale,	
	afterimg : json_stringify(afterimage)
});
//	buffer_seek(oClient.clientBuffer, buffer_seek_start, 0);
//	buffer_write(oClient.clientBuffer, buffer_u8, Network.UpdateUpgrade);
//	buffer_write(oClient.clientBuffer, buffer_u8, oPlayer.socket);
//	buffer_write(oClient.clientBuffer, buffer_u16, upgID);
//	buffer_write(oClient.clientBuffer, buffer_u16, x);
//	buffer_write(oClient.clientBuffer, buffer_u16, y);
//	buffer_write(oClient.clientBuffer, buffer_u16, image_alpha);
//	buffer_write(oClient.clientBuffer, buffer_u16, image_angle);
//	network_send_udp_raw(oClient.client, global.serverip, global.port, oClient.clientBuffer, buffer_tell(oClient.clientBuffer));
//}
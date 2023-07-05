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
	switch (upg[$"id"]) {
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
			if (alarm_get(1) > 0) {
			    y-=1.75;
				if (instance_exists(CE)) {
					direction = point_direction(x,y,CE.x, CE.y);
					image_angle = point_direction(x,y,CE.x, CE.y);
				}				
			}else {image_alpha = 1;}		
			break;}
		case Weapons.BlBook:{
			x = owner.x + lengthdir_x(orbit_length, orbit_place);
			y = owner.y - 16 + lengthdir_y(orbit_length, orbit_place);
			orbit_place-=3;
			break;}
		case Weapons.PsychoAxe:{
			//part_type_sprite(part, upg[$"sprite"], false, false, image_index);
			x = xstart + lengthdir_x(orbit_length, orbit_place);
			y = ystart + lengthdir_y(orbit_length, orbit_place);
			orbit_place-=4;
			orbit_length += 0.75;
			//part_particles_create_colour(partSystem, xprevious, yprevious, part, c_yellow, 1);
			break;}
		case Weapons.CuttingBoard:{
			if (distance_to_point(xstart, ystart) > 5) {
				speed -= .30;
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
			x = sine_wave(current_time / 1000, 1, 64, xstart);
			break;}
		case Weapons.BounceBall:{
			//if (direction != 270) {
			//    direction += 15 * (direction > 270) ? 1 : -1 ;
			//}
			if (direction < 270) {
			    direction += 5;
			}
			if (direction > 270) {
			    direction -= 5;
			}
			image_angle+=10;
			break;
		}
	}
}
#endregion



if (hits <= 0 and upg[$"id"] != Weapons.Glowstick) {
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
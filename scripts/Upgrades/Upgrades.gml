#macro UPGRADES global.upgrades
global.upgrade=0;
#region Null Upgrade
global.null=ds_map_create()
ds_map_add(global.null, "name", "");
ds_map_add(global.null, "sprite", blank);
ds_map_add(global.null, "thumb", blank);
ds_map_add(global.null, "level", "");
ds_map_add(global.null, "dmg", 1);
ds_map_add(global.null, "cooldown", 0);
ds_map_add(global.null, "speed", 0);
ds_map_add(global.null, "hits", 0);
global.upgradesAvaliable=ds_list_create();
for (i=0; i<4; i++) {
    global.upgrade_options[i]=global.null;
}
#endregion
#region Upgrades
/// @function					createUpgrade(id, name, sprite, thumbnail, damage, cooldown, speed, hits);
/// @param {integer}		id			
/// @param {string}		name	Upgrade Name
/// @param {index}		sprite		
/// @param {index}		thumbnail
/// @param {integer}		damage
/// @param {real}			cooldown
/// @param {integer}		speed
/// @param {integer}		hits
/// @description             Show a message whenever the function is called.
function createUpgrade(_id, _name, _sprite, _thumb, _dmg, _cooldown, _speed, _hits)
{
	global.upgradesAvaliable[_id]=ds_map_create();
	var m = global.upgradesAvaliable[_id];
	ds_map_add(m, "name", _name);
	ds_map_add(m, "sprite", _sprite);
	ds_map_add(m, "thumb", _thumb);
	ds_map_add(m, "level", 1);
	ds_map_add(m, "dmg", _dmg);
	ds_map_add(m, "cooldown", _cooldown);
	ds_map_add(m, "speed", _speed);
	ds_map_add(m, "hits", _hits);
}
//createUpgrade(0,"Speed", suSpeed);		
//createUpgrade(0,"Atk", suATK,10,3);		
enum weapons
{
	AmePistol,
	Flying_Knife,
	Knife,
	DouglasShoot
}
createUpgrade(weapons.AmePistol,"AmePistol", sAmeShoot, sAmePistol,10,3,4,1);
createUpgrade(weapons.Flying_Knife,"Flying Knife", suFlyingKnife, sKnife,10,3,2,1);
createUpgrade(weapons.Knife,"Knife", suNormalKnife, sKnife,10,3,0,1);
createUpgrade(weapons.DouglasShoot,"DouglasShoot", sDouglasShoot, sDouglasShoot,10,3,3,100);
#endregion

function randomUpgrades(){
	random_set_seed(current_time);
	onlist=false;
	name="";
	for (i=0; i<4; i++) {
		    name = global.upgradesAvaliable[irandom_range(0,array_length(global.upgradesAvaliable)-1)][?"name"];
		    global.upgrade_options[i] = name		
	}
}	

function tickPowers(){
	if (attacktick == true and UPGRADES[0][?"name"]!="") {
		attacktick=false;
		alarm[2]=120;
		for (i=0; i < array_length(UPGRADES); i++) {
			if (UPGRADES[i] != global.null) {
			    inst = (instance_create_layer(x,y,"Upgrades",oUpgrade));
				inst.upg=UPGRADES[i];
			}			
		}
	}
}

function defaultBehaviour()
{
if (oPlayer.image_xscale==1) direction = point_direction(x,y,x+100,y);
		else direction = point_direction(x,y,x-100,y);
		image_speed=1;
	    image_xscale=oPlayer.image_xscale;
}


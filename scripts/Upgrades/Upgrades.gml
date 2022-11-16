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
function createUpgrade(_id, _name, _level, _sprite, _thumb, _mindmg, _maxdmg, _cooldown, _speed, _hits, _type, _shoots, _perk = 0)
{
	global.upgradesAvaliable[_id][0]=global.null;
	global.upgradesAvaliable[_id][_level]=ds_map_create();
	var m = global.upgradesAvaliable[_id][_level];
	ds_map_add(m, "id", _id);
	ds_map_add(m, "name", _name);
	ds_map_add(m, "sprite", _sprite);
	ds_map_add(m, "thumb", _thumb);
	ds_map_add(m, "level", _level);
	ds_map_add(m, "mindmg", _mindmg);
	ds_map_add(m, "maxdmg", _maxdmg);
	ds_map_add(m, "cooldown", _cooldown);
	ds_map_add(m, "speed", _speed);
	ds_map_add(m, "hits", _hits);
	ds_map_add(m, "type", _type);	
	ds_map_add(m, "shoots", _shoots);	
	ds_map_add(m, "perk", _perk);	
}
//createUpgrade(0,"Speed", suSpeed);		
//createUpgrade(0,"Atk", suATK,10,3);		
enum weapons
{
	AmePistol,
	GuraTrident,
	Knife,
	DouglasShoot
}
//AmePistol
createUpgrade(weapons.AmePistol,"AmePistol",1, sAmeShoot, sAmePistol,7,13,80,4,1, "red", 3);
createUpgrade(weapons.AmePistol,"AmePistol",2, sAmeShoot, sAmePistol,7,13,80,4,2, "red", 4);
createUpgrade(weapons.AmePistol,"AmePistol",3, sAmeShoot, sAmePistol,7*1.25,13*1.25,80,4,2, "red", 4);
createUpgrade(weapons.AmePistol,"AmePistol",4, sAmeShoot, sAmePistol,7*1.25,13*1.25,80,4,2, "red", 4);
createUpgrade(weapons.AmePistol,"AmePistol",5, sAmeShoot, sAmePistol,7*1.25,13*1.25,80,4,3, "red", 4);
createUpgrade(weapons.AmePistol,"AmePistol",6, sAmeShoot, sAmePistol,(7*1.25)*1.40,(13*1.25)*1.40,80,4,2, "red", 4);
createUpgrade(weapons.AmePistol,"AmePistol",7, sAmeShoot, sAmePistol,(7*1.25)*1.40,(13*1.25)*1.40,80,4,2, "red", 6);
//GuraTrident
createUpgrade(weapons.GuraTrident,"GuraTrident",1, sGuraTridentShoot, sGuraTrident,11,21,70,4,999, "red", 1);

#endregion

function randomUpgrades(){
	random_set_seed(current_time);
	name="";
	for (i=0; i<4; i++) {
		    name = global.upgradesAvaliable[irandom_range(0,array_length(global.upgradesAvaliable)-1)][1][?"name"];
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
				inst.speed=UPGRADES[i][?"speed"];
				inst.hits=UPGRADES[i][?"hits"];
				inst.shoots = UPGRADES[i][?"shoots"];
				inst.sprite_index=UPGRADES[i][?"sprite"];
				inst.image_xscale=oPlayer.image_xscale;
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



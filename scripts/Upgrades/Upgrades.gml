#macro UPGRADES global.upgrades
global.upgrade=0;
global.upgradeCooldown[0] = 0;
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
	global.upgradesAvaliable=[0];
	for (i=0; i<4; i++) {
	    global.upgrade_options[i]=global.null;
}
#endregion
#region Upgrades
function createUpgrade(_id, _name, _level, _sprite, _thumb, _mindmg, _maxdmg, _cooldown, _duration, _hitCooldown, _canBeHasted, _speed, _hits, _type, _shoots, _desc = "")
{
	global.upgradesAvaliable[_id][0]=global.null;
	global.upgradesAvaliable[_id][_level]=ds_map_create();
	var m = global.upgradesAvaliable[_id][_level];
	ds_map_add(m, "id", _id);
	ds_map_add(m, "name", _name);
	ds_map_add(m, "level", _level);
	ds_map_add(m, "sprite", _sprite);
	ds_map_add(m, "thumb", _thumb);
	ds_map_add(m, "mindmg", _mindmg);
	ds_map_add(m, "maxdmg", _maxdmg);
	ds_map_add(m, "cooldown", _cooldown);
	ds_map_add(m, "duration", _duration);
	ds_map_add(m, "hitCooldown", _hitCooldown);
	ds_map_add(m, "canBeHasted", _canBeHasted);
	ds_map_add(m, "speed", _speed);
	ds_map_add(m, "hits", _hits);	
	ds_map_add(m, "type", _type);	
	ds_map_add(m, "shoots", _shoots);	
	ds_map_add(m, "desc", _desc);
	ds_map_add(m, "style", "weapon");	
	global.upgradeCooldown[_id] = 0;
}
function createUpgradeP2(_id, _level, _knockbackSpeed, _knockbackDuration, _perk = 0, _character = 0)
{
	var m = global.upgradesAvaliable[_id][_level];
	ds_map_add(m, "knockbackSpeed", _knockbackSpeed);
	ds_map_add(m, "knockbackDuration", _knockbackDuration);
	ds_map_add(m, "perk", _perk);
	ds_map_add(m, "characterid", _character);
}

enum weapons
{
	AmePistol,
	GuraTrident,
	InaTentacle,
	BlBook,
	PlugAsaCoco
}
function populateUpgrades(){
	#region Character Perks
		#region Amelia Perks
			#region AmePistol
				createUpgrade(weapons.AmePistol, "AmePistol", 1, sAmeShoot, sAmePistol, 7, 13, 80, 120, 10, true, 5, 1, "red", 3, "Shoots 3 Projectiles forward. Horizontal only.");
				createUpgradeP2(weapons.AmePistol, 1, 0, 0, 1, Characters.Amelia);
				createUpgrade(weapons.AmePistol, "AmePistol", 2, sAmeShoot, sAmePistol, 7, 13, 80, 120, 10, true, 5, 2, "red", 4, "Shoot 1 additional shot, and each bullet can pierce +1 times.");
				createUpgradeP2(weapons.AmePistol, 2, 0, 0, 1, Characters.Amelia);
				createUpgrade(weapons.AmePistol, "AmePistol", 3, sAmeShoot, sAmePistol, 7*1.25, 13*1.25, 80, 120, 10, true, 5, 2, "red", 4, "Increase damage by 25%.");
				createUpgradeP2(weapons.AmePistol, 3, 0, 0, 1, Characters.Amelia);
				createUpgrade(weapons.AmePistol, "AmePistol", 4, sAmeShoot, sAmePistol, 7*1.25, 13*1.25, 80, 120, 10, true, 5, 2, "red", 4, "Bullets ricochet if hit limit is reached.");
				createUpgradeP2(weapons.AmePistol, 4, 0, 0, 1, Characters.Amelia);
				createUpgrade(weapons.AmePistol, "AmePistol", 5, sAmeShoot, sAmePistol, 7*1.25, 13*1.25, 80*0.75, 120, 10, true, 5, 3, "red", 4, "Each bullet can pierce +1 times. Reduce the time between attacks by 25%.");
				createUpgradeP2(weapons.AmePistol, 5, 0, 0, 1, Characters.Amelia);
				createUpgrade(weapons.AmePistol, "AmePistol", 6, sAmeShoot, sAmePistol, 7*1.25*1.40, 13*1.25*1.40, 80*0.75, 120, 10, true, 5, 3, "red", 4, "Increase damage by 40%.");
				createUpgradeP2(weapons.AmePistol, 6, 0, 0, 1, Characters.Amelia);
				createUpgrade(weapons.AmePistol, "AmePistol", 7, sAmeShoot, sAmePistol, 7*1.25*1.40, 13*1.25*1.40, 80*0.75, 120, 10, true, 5, 3, "red", 6, "Shoot 2 additional shots, and pistol becomes spread type.");
				createUpgradeP2(weapons.AmePistol, 7, 0, 0, 1, Characters.Amelia);
			#endregion
		#endregion
	
		#region Gura Perks
			#region GuraTrident
				//createUpgrade(weapons.GuraTrident,"GuraTrident",1, sGuraTridentShoot, sGuraTrident,11,21,70,true,0,999, "red", 1,1,"Mid ranged stab attack in front.");
				//createUpgrade(weapons.GuraTrident,"GuraTrident",2, sGuraTridentShoot, sGuraTrident,11*1.20,21*1.20,70,true,0,999, "red", 1,1,"Increase damage by 20%. ");
				//createUpgrade(weapons.GuraTrident,"GuraTrident",3, sGuraTridentShoot, sGuraTrident,11*1.20,21*1.20,70,true,0,999, "red", 2,1,"Stab one extra time, forming a V shape. ");
				//createUpgrade(weapons.GuraTrident,"GuraTrident",4, sGuraTridentShoot, sGuraTrident,11*1.20,21*1.20,70*0.85,true,0,999, "red", 2,1,"Reduce the time between attacks by 15%. ");
				//createUpgrade(weapons.GuraTrident,"GuraTrident",5, sGuraTridentShoot, sGuraTrident,11*1.20*1.40,21*1.20*1.40,70*0.85,true,0,999, "red", 2,1,"Increase damage by 40%. ");
				//createUpgrade(weapons.GuraTrident,"GuraTrident",6, sGuraTridentShoot, sGuraTrident,11*1.20*1.40,21*1.20*1.40,70*0.85,true,0,999, "red", 2,1,"Increase attack area by 25%. ");
				//createUpgrade(weapons.GuraTrident,"GuraTrident",7, sGuraTridentShoot, sGuraTrident,11*1.20*1.40,21*1.20*1.40,70*0.85,true,0,999, "red", 3,1,"Thrust 3 times, in a fork-like shape. ");
			#endregion
		#endregion
	
		#region Ina Perks
			#region InaTentacle
				//createUpgrade(weapons.InaTentacle,"InaTentacle",1, sInaTentacleShoot, sInaTentacle,8,16,90,true,0,999, "red", 1,1,"");
				//createUpgrade(weapons.InaTentacle,"InaTentacle",2, sInaTentacleShoot, sInaTentacle,8*1.20,16*1.20,90,true,0,999, "red", 1,1,"");
				//createUpgrade(weapons.InaTentacle,"InaTentacle",3, sInaTentacleShoot, sInaTentacle,8*1.20,16*1.20,90*0.80,true,0,999, "red", 1,1,"");
				//createUpgrade(weapons.InaTentacle,"InaTentacle",4, sInaTentacleShoot, sInaTentacle,8*1.20,16*1.20,90*0.80,true,0,999, "red", 1,1,""); //atkarea *1.25
				//createUpgrade(weapons.InaTentacle,"InaTentacle",5, sInaTentacleShoot, sInaTentacle,8*1.20*1.5,16*1.20*1.5,90*0.80,true,0,999, "red", 1,1,""); //atkarea *1.25
				//createUpgrade(weapons.InaTentacle,"InaTentacle",6, sInaTentacleShoot, sInaTentacle,8*1.20*1.5,16*1.20*1.5,90*0.80,true,0,999, "red", 1,1,""); //atkarea *1.25, knockback small
				//createUpgrade(weapons.InaTentacle,"InaTentacle",7, sInaTentacleShoot, sInaTentacle,8*1.20*1.5,16*1.20*1.5,90*0.80,true,0,999, "red", 2,1,""); //atkarea *1.25, knockback small
			#endregion
		#endregion
	#endregion
	
	//createUpgrade(weapons.PlugAsaCoco,"Plug-type Asacoco",1,sAsaCocoShoot,sAsaCocoThumb,10,18,150,true,20,99,"white",1,0);
}

#endregion
//generate random list of possible upgrades
function randomUpgrades(){
	random_set_seed(current_time);
	name="";
	var ups = [];
	if (UPGRADES[0][?"level"] < 7) {
	    array_push(ups, global.Player[?"weapon"])
	}	
	for (var i = 0; i < array_length(global.upgradesAvaliable); ++i) {
	    array_push(ups, global.upgradesAvaliable[i]);
	}
	for (var i = 0; i < array_length(ItemList); ++i) {
	    array_push(ups, ItemList[i]);
	}
	for (var i = 0; i < array_length(PerkList); ++i) {
		if (PerkList[i][0][?"characterid"] == global.Player[?"id"]) {
		    array_push(ups, PerkList[i]);
			//show_debug_message("Added: " + string( PerkList[i][0][?"name"]));
		}	    
	}
	//var str = "";
	//for (var i = 0; i < array_length(ups); ++i) {
	//    str = str + ", " + ups[i][1][?"name"];
	//}
	//show_message(str);
	
	show_debug_message(string(array_length(ups)));
	for (i=0; i<4; i++) {
		do {
			var rdnnumber = irandom_range(0,array_length(ups)-1);
			var pickedupgrade = ups[rdnnumber][1];
		    //name = pickedupgrade[?"name"];
			var isperk = pickedupgrade[?"perk"];
			if (pickedupgrade[?"perk"] == 1) {
				show_debug_message("picked a perk: " + string(pickedupgrade[?"name"]));
			    if (pickedupgrade[?"characterid"] == global.Player[?"id"]) {
				    isperk = 0;
				}
			}			
			array_delete(ups, rdnnumber, 1);
		} until (isperk != 1);
		array_delete(ups, rdnnumber, 1);
		global.upgrade_options[i] = pickedupgrade;
	}
	//global.upgrade_options[0] = global.Player[?"weapon"][1];
	//global.upgrade_options[1] = ItemList[ItemIds.Uber_Sheep][1];
	//global.upgrade_options[1] = global.upgradesAvaliable[weapons.PlugAsaCoco][1][?"name"];
}	

function tickPowers(){
	if (attacktick == true and UPGRADES[0][?"name"]!="") {
		//attacktick=false;
		//alarm[2]=120;
		for (i=0; i < array_length(UPGRADES); i++) {
			if (UPGRADES[i] != global.null and global.upgradeCooldown[UPGRADES[i][?"id"]] <= 0) {
			    inst = (instance_create_layer(x,y-8,"Upgrades",oUpgrade));
				inst.upg=UPGRADES[i];
				inst.speed=UPGRADES[i][?"speed"];
				inst.hits=UPGRADES[i][?"hits"];
				inst.shoots = UPGRADES[i][?"shoots"];
				inst.sprite_index=UPGRADES[i][?"sprite"];
				//inst.image_xscale=oPlayer.image_xscale;
			}			
		}
	}
}

function defaultBehaviour(){
	if (oPlayer.image_xscale==1) 
	{
		direction = point_direction(x,y,x+100,y+diroffset);
	}
	else 
	{
		direction = point_direction(x,y,x-100,y-diroffset);
	}
	image_xscale=oPlayer.image_xscale;
	image_speed=1;
}

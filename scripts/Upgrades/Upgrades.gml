
#macro UPGRADES global.upgrades
global.upgrade=0;
global.upgradeCooldown[0] = 0;
#region Null Upgrade
	global.null=ds_map_create()
	var m = global.null;
	ds_map_add(m, "id", 0);
	ds_map_add(m, "name", "null");
	ds_map_add(m, "level", 0);
	ds_map_add(m, "maxlevel", 0);
	ds_map_add(m, "sprite", blank);
	ds_map_add(m, "thumb", blank);
	ds_map_add(m, "mindmg", 0);
	ds_map_add(m, "maxdmg", 0);
	ds_map_add(m, "cooldown", 1);
	ds_map_add(m, "duration", 0);
	ds_map_add(m, "hitCooldown", 0);
	ds_map_add(m, "canBeHasted", false);
	ds_map_add(m, "speed", 0);
	ds_map_add(m, "hits", 0);	
	ds_map_add(m, "type", "white");	
	ds_map_add(m, "shoots", 0);	
	ds_map_add(m, "desc", "null");
	ds_map_add(m, "style", ItemTypes.Weapon);	
	global.upgradesAvaliable=[0];
	for (i=0; i<4; i++) {
	    global.upgradeOptions[i]=global.null;
}
#endregion
enum ItemTypes {
	Weapon,
	Item,
	Perk,
	Collab
}

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
	ds_map_add(m, "style", ItemTypes.Weapon);	
	global.upgradeCooldown[_id] = 0;
}
function createUpgradeP2(_id, _level, _maxlevel, _knockbackSpeed, _knockbackDuration, _perk = 0, _character = -1)
{
	var m = global.upgradesAvaliable[_id][_level];
	ds_map_add(m, "knockbackSpeed", _knockbackSpeed);
	ds_map_add(m, "knockbackDuration", _knockbackDuration);
	ds_map_add(m, "perk", _perk);
	ds_map_add(m, "characterid", _character);
	ds_map_add(m, "maxlevel", _maxlevel);
}

enum Weapons
{
	AmePistol,
	GuraTrident,
	PowerofAtlantis, //TODO: water area, more damage
	//InaTentacle,
	BlBook, //TODO: area
	//CEOTears,
	//CuttingBoard,
	EliteLavaBucket, //TODO: lava area
	//FanBean,
	//Glowstick,
	HoloBomb, //TODO: explosion radius
	//IdolSong,
	PlugAsaCoco, //TODO: afterimage, knockback lv 6
	//PsychoAxe,
	//SpiderCooking,
	//WamyWater,
	//X-Potato
}
function populateUpgrades(){
	#region Character Perks
		#region Amelia Perks
			#region AmePistol
				createUpgrade(Weapons.AmePistol, "AmePistol", 1, sAmeShoot, sAmePistol, 7, 13, 80, 120, 10, true, 5, 1, "red", 3, "Shoots 3 Projectiles forward. Horizontal only.");
				createUpgradeP2(Weapons.AmePistol, 1, 7, 0, 0, 1, Characters.Amelia);
				createUpgrade(Weapons.AmePistol, "AmePistol", 2, sAmeShoot, sAmePistol, 7, 13, 80, 120, 10, true, 5, 2, "red", 4, "Shoot [1] additional shot, and each bullet can pierce [+1]  times.");
				createUpgradeP2(Weapons.AmePistol, 2, 7, 0, 0, 1, Characters.Amelia);
				createUpgrade(Weapons.AmePistol, "AmePistol", 3, sAmeShoot, sAmePistol, 7*1.25, 13*1.25, 80, 120, 10, true, 5, 2, "red", 4, "Increase damage by [25%] .");
				createUpgradeP2(Weapons.AmePistol, 3, 7, 0, 0, 1, Characters.Amelia);
				createUpgrade(Weapons.AmePistol, "AmePistol", 4, sAmeShoot, sAmePistol, 7*1.25, 13*1.25, 80, 120, 10, true, 5, 2, "red", 4, "Bullets ricochet if hit limit is reached.");
				createUpgradeP2(Weapons.AmePistol, 4, 7, 0, 0, 1, Characters.Amelia);
				createUpgrade(Weapons.AmePistol, "AmePistol", 5, sAmeShoot, sAmePistol, 7*1.25, 13*1.25, 80*0.75, 120, 10, true, 5, 3, "red", 4, "Each bullet can pierce [+1]  times. Reduce the time between attacks by [25%] .");
				createUpgradeP2(Weapons.AmePistol, 5, 7, 0, 0, 1, Characters.Amelia);
				createUpgrade(Weapons.AmePistol, "AmePistol", 6, sAmeShoot, sAmePistol, 7*1.25*1.40, 13*1.25*1.40, 80*0.75, 120, 10, true, 5, 3, "red", 4, "Increase damage by [40%] .");
				createUpgradeP2(Weapons.AmePistol, 6, 7, 0, 0, 1, Characters.Amelia);
				createUpgrade(Weapons.AmePistol, "AmePistol", 7, sAmeShoot, sAmePistol, 7*1.25*1.40, 13*1.25*1.40, 80*0.75, 120, 10, true, 5, 3, "red", 6, "Shoot [2]  additional shots, and pistol becomes spread type.");
				createUpgradeP2(Weapons.AmePistol, 7, 7, 0, 0, 1, Characters.Amelia);
			#endregion
		#endregion	
	
		#region Gura Perks
			#region GuraTrident
				createUpgrade(Weapons.GuraTrident,"GuraTrident",1, sGuraTridentShoot, sGuraTrident,11,21,70,100,20,true,0,999, "red", 1,"Mid ranged stab attack in front.");
				createUpgradeP2(Weapons.GuraTrident, 1, 7, 0, 0, 1, Characters.Gura);
				createUpgrade(Weapons.GuraTrident,"GuraTrident",2, sGuraTridentShoot, sGuraTrident,11*1.20,21*1.20,70,100,20,true,0,999, "red", 1,"Increase damage by 20%. ");
				createUpgradeP2(Weapons.GuraTrident, 2, 7, 0, 0, 1, Characters.Gura);
				createUpgrade(Weapons.GuraTrident,"GuraTrident",3, sGuraTridentShoot, sGuraTrident,11*1.20,21*1.20,70,100,20,true,0,999, "red", 2,"Stab one extra time, forming a V shape. ");
				createUpgradeP2(Weapons.GuraTrident, 3, 7, 0, 0, 1, Characters.Gura);
				createUpgrade(Weapons.GuraTrident,"GuraTrident",4, sGuraTridentShoot, sGuraTrident,11*1.20,21*1.20,70*0.85,100,20,true,0,999, "red", 2,"Reduce the time between attacks by 15%. ");
				createUpgradeP2(Weapons.GuraTrident, 4, 7, 0, 0, 1, Characters.Gura);
				createUpgrade(Weapons.GuraTrident,"GuraTrident",5, sGuraTridentShoot, sGuraTrident,11*1.20*1.40,21*1.20*1.40,70*0.85,100,20,true,0,999, "red", 2,"Increase damage by 40%. ");
				createUpgradeP2(Weapons.GuraTrident, 5, 7, 0, 0, 1, Characters.Gura);
				createUpgrade(Weapons.GuraTrident,"GuraTrident",6, sGuraTridentShoot, sGuraTrident,11*1.20*1.40,21*1.20*1.40,70*0.85,100,20,true,0,999, "red", 2,"Increase attack area by 25%. ");
				createUpgradeP2(Weapons.GuraTrident, 6, 7, 0, 0, 1, Characters.Gura);
				createUpgrade(Weapons.GuraTrident,"GuraTrident",7, sGuraTridentShoot, sGuraTrident,11*1.20*1.40,21*1.20*1.40,70*0.85,100,20,true,0,999, "red", 3,"Thrust 3 times, in a fork-like shape. ");
				createUpgradeP2(Weapons.GuraTrident, 7, 7, 0, 0, 1, Characters.Gura);
			#endregion
			
			#region PowerofAtlantis
				//var pdmg = global.player[?"atk"];
				createUpgrade(Weapons.PowerofAtlantis, "Power of Atlantis", 1, sWaterPoolStart, sPowerofAtlantisThumb, 6, 10, 600, 360, 45, true, 0, 999, "white", 1, "Every 10 seconds, create a whirlpool that draws in targets and takes 15% more damage, lasting 6 seconds and deals 30% damage every 0.5 seconds.");
				createUpgradeP2(Weapons.PowerofAtlantis, 1, 3, 0 ,0,1,-2);
				createUpgrade(Weapons.PowerofAtlantis, "Power of Atlantis", 2, sWaterPoolStart, sPowerofAtlantisThumb, 6, 10, 600, 360, 45, true, 0, 999, "white", 2, "Every 10 seconds, create a whirlpool that draws in targets and takes 30% more damage, lasting 6 seconds and deals 40% damage every 0.5 seconds.");
				createUpgradeP2(Weapons.PowerofAtlantis, 2, 3, 0 ,0,1,-2);
				createUpgrade(Weapons.PowerofAtlantis, "Power of Atlantis", 3, sWaterPoolStart, sPowerofAtlantisThumb, 6, 10, 600, 360, 45, true, 0, 999, "white", 3, "Every 10 seconds, create a whirlpool that draws in targets and takes 50% more damage, lasting 6 seconds and deals 50% damage every 0.5 seconds.");
				createUpgradeP2(Weapons.PowerofAtlantis, 3, 3, 0 ,0,1,-2);
			#endregion
		#endregion
	
		#region Ina Perks
			#region InaTentacle
				//createUpgrade(Weapons.InaTentacle,"InaTentacle",1, sInaTentacleShoot, sInaTentacle,8,16,90,true,0,999, "red", 1,1,"");
				//createUpgrade(Weapons.InaTentacle,"InaTentacle",2, sInaTentacleShoot, sInaTentacle,8*1.20,16*1.20,90,true,0,999, "red", 1,1,"");
				//createUpgrade(Weapons.InaTentacle,"InaTentacle",3, sInaTentacleShoot, sInaTentacle,8*1.20,16*1.20,90*0.80,true,0,999, "red", 1,1,"");
				//createUpgrade(Weapons.InaTentacle,"InaTentacle",4, sInaTentacleShoot, sInaTentacle,8*1.20,16*1.20,90*0.80,true,0,999, "red", 1,1,""); //atkarea *1.25
				//createUpgrade(Weapons.InaTentacle,"InaTentacle",5, sInaTentacleShoot, sInaTentacle,8*1.20*1.5,16*1.20*1.5,90*0.80,true,0,999, "red", 1,1,""); //atkarea *1.25
				//createUpgrade(Weapons.InaTentacle,"InaTentacle",6, sInaTentacleShoot, sInaTentacle,8*1.20*1.5,16*1.20*1.5,90*0.80,true,0,999, "red", 1,1,""); //atkarea *1.25, knockback small
				//createUpgrade(Weapons.InaTentacle,"InaTentacle",7, sInaTentacleShoot, sInaTentacle,8*1.20*1.5,16*1.20*1.5,90*0.80,true,0,999, "red", 2,1,""); //atkarea *1.25, knockback small
			#endregion
		#endregion
	#endregion
	
	#region BLBook
		createUpgrade(Weapons.BlBook, "BL Book", 1, sBLBook, sBLBookThumb, 10, 18, 360, 120, 20, 1, 3, 7, "white", 3, "Repels targets with orbiting BL Books.");
		createUpgradeP2(Weapons.BlBook, 1, 7, 3, 5);
		createUpgrade(Weapons.BlBook, "BL Book", 2, sBLBook, sBLBookThumb, 10, 18, 360, 120, 20, 1, 3, 7, "white", 4, "Add [1]  additional book. ");
		createUpgradeP2(Weapons.BlBook, 2, 7, 3, 5);
		createUpgrade(Weapons.BlBook, "BL Book", 3, sBLBook, sBLBookThumb, 10*1.30, 18*1.30, 360, 180, 20, 1, 3, 7, "white", 4, "Increase damage by [30%]  and increase duration by [1]  second. ");
		createUpgradeP2(Weapons.BlBook, 3, 7, 3, 5);
		createUpgrade(Weapons.BlBook, "BL Book", 4, sBLBook, sBLBookThumb, 10*1.30, 18*1.30, 360, 180, 20, 1, 3, 7, "white", 5, "Add [1]  additional book.");
		createUpgradeP2(Weapons.BlBook, 4, 7, 3, 5);
		createUpgrade(Weapons.BlBook, "BL Book", 5, sBLBook, sBLBookThumb, 10*1.30*1.40, 18*1.30*1.40, 360, 180, 20, 1, 3, 7, "white", 5, "Increase Damage by [40%] .");
		createUpgradeP2(Weapons.BlBook, 5, 7, 3, 5);
		createUpgrade(Weapons.BlBook, "BL Book", 6, sBLBook, sBLBookThumb, 10*1.30*1.40, 18*1.30*1.40, 360, 180, 20, 1, 3, 7, "white", 6, "Add [1]  additional book. ");
		createUpgradeP2(Weapons.BlBook, 6, 7, 3, 5);
		createUpgrade(Weapons.BlBook, "BL Book", 7, sBLBook, sBLBookThumb, 10*1.30*1.40*1.40, 18*1.30*1.40*1.40, 360, 180, 20, 1, 3, 7, "white", 6, "Increase damage by [40%] .");
		createUpgradeP2(Weapons.BlBook, 7, 7, 3, 5);
	#endregion
	
	#region CEO Tears
		//Damage: 	100% (7 – 13)
		//Attack time: 	30 (0.5 s)
		//Attack count: 	1
		//Hit limit: 	1
		//Hit cooldown: 	30 (0.5 s)
		//Area: 	100%
		//Duration: 	90 (1.5 s)
		//Projectile speed: 	4 
		//Level 1 	Fires rapid tears at random targets.
		//Level 2 	Increases damage by 20%.
		//Level 3 	Shoot 2 tears.
		//Level 4 	Reduce the time between attacks by 33%.
		//Level 5 	Tears are 25% faster and increase damage by 20%.
		//Level 6 	Reduce the time between attacks by 50%.
		//Level MAX 	Shoot 4 tears. 
	#endregion
	
	#region EliteLavaBucket
		createUpgrade(Weapons.EliteLavaBucket, "Elite Lava Bucket", 1, sLavaPoolStart, sEliteLavaBucketThumb, 6, 10, 300, 180, 45, true, 0, 999, "white", 1, "Drop lava on the ground, burning targets slowly.");
		createUpgradeP2(Weapons.EliteLavaBucket, 1, 7, 0 ,0);
		createUpgrade(Weapons.EliteLavaBucket, "Elite Lava Bucket", 2, sLavaPoolStart, sEliteLavaBucketThumb, 6, 10, 300, 180, 45, true, 0, 999, "white", 1, "Increase lava area by [20%]. ");
		createUpgradeP2(Weapons.EliteLavaBucket, 2, 7, 0 ,0);
		createUpgrade(Weapons.EliteLavaBucket, "Elite Lava Bucket", 3, sLavaPoolStart, sEliteLavaBucketThumb, 6, 10, 300, 180, 45, true, 0, 999, "white", 2, "Throw [2] lava buckets. ");
		createUpgradeP2(Weapons.EliteLavaBucket, 3, 7, 0 ,0);
		createUpgrade(Weapons.EliteLavaBucket, "Elite Lava Bucket", 4, sLavaPoolStart, sEliteLavaBucketThumb, 6*1.30, 10*1.30, 300, 240, 45, true, 0, 999, "white", 2, "Increase damage by [30%] and increase duration of lava by 1 second.");
		createUpgradeP2(Weapons.EliteLavaBucket, 4, 7, 0 ,0);
		createUpgrade(Weapons.EliteLavaBucket, "Elite Lava Bucket", 5, sLavaPoolStart, sEliteLavaBucketThumb, 6*1.30*1.30, 10*1.30*1.30, 300, 240, 45, true, 0, 999, "white", 2, "Increase damage by [30%].");
		createUpgradeP2(Weapons.EliteLavaBucket, 5, 7, 0 ,0);
		createUpgrade(Weapons.EliteLavaBucket, "Elite Lava Bucket", 6, sLavaPoolStart, sEliteLavaBucketThumb, 6*1.30*1.30, 10*1.30*1.30, 300, 240, 45, true, 0, 999, "white", 3, "Throw [3] lava buckets.");
		createUpgradeP2(Weapons.EliteLavaBucket, 6, 7, 0 ,0);
		createUpgrade(Weapons.EliteLavaBucket, "Elite Lava Bucket", 7, sLavaPoolStart, sEliteLavaBucketThumb, 6*1.30*1.30, 10*1.30*1.30, 300, 240, 45, true, 0, 999, "white", 4, "Throw [4] lava buckets and increase lava size by [20%].");
		createUpgradeP2(Weapons.EliteLavaBucket, 7, 7, 0 ,0);
	#endregion

	

	#region Holobomb
	createUpgrade(Weapons.HoloBomb, "Holo Bomb", 1, sHolobomb, sHolobomb, 12, 22, 120, 630, 20, true, 7, 1,"white", 1, "A bomb that explodes, dealing damage to all nearby targets.");
	createUpgradeP2(Weapons.HoloBomb, 1, 7, 0, 0);
	createUpgrade(Weapons.HoloBomb, "Holo Bomb", 2, sHolobomb, sHolobomb, 12, 22, 120, 630, 20, true, 7, 1,"white", 1, "Increase explosion size by [15%].");
	createUpgradeP2(Weapons.HoloBomb, 2, 7, 0, 0);
	createUpgrade(Weapons.HoloBomb, "Holo Bomb", 3, sHolobomb, sHolobomb, 12*1.20, 22*1.20, 120, 630, 20, true, 7, 1,"white", 1, "Increase damage by [20%].");
	createUpgradeP2(Weapons.HoloBomb, 3, 7, 0, 0);
	createUpgrade(Weapons.HoloBomb, "Holo Bomb", 4, sHolobomb, sHolobomb, 12*1.20, 22*1.20, 120, 630, 20, true, 7, 1,"white", 2, "Throw [2] bombs.");
	createUpgradeP2(Weapons.HoloBomb, 4, 7, 0, 0);
	createUpgrade(Weapons.HoloBomb, "Holo Bomb", 5, sHolobomb, sHolobomb, 12*1.20, 22*1.20, 120*0.80, 630, 20, true, 7, 1,"white", 2, "Reduce the time between attacks by [20%].");
	createUpgradeP2(Weapons.HoloBomb, 5, 7, 0, 0);
	createUpgrade(Weapons.HoloBomb, "Holo Bomb", 6, sHolobomb, sHolobomb, 12*1.20, 22*1.20, 120*0.80, 630, 20, true, 7, 1,"white", 2, "Increase explosion size by [20%].");
	createUpgradeP2(Weapons.HoloBomb, 6, 7, 0, 0);
	createUpgrade(Weapons.HoloBomb, "Holo Bomb", 7, sHolobomb, sHolobomb, 12*1.20, 22*1.20, 120*0.80, 630, 20, true, 7, 1,"white", 3, "Throw [3] bombs.");
	createUpgradeP2(Weapons.HoloBomb, 7, 7, 0, 0);
		//Damage: 	170% (12 – 22)
		//Attack time: 	120 (2 s)
		//Attack count: 	1
		//Attack delay: 	5 (0.08 s)
		//Hit limit: 	-
		//Hit cooldown: 	20 (0.33 s)
		//Area: 	100%
		//Duration: 	630 (10.5 s)
		//Projectile speed: 	7 
		//Level 1 	A bomb that explodes, dealing damage to all nearby targets.
		//Level 2 	Increase explosion size by 15%.
		//Level 3 	Increase damage by 20%.
		//Level 4 	Throw 2 bombs.
		//Level 5 	Reduce the time between attacks by 20%.
		//Level 6 	Increase explosion size by 20%.
		//Level MAX 	Throw 3 bombs. 
	#endregion
	
	#region Asacoco
		createUpgrade(Weapons.PlugAsaCoco,"Plug-type Asacoco",1,sAsaCocoShoot,sAsaCocoThumb, 10, 18, 150, 45, 10, true, 20, 999, "white", 1, "Fires a fast piercing tail at a random target.");
		createUpgradeP2(Weapons.PlugAsaCoco, 1, 7, 7, 15);
		createUpgrade(Weapons.PlugAsaCoco,"Plug-type Asacoco",2,sAsaCocoShoot,sAsaCocoThumb, 10*1.20, 18*1.20, 150, 45, 10, true, 20, 999, "white", 1, "Increase damage by [20%]. ");
		createUpgradeP2(Weapons.PlugAsaCoco, 2, 7, 7, 15);
		createUpgrade(Weapons.PlugAsaCoco,"Plug-type Asacoco",3,sAsaCocoShoot,sAsaCocoThumb, 10*1.20, 18*1.20, 150, 45, 10, true, 20, 999, "white", 2, "Fire an additional Asacoco. ");
		createUpgradeP2(Weapons.PlugAsaCoco, 3, 7, 7, 15);
		createUpgrade(Weapons.PlugAsaCoco,"Plug-type Asacoco",4,sAsaCocoShoot,sAsaCocoThumb, 10*1.20*1.30, 18*1.20*1.30, 150, 45, 10, true, 20, 999, "white", 2, "Increase damage by [30%]. ");
		createUpgradeP2(Weapons.PlugAsaCoco, 4, 7, 7, 15);
		createUpgrade(Weapons.PlugAsaCoco,"Plug-type Asacoco",5,sAsaCocoShoot,sAsaCocoThumb, 10*1.20*1.30, 18*1.20*1.30, 150, 45, 10, true, 20, 999, "white", 3, "Fire an additional Asacoco. ");
		createUpgradeP2(Weapons.PlugAsaCoco, 5, 7, 7, 15);
		createUpgrade(Weapons.PlugAsaCoco,"Plug-type Asacoco",6,sAsaCocoShoot,sAsaCocoThumb, 10*1.20*1.30, 18*1.20*1.30, 150, 45, 10, true, 20, 999, "white", 3, "Adds knockback on hit. ");
		createUpgradeP2(Weapons.PlugAsaCoco, 6, 7, 7, 15); 
		createUpgrade(Weapons.PlugAsaCoco,"Plug-type Asacoco",7,sAsaCocoShoot,sAsaCocoThumb, 10*1.20*1.30, 18*1.20*1.30, 150, 45, 10, true, 20, 999, "white", 4, "Fire an additional Asacoco. ");
		createUpgradeP2(Weapons.PlugAsaCoco, 7, 7, 7, 15); 
	#endregion
		
}

#endregion
//generate random list of possible upgrades
function randomUpgrades(){
	random_set_seed(current_time);
	name="";
	
	#region Generate the lists
		//function generateLists() {
		weapons_list = [];
		items_list = [];
		perks_list = [];
	
		#region Weapons List
			//show_message(UPGRADES[5][?"name"]);	
			if (UPGRADES[5] == global.null) {
				for (var i = 0; i < array_length(WEAPONS_LIST); ++i) {
					var maxed = false;
					var found = false;
					for (var j = 0; j < array_length(UPGRADES); ++j) {
						//show_message("A:" + string(UPGRADES[j][?"name"]));
						//show_message("B:" + string(global.upgradesAvaliable[i][1][?"name"]));
						if (UPGRADES[j][?"name"] == WEAPONS_LIST[i][1][?"name"]) {
							found = true;
						    if (UPGRADES[j][?"level"] != WEAPONS_LIST[i][1][?"maxlevel"]){
								maxed = false;
							}
							else maxed = true;
						}
						//else {array_push(ups, global.upgradesAvaliable[i]);}
					}	    
					if (found) {
					    if (!maxed) {
						    array_push(weapons_list, WEAPONS_LIST[i]);
						}
					} else {
						if (WEAPONS_LIST[i][1][?"characterid"] == -1 or WEAPONS_LIST[i][1][?"characterid"] == global.player[?"id"]) {
						    array_push(weapons_list, WEAPONS_LIST[i]);
						}						
					}
				}
			}else{
				//var str = "";
				for (var i = 0; i < array_length(UPGRADES); ++i) {
				    if (UPGRADES[i][?"level"] != UPGRADES[i][?"maxlevel"] and UPGRADES[i] != global.null) {
					    array_push(weapons_list, WEAPONS_LIST[UPGRADES[i][?"id"]]);
						//str = str + ":" + UPGRADES[i][?"name"];
					}
				}	
				//show_message(str);
			}
			
		#endregion
	
		#region Items
			if (playerItems[5] == global.nullitem) {
				for (var i = 0; i < array_length(ItemList); ++i) {
					var maxed = false;
					var found = false;
					for (var j = 0; j < array_length(playerItems); ++j) {
						if (playerItems[j][?"name"] == ItemList[i][1][?"name"]) {
							found = true;
						    if (playerItems[j][?"level"] != ItemList[i][1][?"maxlevel"]){
								maxed = false;
							}
							else maxed = true;
						}
						//else {array_push(ups, global.upgradesAvaliable[i]);}
					}	    
					if (found) {
					    if (!maxed) {
							for (var k = 0; k < ItemList[i][1][?"weight"]; ++k) {
							    array_push(items_list, ItemList[i]);
							}				    
						}
					} else {
						for (var k = 0; k < ItemList[i][1][?"weight"]; ++k) {
							    array_push(items_list, ItemList[i]);
							}
						}
				}
				//var str = "";
				//for (var i = 0; i < array_length(items_list); ++i) {
				//    str = str + " : " + items_list[i][1][?"name"];
				//}
				//show_message(str);
			}else{
				for (var i = 0; i < array_length(playerItems); ++i) {
				    if (playerItems[i][?"level"] != playerItems[i][?"maxlevel"]) {
					    for (var k = 0; k < ItemList[playerItems[i][?"id"]][1][?"weight"]; ++k) {
							    array_push(items_list, ItemList[playerItems[i][?"id"]]);
						}
					}
				}
			}
		#endregion
	
		#region Perks
			for (var i = 0; i < array_length(PERK_LIST); ++i) {
				if (PERK_LIST[i][0][?"characterid"] == global.player[?"id"]) {
				    //	array_push(ups, PERK_LIST[i]);
					var maxed = false;
					var found = false;
					for (var j = 0; j < array_length(PLAYER_PERKS); ++j) {
						if (PLAYER_PERKS[j][?"name"] == PERK_LIST[i][1][?"name"]) {
							found = true;
						    if (PLAYER_PERKS[j][?"level"] != PERK_LIST[i][1][?"maxlevel"]){
								maxed = false;
							}
							else maxed = true;
						}
						//else {array_push(ups, global.upgradesAvaliable[i]);}
					}	    
					if (found) {
					    if (!maxed) {
						    array_push(perks_list, PERK_LIST[i]);	
						}
					} else {array_push(perks_list, PERK_LIST[i]);}
					//show_debug_message("Added: " + string( PERK_LIST[i][0][?"name"]));
				}	    
			}
		#endregion
		
	#endregion
	#region Generate the options
		is_what = "";
		#region 1&2
			function slotRandomizer12() {
				randomize();
				is_what = "";
				can_be_weapon = false;
				for (var i = 0; i < array_length(UPGRADES); ++i) {
					if (UPGRADES[i][?"level"] != UPGRADES[i][?"maxlevel"] or UPGRADES[i] == global.null) {
						can_be_weapon = true;
					}
				}
				
				can_be_item = false;
				for (var i = 0; i < array_length(playerItems); ++i) {
					//show_message(string(playerItems[i][?"level"]) + ":" + string(playerItems[i][?"maxlevel"]));
					if (playerItems[i][?"level"] != playerItems[i][?"maxlevel"] or playerItems[i] == global.nullitem) {
						can_be_item = true;
					}
				}
				
				can_be_perk = false;
				for (var i = 0; i < array_length(PLAYER_PERKS); ++i) {
					if (PLAYER_PERKS[i][?"level"] != PLAYER_PERKS[i][?"maxlevel"]) {
						can_be_perk = true;
					}
				}
				
				do {
					if (irandom_range(1,9) <= 4) {
					    is_what = ItemTypes.Weapon;
					}else if (irandom_range(1,9) == 1) {
					    is_what = ItemTypes.Item;
					}else if (irandom_range(1,18) == 1) {
							     is_what = ItemTypes.Item; //TODO: change to stat-up
					}else if (irandom_range(1,18) <= 7) {
							     is_what = ItemTypes.Perk;
					}
				} until (is_what != "");
				if (is_what == ItemTypes.Weapon and !can_be_weapon or array_length(weapons_list) == 0) {
				    is_what = ItemTypes.Item;
				}
				if (is_what == ItemTypes.Item and !can_be_item or array_length(items_list) == 0) {
					is_what = "null";
				    //TODO: change item type to statup
				}
				if (is_what == ItemTypes.Perk and !can_be_perk) {
				is_what = "null";
			    //TODO: change item type to statup
				}
				var str = "Weapons";
				for (var i = 0; i < array_length(weapons_list); ++i) { str = str + " : " + weapons_list[i][1][?"name"]; }
				str = str + "\n\nItems"; 
				for (var i = 0; i < array_length(items_list); ++i) { str = str + " : " + items_list[i][1][?"name"]; }
				str = str + "\n\nPerks"; 
				for (var i = 0; i < array_length(perks_list); ++i) { str = str + " : " + perks_list[i][1][?"name"]; }
				str = str + "\n\ncanbe: weapon:" + string(can_be_weapon) + " item:" + string(can_be_item) + " perk:" + string(can_be_perk); 
				if (keyboard_check(ord("G"))) {
				    show_message(str);
				}
			}
			var rdn = 0;
			
			#region fill slot 1 & 2
				var m = 0;
				repeat (2) {
				    slotRandomizer12();
					switch (is_what) {
					    case ItemTypes.Weapon:{
							rdn = irandom_range(0,array_length(weapons_list)-1);
					        global.upgradeOptions[m] = weapons_list[rdn][1];
							array_delete(weapons_list, rdn, 1);
					        break;}
						case ItemTypes.Item:{
							rdn = irandom_range(0,array_length(items_list)-1);
					        global.upgradeOptions[m] = items_list[rdn][1];
							var item_name = items_list[rdn][1][?"id"];
							var maxI = array_length(items_list);
							for (var i = 0; i < maxI; ++i) {
							    if (items_list[i][1][?"id"] == item_name) {
								    array_delete(items_list, i, 1);
									var maxI = array_length(items_list);
									i=0;
								}
							}
					        break;}
						case ItemTypes.Perk:{
							if (array_length(perks_list) > 0) {
							    rdn = irandom_range(0,array_length(perks_list)-1);
								global.upgradeOptions[m] = perks_list[rdn][1];
								array_delete(perks_list, rdn, 1);
							}else{
								global.upgradeOptions[m] = global.null; //TODO Change to statup
							}
					        break;}				
						case "null":{
					        global.upgradeOptions[m] = global.null;
					        break;}
						}
						m++;
					}				
			#endregion
		#endregion
		
		#region 3
			function slotRandomizer3() {
				randomize();
				is_what = "";
				can_be_weapon = false;
				for (var i = 0; i < array_length(UPGRADES); ++i) {
					if (UPGRADES[i][?"level"] != UPGRADES[i][?"maxlevel"]) {
						can_be_weapon = true;
					}
				}
				
				can_be_item = false;
				for (var i = 0; i < array_length(playerItems); ++i) {
					if (playerItems[i][?"level"] != playerItems[i][?"maxlevel"]) {
						can_be_item = true;
					}
				}
				
				can_be_perk = false;
				for (var i = 0; i < array_length(PLAYER_PERKS); ++i) {
					if (PLAYER_PERKS[i][?"level"] != PLAYER_PERKS[i][?"maxlevel"]) {
						can_be_perk = true;
					}
				}
				repeat (5) {
				    do {
						if (irandom_range(1,5) <= 2) {
						    is_what = ItemTypes.Weapon;
						}else if (irandom_range(1,2) == 1) {
						    is_what = ItemTypes.Item;
						}else if (irandom_range(1,10) == 1) {
								     is_what = ItemTypes.Perk;
						}
					} until (is_what != "");
					if (is_what == ItemTypes.Weapon and !can_be_weapon or array_length(weapons_list) == 0) {
					    is_what = ItemTypes.Item;
					}
					if (is_what == ItemTypes.Item and !can_be_item or array_length(items_list) == 0) {
						is_what = ItemTypes.Perk;
					}
					if (is_what == ItemTypes.Perk and !can_be_perk) {
					is_what = "null";
					}
					if (is_what != "null") {
					    break;
					}
				}
				if (is_what == "null") {
				    is_what = "null" //TODO: Change to Food option
				}
			}
			var rdn = 0;
			slotRandomizer3();
			#region fill slot 3
			//is_what = ItemTypes.Item;
			//show_message(string(can_be_item) + ":" + string(can_be_perk) + ":" + string(can_be_weapon) + ":" + string(is_what));
				switch (is_what) {
				    case ItemTypes.Weapon:{
						rdn = irandom_range(0,array_length(weapons_list)-1);
				        global.upgradeOptions[2] = weapons_list[rdn][1];
						array_delete(weapons_list, rdn, 1);
				        break;}
					case ItemTypes.Item:{
				        rdn = irandom_range(0,array_length(items_list)-1);
				        global.upgradeOptions[2] = items_list[rdn][1];
						var item_name = items_list[rdn][1][?"id"];
							var maxI = array_length(items_list);
							for (var i = 0; i < maxI; ++i) {
							    if (items_list[i][1][?"id"] == item_name) {
								    array_delete(items_list, i, 1);
									var maxI = array_length(items_list);
									i=0;
								}
							}
				        break;}
					case ItemTypes.Perk:{
				        if (array_length(perks_list) > 0) {
							    rdn = irandom_range(0,array_length(perks_list)-1);
								global.upgradeOptions[2] = perks_list[rdn][1];
								array_delete(perks_list, rdn, 1);
							}else{
								global.upgradeOptions[2] = global.null; //TODO Change to food
							}
					        break;}				
					case "null":{
				        global.upgradeOptions[2] = global.null;
				        break;}
					}
			#endregion		
		#endregion
	global.upgradeOptions[3] = global.null;
	#endregion
	
	#region old	
	//for (var i=0; i<4; i++) {
	//	do {
	//		rdnnumber = irandom_range(0,array_length(ups)-1);
	//		pickedupgrade = ups[rdnnumber][1];
	//		isperk = pickedupgrade[?"perk"];
	//		if (pickedupgrade[?"perk"] == 1) {
	//			show_debug_message("picked a perk: " + string(pickedupgrade[?"name"]));
	//		    if (pickedupgrade[?"characterid"] == global.player[?"id"]) {
	//			    isperk = 0;
	//			}
	//		}			
	//		array_delete(ups, rdnnumber, 1);
	//	} until (isperk != 1);
	//	array_delete(ups, rdnnumber, 1);
	//	global.upgradeOptions[i] = pickedupgrade;
	//}
		
	//global.upgradeOptions[0] = global.player[?"weapon"][1];
	//global.upgradeOptions[1] = ItemList[ItemIds.Uber_Sheep][1];
	//global.upgradeOptions[0] = global.upgradesAvaliable[Weapons.BlBook][1];
	//global.upgradeOptions[1] = global.upgradesAvaliable[Weapons.HoloBomb][1];
	//global.upgradeOptions[0] = global.upgradesAvaliable[Weapons.EliteLavaBucket][1];
	#endregion
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




// Feather disable GM2017
#macro UPGRADES global.upgrades
global.upgrade = false;
global.upgradeCooldown[0] = 0;
#region Null Upgrade
	global.null={};
	var m = global.null;
	variable_struct_set(m, "id", 0);
	variable_struct_set(m, "name", "null");
	variable_struct_set(m, "level", 0);
	variable_struct_set(m, "maxlevel", 0);
	variable_struct_set(m, "sprite", blank);
	variable_struct_set(m, "thumb", blank);
	variable_struct_set(m, "mindmg", 0);
	variable_struct_set(m, "maxdmg", 1);
	variable_struct_set(m, "cooldown", 1);
	variable_struct_set(m, "duration", 0);
	variable_struct_set(m, "hitCooldown", 0);
	variable_struct_set(m, "canBeHasted", false);
	variable_struct_set(m, "speed", 0);
	variable_struct_set(m, "hits", 0);	
	variable_struct_set(m, "type", "white");	
	variable_struct_set(m, "shoots", 0);	
	variable_struct_set(m, "desc", "");
	variable_struct_set(m, "style", ItemTypes.Weapon);	
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
function newCreateUpgrade(_data, _sounds = ""){
	global.upgradesAvaliable[_data.id][0] = global.null;
	for (var i = 1; i <= _data.maxlevel; ++i) {
		global.upgradesAvaliable[_data.id][i] = {};
		global.upgradesAvaliable[_data.id][i].sound = _sounds;
		var m = global.upgradesAvaliable[_data.id][i];
		variable_struct_set(m, "level" ,i);
		variable_struct_set(m, "style", ItemTypes.Weapon);
		var keys = variable_struct_get_names(_data);
		for (var j = array_length(keys)-1; j >= 0; --j) {
		    var k = keys[j];
		    var v = _data[$ k];
			if (is_array(v)) {
			    if (array_length(v) > 1) {
				    variable_struct_set(m, k, v[i-1]);
				}
				else
				{
					variable_struct_set(m, k, v[0]);
				}   
			}else{
				variable_struct_set(m, k, v);
			}
		}
		global.upgradeCooldown[_data.id] = 0;
	}
}

function createUpgrade(_id, _name, _level, _sprite, _thumb, _mindmg, _maxdmg, _cooldown, _duration, _hitCooldown, _canBeHasted, _speed, _hits, _type, _shoots, _desc = "")
{
	global.upgradesAvaliable[_id][0]=global.null;
	global.upgradesAvaliable[_id][_level]={};
	var m = global.upgradesAvaliable[_id][_level];
	variable_struct_set(m, "id", _id);
	variable_struct_set(m, "name", _name);
	variable_struct_set(m, "level", _level);
	variable_struct_set(m, "sprite", _sprite);
	variable_struct_set(m, "thumb", _thumb);
	variable_struct_set(m, "mindmg", _mindmg);
	variable_struct_set(m, "maxdmg", _maxdmg);
	variable_struct_set(m, "cooldown", _cooldown);
	variable_struct_set(m, "duration", _duration);
	variable_struct_set(m, "hitCooldown", _hitCooldown);
	variable_struct_set(m, "canBeHasted", _canBeHasted);
	variable_struct_set(m, "speed", _speed);
	variable_struct_set(m, "hits", _hits);	
	variable_struct_set(m, "type", _type);	
	variable_struct_set(m, "shoots", _shoots);	
	variable_struct_set(m, "desc", _desc);
	variable_struct_set(m, "style", ItemTypes.Weapon);	
	global.upgradeCooldown[_id] = 0;
}
function createUpgradeP2(_id, _level, _maxlevel, _knockbackSpeed, _knockbackDuration, _perk = 0, _character = -1)
{
	var m = global.upgradesAvaliable[_id][_level];
	variable_struct_set(m, "knockbackSpeed", _knockbackSpeed);
	variable_struct_set(m, "knockbackDuration", _knockbackDuration);
	variable_struct_set(m, "perk", _perk);
	variable_struct_set(m, "characterid", _character);
	variable_struct_set(m, "maxlevel", _maxlevel);
}

enum Weapons
{
	AmePistol,
	GuraTrident,
	PowerofAtlantis, //TODO: water area, more damage
	InaTentacle, //TODO: add knockback
	BlBook, //TODO: area, knockback
	CEOTears,
	CuttingBoard, //TODO: add bonus for flat characters, knockback, Shoot additional walls from sides, Walls travel farther
	//If a flat character uses the Cutting Board weapon, the spawned Cutting Board projectile will be 30% bigger than normal, and will also deal 30% more damage.
	EliteLavaBucket, //TODO: lava area
	FanBeam, //TODO: knockback
	Glowstick,
	HoloBomb, //TODO: correct scale
	IdolSong,
	PlugAsaCoco, //TODO: afterimage, knockback lv 6
	PsychoAxe,
	SpiderCooking,
	WamyWater,
	//X-Potato
}
function populateUpgrades(){
	#region Character Perks
		#region Amelia Perks
			#region AmePistol 
			newCreateUpgrade({
				id : Weapons.AmePistol,
				name : "AmePistol",
				maxlevel : 7,
				sprite : sAmeShoot,
				thumb : sAmePistol,
				mindmg : [7, 7, 7*1.25, 7*1.25, 7*1.25, 7*1.25*1.40, 7*1.25*1.40],
				maxdmg : [13, 13, 13*1.25, 13*1.25, 13*1.25, 13*1.20*1.40, 13*1.20*1.40],
				cooldown : [80, 80, 80, 80, 80*0.75, 80*0.75, 80*0.75],
				duration : [120, 120, 120, 120, 120, 120, 120], 
				hitCooldown : [10, 10, 10, 10, 10, 10, 10], 
				canBeHasted : true,
				speed : [5, 5, 5, 5, 5, 5, 5],
				hits : [1, 2, 2, 2, 3, 3, 3],
				type : "red",
				shoots : [3, 4, 4, 4, 4, 4, 6],
				desc : [
				"Shoots 3 Projectiles forward. Horizontal only.", 
				"Shoot [1] additional shot, and each bullet can pierce [+1] times.",
				"Increase damage by [25%].",
				"Bullets ricochet if hit limit is reached.",
				"Each bullet can pierce [+1] times. Reduce the time between attacks by [25%].",
				"Increase damage by [40%].",
				"Shoot [2] additional shots, and pistol becomes spread type."
				],
				knockbackSpeed : [0, 0, 0, 0, 0, 0, 0],
				knockbackDuration : [0, 0, 0, 0, 0, 0, 0],
				perk : true,
				characterid : Characters.Amelia
			},[snd_bullet, snd_bullet2, snd_bullet3]);
			#endregion
		#endregion	
	
		#region Gura Perks
			#region GuraTrident 
				//TODO: add snd_woosh and snd_woosh2
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
			#region Ina tentacle
			newCreateUpgrade({
				id : Weapons.InaTentacle,
				name : "Summon Tentacle",
				maxlevel : 7,
				sprite : sInaTentacleShoot,
				thumb : sInaTentacle,
				mindmg : [10, 12, 12, 12, 19, 19, 19],
				maxdmg : [14, 16, 16, 16, 24, 24, 24],
				cooldown : [90, 90, 78, 78, 78, 78, 78],
				duration : 120,
				hitCooldown : 20,
				canBeHasted : true,
				speed : 0,
				hits : 999,
				type : "white",
				shoots : [1, 1, 1, 1, 1, 1, 3],
				desc : [
				"A tentacle shoots out in front.",
				"Increase damage by 20%.",
				"Reduce the time between attacks by 20%.",
				"Increase attack area by 25%.",
				"Increase damage by 50%.",
				"Adds small knockback on hit.",
				"Chain another three tentacles in a chain at a random direction.",
				],
				knockbackSpeed : 0,
				knockbackDuration : 0,
				perk : false
			});
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
		createUpgrade(Weapons.BlBook, "BL Book", 5, sBLBook, sBLBookThumb, 10*1.30*1.40, 18*1.30*1.40, 360, 180, 20, 1, 5, 7, "white", 5, "Increase Damage by [40%] .");
		createUpgradeP2(Weapons.BlBook, 5, 7, 3, 5);
		createUpgrade(Weapons.BlBook, "BL Book", 6, sBLBook, sBLBookThumb, 10*1.30*1.40, 18*1.30*1.40, 360, 180, 20, 1, 5, 7, "white", 6, "Add [1]  additional book. ");
		createUpgradeP2(Weapons.BlBook, 6, 7, 3, 5);
		createUpgrade(Weapons.BlBook, "BL Book", 7, sBLBook, sBLBookThumb, 10*1.30*1.40*1.40, 18*1.30*1.40*1.40, 360, 180, 20, 1, 5, 7, "white", 6, "Increase damage by [40%] .");
		createUpgradeP2(Weapons.BlBook, 7, 7, 3, 5);
	#endregion
	
	#region Cutting Board
	newCreateUpgrade({
				id : Weapons.CuttingBoard,
				name : "Cutting Board",
				maxlevel : 7,
				sprite : sCuttingBoard,
				thumb : sCuttingBoardThumb,
				mindmg : [11, 11, 14, 14, 23, 23, 23],
				maxdmg : [15, 15, 18, 18, 28, 28, 28],
				cooldown : [180, 180, 180, 180, 180, 150, 150],
				duration : 120, 
				hitCooldown : 20, 
				canBeHasted : true,
				speed : [7, 7, 7, 10, 10, 10, 10],
				hits : 9999,
				type : "white",
				shoots : [1, 1, 1, 1, 1, 1, 3],
				area : [1, 1.30, 1.30, 1.30, 1.30, 1.30, 1.30],
				desc : [
				"Create a defensive wall that damages targets behind you. Effectiveness is increased on certain characters.",
				"Increase size of wall by 30%.",
				"Increase damage by 30%.",
				"Walls travel farther.",
				"Increase damage by 50%.",
				"Reduce the time between attacks by 0.5 seconds.",
				"Shoot additional walls from sides.",
				],
				knockbackSpeed : 7,
				knockbackDuration : 20,
				perk : false,
			});
	#endregion
	
	#region Fan Beam
	newCreateUpgrade({
				id : Weapons.FanBeam,
				name : "Fan Beam",
				maxlevel : 7,
				sprite : sFanBeam,
				thumb : sFanBeamThumb,
				mindmg : [27, 27, 27, 36, 36, 36, 36],
				maxdmg : [33, 33, 33, 44, 44, 44, 44],
				cooldown : [180, 180, 150, 150, 120, 120, 120],
				duration : 999, 
				hitCooldown : 60, 
				canBeHasted : true,
				speed : 0,
				hits : 9999,
				type : "white",
				shoots : [1, 1, 1, 1, 1, 1, 2],
				area : [1, 1.30, 1.30, 1.30, 1.30, 2, 2],
				desc : [
				"Shoot a powerful laser beam from the microphone. Horizontal only.",
				"Increase size by 30%.",
				"Reduce attack cooldown by 0.5 seconds.",
				"Increase damage by 50%.",
				"Reduce attack cooldown by 0.5 seconds.",
				"Increase size by 50%.",
				"Fire an additional beam from behind ",
				],
				knockbackSpeed : 15,
				knockbackDuration : 10,
				perk : false,
			});
	#endregion
	
	#region CEO Tears
	newCreateUpgrade({
				id : Weapons.CEOTears,
				name : "CEO's Tears",
				maxlevel : 7,
				sprite : sCeoTears,
				thumb : sCeoTearsThumb,
				mindmg : [7, 7*1.20, 7*1.20, 7*1.20, 7*1.40, 7*1.40, 7*1.40],
				maxdmg : [13, 13*1.20, 13*1.20, 13*1.20, 13*1.40, 13*1.40, 13*1.40],
				cooldown : [30, 30, 30, 30 * 0.67, 30 * 0.67, 30 * 0.67 * 0.50, 30 * 0.67 * 0.50],
				duration : 90, 
				hitCooldown : 30, 
				canBeHasted : true,
				speed : [4, 4, 4, 4, 4 * 0.75, 4 * 0.75, 4 * 0.75],
				hits : 1,
				type : "white",
				shoots : [1, 1, 2, 2, 2, 2, 4],
				desc : [
				"Fires rapid tears at random targets.",
				"Increases damage by 20%.",
				"Shoot 2 tears.",
				"Reduce the time between attacks by 33%.",
				"Tears are 25% faster and increase damage by 20%.",
				"Reduce the time between attacks by 50%.",
				"Shoot 4 tears.", 
				],
				knockbackSpeed : 0,
				knockbackDuration : 0,
				perk : false,
			});
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
	newCreateUpgrade({
				id : Weapons.HoloBomb,
				name : "Holo Bomb",
				maxlevel : 7,
				sprite : sHolobomb,
				thumb : sHolobomb,
				mindmg : [15, 15, 15, 15, 15, 18, 18],
				maxdmg : [19, 19, 19, 19, 19, 22, 22],
				cooldown : [120, 120, 120, 120, 96, 96, 96],
				duration : 630,
				hitCooldown : 20, 
				canBeHasted : true,
				speed : 0,
				hits : 999,
				type : "white",
				shoots : [1, 1, 1, 2, 2, 2, 3],
				desc : [
				"A bomb that explodes, dealing damage to all nearby targets.",
				"Increase explosion size by 15%.",
				"Increase damage by 20%.",
				"Throw 2 bombs.",
				"Reduce the time between attacks by 20%.",
				"Increase explosion size by 20%.",
				"Throw 3 bombs.",
				],
				knockbackSpeed : 0,
				knockbackDuration : 0,
				perk : false,
			});
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
		
	#region SpiderCooking
		newCreateUpgrade({
				id : Weapons.SpiderCooking,
				name : "Spider Cooking",
				maxlevel : 7,
				sprite : sSpiderCooking,
				thumb : sSpiderCookingThumb,
				mindmg : [7, 7, 10, 10, 10, 12, 12],
				maxdmg : [11, 11, 14, 14, 14, 16, 16],
				cooldown : 600,
				duration : 601, 
				hitCooldown : [45, 45, 45, 45, 36, 36, 36], 
				canBeHasted : false,
				speed : 0,
				hits : 9999,
				type : "white",
				shoots : [1, 1, 2, 2, 3, 3, 4],
				desc : [
				"Create an area of miasma around, dealing slow damage to enemies inside.",
				"Increase area by 15%.",
				"Increase damage by 30%.",
				"Increase area by 25%.",
				"Increase frequency of hits by 20%.",
				"Increase damage by 60%.",
				"Add small knockback on hit.",
				],
				knockbackSpeed : [0, 0, 0, 0, 0, 0, 3],
				knockbackDuration : [0, 0, 0, 0, 0, 0, 8],
				perk : false,
				area: [1, 1.15, 1.15, 1.40, 1.40, 1.40, 1.40],
			});
	#endregion
	
	#region Glowstick
			newCreateUpgrade({
				id : Weapons.Glowstick,
				name : "Glowstick",
				maxlevel : 7,
				sprite : sGlowstick,
				thumb : sGlowstickThumb,
				mindmg : [10, 12, 12, 12, 12, 17, 17],
				maxdmg : [14, 16, 16, 16, 16, 21, 21],
				explosionMinDmg : [16, 19, 19, 19, 19, 26, 26],
				explosionMaxDmg : [20, 24, 24, 24, 24, 32, 32],
				cooldown : 240,
				duration : 180, 
				hitCooldown : 30, 
				hitCooldownExplosion : 60, 
				canBeHasted : true,
				speed : 8,
				hits : [3, 3, 8, 8, 8, 8, 8],
				type : "white",
				shoots : [1, 1, 2, 2, 3, 3, 4],
				desc : [
				"Throw a glowstick to a nearby target and then spins back to player.",
				"Increases damage by 20%.",
				"Increase hit limit by 10 and throw one additional glowstick.",
				"Increase size of glowstick by 25%.",
				"Throw one additional glowstick.",
				"Increase damage by 33%.",
				"Throw one additional glowstick.",
				],
				knockbackSpeed : 0,
				knockbackDuration : 0,
				perk : false,
			});
			#endregion
	#region Idol Song
			newCreateUpgrade({
				id : Weapons.IdolSong,
				name : "Idol Song",
				maxlevel : 7,
				sprite : sIdolSong,
				thumb : sIdolSongThumb,
				mindmg : [11, 14, 14, 14, 14, 14, 22],
				maxdmg : [15, 18, 18, 18, 18, 18, 27],
				cooldown : [200, 200, 200, 200, 160, 160, 160],
				duration : 150, 
				hitCooldown : 20, 
				canBeHasted : true,
				speed : [1, 1, 1.2, 1.2, 1.2, 1.2, 1.2],
				hits : 999,
				type : "white",
				shoots : [2, 2, 2, 2, 2, 4, 4],
				desc : [
				"Magical music notes that float vertically in both directions.",
				"Increase damage by 25%.",
				"Increase speed and travel width.",
				"Increase music note size by 25%.",
				"Reduce the time between attacks by 20%.",
				"Increase music note size by 25%.",
				"Increase damage by 50%.",
				],
				knockbackSpeed : 0,
				knockbackDuration : 0,
				perk : false,
			});
			#endregion
	#region Psycho Axe
			newCreateUpgrade({
				id : Weapons.PsychoAxe,
				name : "Psycho Axe",
				maxlevel : 7,
				sprite : sPsychoAxe,
				thumb : sPsychoAxeThumb,
				mindmg : [10, 14, 14, 19, 19, 19, 28],
				maxdmg : [14, 18, 18, 23, 23, 23, 34],
				cooldown : [240, 240, 192, 192, 192, 192, 192],
				duration : [180, 180, 180, 180, 240, 240, 240],
				hitCooldown : 50, 
				canBeHasted : true,
				speed : 10,
				hits : [10, 10, 10, 10, 999, 999, 999],
				type : "white",
				shoots : [2, 2, 2, 2, 2, 4, 4],
				desc : [
				"Throw an axe that spirals outward from the player.",
				"Increase size of axe by 20%. Increase damage of axe by 20%.",
				"Reduce delay between attacks by 20%.",
				"Increase damage by 33%, and size by 20%.",
				"Remove hit limit, and lasts 1 second longer.",
				"Increase attack size by 50%.",
				"Increase damage by 50%.",
				],
				knockbackSpeed : 0,
				knockbackDuration : 0,
				perk : false,
				afterimage : true,
				afterimageColor : c_yellow,
			});
	#endregion
	#region Wamy Water
			newCreateUpgrade({
				id : Weapons.WamyWater,
				name : "Wamy Water",
				maxlevel : 7,
				sprite : sWamyWater,
				thumb : sWamyWaterThumb,
				mindmg : [9, 9, 9, 9, 9, 15, 15],
				maxdmg : [13, 13, 13, 13, 13, 19, 19],
				cooldown : [120, 120, 120, 120, 96, 96, 96],
				duration : 999,
				hitCooldown : 30, 
				canBeHasted : true,
				speed : 0,
				hits : 999,
				type : "white",
				shoots : 1,
				desc : [
				"Create a splash of unknown water in front, knocking targets back.",
				"Increase damage by 20%.",
				"Increase attack area by 30%.",
				"Increase splash knockback.",
				"Reduce time between attacks by 20%.",
				"Increase damage by 30%.",
				"Increase attack area by 30% and stops targets for a short moment after knockback.",
				],
				knockbackSpeed : [5, 5, 5, 8, 8, 8 ,8],
				knockbackDuration : 10,
				perk : false
			});
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
			//show_message(UPGRADES[5][$"name"]);	
			if (UPGRADES[array_length(UPGRADES) -1] == global.null) {
				for (var i = 0; i < array_length(WEAPONS_LIST); ++i) {
					var maxed = false;
					var found = false;
					for (var j = 0; j < array_length(UPGRADES); ++j) {
						//show_message("A:" + string(UPGRADES[j][$"name"]));
						//show_message("B:" + string(global.upgradesAvaliable[i][1][$"name"]));
						if (UPGRADES[j][$"name"] == WEAPONS_LIST[i][1][$"name"]) {
							found = true;
						    if (UPGRADES[j][$"level"] != WEAPONS_LIST[i][1][$"maxlevel"]){
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
						//if (WEAPONS_LIST[i][1][$"characterid"] == -1 or WEAPONS_LIST[i][1][$"characterid"] == global.player[?"id"]) {
						if (!variable_struct_exists(WEAPONS_LIST[i][1], "characterid") or WEAPONS_LIST[i][1][$"characterid"] == -1 or WEAPONS_LIST[i][1][$"characterid"] == global.player[?"id"]) {
							//show_message("test");
						    array_push(weapons_list, WEAPONS_LIST[i]);
						}						
					}
				}
			}else{
				//var str = "";
				for (var i = 0; i < array_length(UPGRADES); ++i) {
				    if (UPGRADES[i][$"level"] != UPGRADES[i][$"maxlevel"] and UPGRADES[i] != global.null) {
					    array_push(weapons_list, WEAPONS_LIST[UPGRADES[i][$"id"]]);
						
						//str = str + ":" + UPGRADES[i][$"name"];
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
						if (playerItems[j][$"name"] == ItemList[i][1][$"name"]) {
							found = true;
						    if (playerItems[j][$"level"] != ItemList[i][1][$"maxlevel"]){
								maxed = false;
							}
							else maxed = true;
						}
						//else {array_push(ups, global.upgradesAvaliable[i]);}
					}	    
					if (found) {
					    if (!maxed) {
							for (var k = 0; k < ItemList[i][1][$"weight"]; ++k) {
							    array_push(items_list, ItemList[i]);
							}				    
						}
					} else {
						for (var k = 0; k < ItemList[i][1][$"weight"]; ++k) {
							    array_push(items_list, ItemList[i]);
							}
						}
				}
				//var str = "";
				//for (var i = 0; i < array_length(items_list); ++i) {
				//    str = str + " : " + items_list[i][1][$"name"];
				//}
				//show_message(str);
			}else{
				for (var i = 0; i < array_length(playerItems); ++i) {
				    if (playerItems[i][$"level"] != playerItems[i][$"maxlevel"]) {
					    for (var k = 0; k < ItemList[playerItems[i][$"id"]][1][$"weight"]; ++k) {
							    array_push(items_list, ItemList[playerItems[i][$"id"]]);
						}
					}
				}
			}
		#endregion
	
		#region Perks
			for (var i = 0; i < array_length(PERK_LIST); ++i) {
				if (PERK_LIST[i][0][$"characterid"] == global.player[?"id"]) {
				    //	array_push(ups, PERK_LIST[i]);
					var maxed = false;
					var found = false;
					for (var j = 0; j < array_length(PLAYER_PERKS); ++j) {
						if (PLAYER_PERKS[j][$"name"] == PERK_LIST[i][1][$"name"]) {
							found = true;
						    if (PLAYER_PERKS[j][$"level"] != PERK_LIST[i][1][$"maxlevel"]){
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
					//show_debug_message("Added: " + string( PERK_LIST[i][0][$"name"]));
				}	    
			}
		#endregion
		
	#endregion
	#region Generate the options
		is_what = "";
		#region 1&2
			function slotRandomizer12() {
				// randomize;
				is_what = "";
				can_be_weapon = false;
				for (var i = 0; i < array_length(UPGRADES); ++i) {
					if (UPGRADES[i][$"level"] != UPGRADES[i][$"maxlevel"] or UPGRADES[i] == global.null) {
						can_be_weapon = true;
					}
				}
				
				can_be_item = false;
				for (var i = 0; i < array_length(playerItems); ++i) {
					//show_message(string(playerItems[i][$"level"]) + ":" + string(playerItems[i][$"maxlevel"]));
					if (playerItems[i][$"level"] != playerItems[i][$"maxlevel"] or playerItems[i] == global.nullitem) {
						can_be_item = true;
					}
				}
				
				can_be_perk = false;
				for (var i = 0; i < array_length(PLAYER_PERKS); ++i) {
					if (PLAYER_PERKS[i][$"level"] != PLAYER_PERKS[i][$"maxlevel"]) {
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
				// show_debug_message("type: {0}, weapon : {1}, array : {2}", is_what, can_be_weapon, array_length(weapons_list));
				if (is_what == ItemTypes.Weapon and !can_be_weapon or is_what == ItemTypes.Weapon and array_length(weapons_list) == 0) {
				    is_what = ItemTypes.Item;
				}
				if (is_what == ItemTypes.Item and !can_be_item or is_what == ItemTypes.Item and array_length(items_list) == 0) {
					is_what = "null";
				    //TODO: change item type to statup
				}
				if (is_what == ItemTypes.Perk and !can_be_perk) {
				is_what = "null";
			    //TODO: change item type to statup
				}
				var str = "Weapons";
				for (var i = 0; i < array_length(weapons_list); ++i) { str = str + " : " + weapons_list[i][1][$"name"]; }
				str = str + "\n\nItems"; 
				for (var i = 0; i < array_length(items_list); ++i) { str = str + " : " + items_list[i][1][$"name"]; }
				str = str + "\n\nPerks"; 
				for (var i = 0; i < array_length(perks_list); ++i) { str = str + " : " + perks_list[i][1][$"name"]; }
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
							var item_name = items_list[rdn][1][$"id"];
							var maxI = array_length(items_list);
							for (var i = 0; i < maxI; ++i) {
							    if (items_list[i][1][$"id"] == item_name) {
								    array_delete(items_list, i, 1);
									maxI = array_length(items_list);
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
				// randomize;
				is_what = "";
				can_be_weapon = false;
				for (var i = 0; i < array_length(UPGRADES); ++i) {
					if (UPGRADES[i][$"level"] != UPGRADES[i][$"maxlevel"] or UPGRADES[i] == global.null) {
						can_be_weapon = true;
					}
				}
				
				can_be_item = false;
				for (var i = 0; i < array_length(playerItems); ++i) {
					if (playerItems[i][$"level"] != playerItems[i][$"maxlevel"] or playerItems[i] == global.nullitem) {
						can_be_item = true;
					}
				}
				
				can_be_perk = false;
				for (var i = 0; i < array_length(PLAYER_PERKS); ++i) {
					if (PLAYER_PERKS[i][$"level"] != PLAYER_PERKS[i][$"maxlevel"]) {
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
				    is_what = "food";
				}
			}
			rdn = 0;
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
						var item_name = items_list[rdn][1][$"id"];
							var maxI = array_length(items_list);
							for (var i = 0; i < maxI; ++i) {
							    if (items_list[i][1][$"id"] == item_name) {
								    array_delete(items_list, i, 1);
									maxI = array_length(items_list);
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
								global.upgradeOptions[2] = ItemList[ItemIds.Hamburguer][1];
							}
					        break;}				
					case "food":{
				        global.upgradeOptions[2] = ItemList[ItemIds.Hamburguer][1];
				        break;}
					}
			#endregion		
		#endregion
		
		#region 4
			function slotRandomizer4() {
				// randomize;
				is_what = "";
				can_be_weapon = false;
				for (var i = 0; i < array_length(UPGRADES); ++i) {
					if (UPGRADES[i][?"level"] != UPGRADES[i][?"maxlevel"] or UPGRADES[i] == global.null or playerItems[i] == global.nullitem) {
						can_be_weapon = true;
					}
				}
				
				can_be_item = false;
				for (var i = 0; i < array_length(playerItems); ++i) {
					if (playerItems[i][?"level"] != playerItems[i][?"maxlevel"] or playerItems[i] == global.nullitem) {
						can_be_item = true;
					}
				}
				repeat (5) {
				    do {
						if (irandom_range(1,2) == 1) {
						    is_what = ItemTypes.Weapon;
						}else if (irandom_range(1,2) == 1) {
						    is_what = ItemTypes.Item;
						}
					} until (is_what != "");
					if (is_what == ItemTypes.Weapon and !can_be_weapon or array_length(weapons_list) == 0) {
					    is_what = ItemTypes.Item;
					}
					if (is_what == ItemTypes.Item and !can_be_item or array_length(items_list) == 0) {
						is_what = "null";
					}
					if (is_what != "null") {
					    break;
					}
				}
				if (is_what == "null") {
				    is_what = "holocoin";
				}
			}
			rdn = 0;
			slotRandomizer4();
			#region fill slot 4
			//is_what = ItemTypes.Item;
			//show_message(string(can_be_item) + ":" + string(can_be_perk) + ":" + string(can_be_weapon) + ":" + string(is_what));
				switch (is_what) {
				    case ItemTypes.Weapon:{
						rdn = irandom_range(0,array_length(weapons_list)-1);
				        global.upgradeOptions[3] = weapons_list[rdn][1];
						array_delete(weapons_list, rdn, 1);
				        break;}
					case ItemTypes.Item:{
				        rdn = irandom_range(0,array_length(items_list)-1);
				        global.upgradeOptions[3] = items_list[rdn][1];
						var item_name = items_list[rdn][1][?"id"];
							var maxI = array_length(items_list);
							for (var i = 0; i < maxI; ++i) {
							    if (items_list[i][1][?"id"] == item_name) {
								    array_delete(items_list, i, 1);
									maxI = array_length(items_list);
									i=0;
								}
							}
				        break;}	
					case "holocoin":{
				        global.upgradeOptions[3] = ItemList[ItemIds.Holocoin][1];
				        break;}
					}
			#endregion		
		
	//global.upgradeOptions[3] = global.null;
	#endregion
	 //global.upgradeOptions[0] = ItemList[ItemIds.Limiter][1];
	 //global.upgradeOptions[0] = global.upgradesAvaliable[Weapons.InaTentacle][1];
}	

function tickPowers(){
	if (attacktick == true and UPGRADES[0][$"name"]!="") {
		for (i=0; i < array_length(UPGRADES); i++) {
			if (UPGRADES[i] != global.null and global.upgradeCooldown[UPGRADES[i][$"id"]] <= 0) {
				instance_create_layer(x,y-8,"Upgrades",oUpgrade,{
					upg : UPGRADES[i],
					speed : UPGRADES[i][$"speed"],
					hits : UPGRADES[i][$"hits"],
					shoots : UPGRADES[i][$"shoots"],
					sprite_index : UPGRADES[i][$"sprite"],
					level : UPGRADES[i][$"level"],
					mindmg: UPGRADES[i][$"mindmg"],
					maxdmg: UPGRADES[i][$"maxdmg"]
				});
				
			}			
		}
	}
}

function defaultBehaviour(){
	if (owner.image_xscale==1) 
	{
		direction = point_direction(x,y,x+100,y+diroffset);
	}
	else 
	{
		direction = point_direction(x,y,x-100,y-diroffset);
	}
	image_xscale=owner.image_xscale;
	image_speed=1;
	image_alpha=1;
}

function spawnUpgrade(_upg = upg, _speed = upg[$"speed"], _hits = upg[$"hits"], _shoots = 0, _mindmg = upg[$"mindmg"], _maxdmg = upg[$"maxdmg"], _sprite = upg[$"sprite"]){
	var instancecreated = instance_create_layer(owner.x,owner.y-8,"Upgrades",oUpgrade,{
					upg : _upg,
					speed : _speed,
					hits : _hits,
					shoots : _shoots,
					mindmg : _mindmg,
					maxdmg : _maxdmg,
					sprite_index : _sprite,
					a : 0
				});
		return instancecreated;
}
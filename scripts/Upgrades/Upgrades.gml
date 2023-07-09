// Feather disable GM2017

#region model
//newCreateUpgrade({ 
//				id : Weapons.,
//				weight : 0,
//				name : "",
//				maxlevel : 7,
//				sprite : s,
//				thumb : s,
//				mindmg : 0,
//				maxdmg : 0,
//				cooldown : 0,
//				minimumcooldown : 1,
//				shoots : 1,
//				attackdelay : 0,
//				hits : 0,
//				hitCooldown : 0, 
//				duration : 0,
//				speed : 0,
//				knockbackDuration : 0,
//				knockbackSpeed : 0,
//				size : 1,
//				canBeHasted : true,
//				type : "white",
//				shotType : ShotTypes.Multishot,
//				perk : false,
//			});
#endregion


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
enum ShotTypes {
	Multishot,
	Ranged,
	Melee
}

#region Upgrades
function newCreateUpgrade(_data, _sounds = ""){
	global.upgradesAvaliable[_data.id][0] = global.null;
	_data.z = "z";
	//show_message(_data);
	for (var i = 1; i <= _data.maxlevel; ++i) {
		global.upgradesAvaliable[_data.id][i] = {};
		global.upgradesAvaliable[_data.id][i].sound = _sounds;
		var m = global.upgradesAvaliable[_data.id][i];
		variable_struct_set(m, "level" ,i);
		//variable_struct_set(m, "desc", lexicon_text("Weapons." + _data.name + "." + string(i)));
		variable_struct_set(m, "style", ItemTypes.Weapon);
		var keys = variable_struct_get_names(_data);
		//show_message(keys);
		for (var j = array_length(keys)-1; j >= 0; --j) {
		    var k = keys[j];
			//if (k == "desc") { break; }
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
		//show_message(global.upgradesAvaliable[_data.id]);
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
	BounceBall,
	CEOTears,
	CuttingBoard,
	EliteLavaBucket,
	ENsCurse,
	FanBeam, //TODO: knockback
	Glowstick,
	HoloBomb, //TODO: correct scale
	IdolSong,
	PlugAsaCoco, //TODO: afterimage, knockback lv 6
	PsychoAxe,
	SpiderCooking,
	WamyWater,
	//X-Potato
	PipiPilstol,
	HeavyArtillery,
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
				attackdelay : 10,
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
				newCreateUpgrade({
				id : Weapons.PowerofAtlantis,
				name : "Power of Atlantis",
				maxlevel : 3,
				sprite : sWaterPoolStart,
				thumb : sPowerofAtlantisThumb,
				mindmg : 6,
				maxdmg : 10,
				cooldown : 600,
				duration : 360,
				hitCooldown : 45,
				canBeHasted : true,
				speed : 0,
				hits : 999,
				type : "red",
				shoots : [1, 2, 3],
				desc : [
				"Every 10 seconds, create a whirlpool that draws in targets and takes 15% more damage, lasting 6 seconds and deals 30% damage every 0.5 seconds.",
				"Every 10 seconds, create a whirlpool that draws in targets and takes 30% more damage, lasting 6 seconds and deals 40% damage every 0.5 seconds.",
				"Every 10 seconds, create a whirlpool that draws in targets and takes 50% more damage, lasting 6 seconds and deals 50% damage every 0.5 seconds."
				],
				knockbackSpeed : 0,
				knockbackDuration : 0,
				perk : true,
				characterid : Characters.Lenght
			});
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
				type : "red",
				shoots : [1, 1, 1, 1, 1, 1, 3],
				knockbackSpeed : 0,
				knockbackDuration : 0,
				perk : true,
				characterid : Characters.Ina,
			}, [snd_tailswipe]);
	#endregion
		#endregion
	#endregion
	
	#region BLBook
		newCreateUpgrade({
				id : Weapons.BlBook,
				weight : 3,
				name : "BL Book",
				maxlevel : 7,
				sprite : sBLBook,
				thumb : sBLBookThumb,
				mindmg : [12, 12, 16, 16, 16, 16, 23],
				maxdmg : [16, 16, 20, 20, 20, 20, 28],
				cooldown : 360,
				minimumcooldown : 300,
				shoots : [3, 4, 4, 5, 5, 6, 6],
				hits : 7,
				hitCooldown : 20, 
				duration : [120, 120, 300, 300, 300, 300, 300],
				speed : [3, 3, 3, 3, 5, 5, 5],
				knockbackDuration : 5,
				knockbackSpeed : 2,
				canBeHasted : true,
				type : "white",
				shotType : ShotTypes.Multishot,
				perk : false,
			});
	#endregion
	
	#region Bounce Ball //TODO: knockback depends on character
		newCreateUpgrade({ 
				id : Weapons.BounceBall,
				weight : 4,
				name : "Bounce Ball",
				maxlevel : 7,
				sprite : sBounceBall,
				thumb : sBounceBallThumb,
				mindmg : [10, 12, 12, 12, 12, 12, 17],
				maxdmg : [14, 16, 16, 16, 16, 16, 21],
				cooldown : [120, 120, 120, 120, 120, 102, 102],
				minimumcooldown : 102,
				shoots : [1, 1, 2, 2, 3, 3, 4],
				attackdelay : 5,
				hits : 10,
				hitCooldown : 30, 
				duration : 180,
				speed : 6,
				knockbackDuration : [0, 0, 5, 5, 5, 5, 5],
				knockbackSpeed : [0, 0, 3, 3, 3, 3, 3],
				size : 0.6,
				canBeHasted : true,
				type : "white",
				shotType : ShotTypes.Multishot,
				perk : false,
			});
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
				size : [1, 1.30, 1.30, 1.30, 1.30, 1.30, 1.30],
				knockbackSpeed : 7,
				knockbackDuration : 20,				
				shotType : ShotTypes.Multishot,
				perk : false,
			});
	#endregion
	
	#region Fan Beam
	newCreateUpgrade({
				id : Weapons.FanBeam,
				name : "Fan Beam",
				weight : 3,
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
				knockbackSpeed : 15,
				knockbackDuration : 10,
				shotType : ShotTypes.Ranged,
				perk : false,
			});
	#endregion
	
	#region CEO Tears
	newCreateUpgrade({
				id : Weapons.CEOTears,
				weight : 2,
				name : "CEO's Tears",
				maxlevel : 7,
				sprite : sCeoTears,
				thumb : sCeoTearsThumb,
				mindmg : [8, 10, 10, 10, 12, 12, 12],
				maxdmg : [12, 14, 14, 14, 16, 16, 16],
				cooldown : [30, 30, 30, 20, 20, 10, 10],
				minimumcooldown : 1,
				shoots : [1, 1, 2, 2, 2, 2, 4],
				attackdelay : 1,
				hits : 1,
				hitCooldown : 30, 
				size : 0.9,
				duration : 90,
				speed : [4, 4, 4, 4, 5, 5, 5],
				knockbackDuration : 0,
				knockbackSpeed : 0,
				canBeHasted : true,
				type : "white",
				shotType : ShotTypes.Multishot,
				perk : false,
			});
	#endregion
	
	#region EliteLavaBucket
		newCreateUpgrade({ 
				id : Weapons.EliteLavaBucket,
				weight : 3,
				name : "Elite Lava Bucket",
				maxlevel : 7,
				sprite : sLavaPoolStart,
				thumb : sEliteLavaBucketThumb,
				mindmg : [6, 6, 6, 10, 14, 14, 14],
				maxdmg : [10, 10, 10, 14, 18, 18, 18],
				cooldown : 300,
				minimumcooldown : 1,
				shoots : [1, 1, 2, 2, 2, 3, 4],
				attackdelay : 5,
				hits : 9999,
				hitCooldown : 45, 
				duration : [180, 180, 180, 270, 270, 270, 270],
				speed : 0,
				knockbackDuration : 0,
				knockbackSpeed : 0,
				size : [.9, 1.1, 1.1, 1.1, 1.1, 1.1, 1.32],
				canBeHasted : true,
				type : "white",
				shotType : ShotTypes.Multishot,
				perk : false,
			});
	#endregion
	
	#region EN's Curse
	newCreateUpgrade({ 
			id : Weapons.ENsCurse,
			weight : 2,
			name : "EN's Curse",
			maxlevel : 7,
			sprite : sENCurse,
			thumb : sENCurseThumb,
			mindmg : [12, 12, 17, 17, 17, 17, 17],
			maxdmg : [16, 16, 21, 21, 21, 21, 21],
			cooldown : [110, 110, 110, 110, 110, 93, 93],
			minimumcooldown : 1,
			shoots : [1, 1, 1, 1, 2, 2, 3],
			attackdelay : 10,
			hits : 1,
			hitCooldown : 20, 
			duration : 90,
			speed : 7,
			knockbackDuration : 0,
			knockbackSpeed : 0,
			size : 1.5,
			range : [100, 100, 100, 125, 125, 125, 125],
			chance : [70, 80, 80, 80, 90, 90, 90],
			canBeHasted : true,
			type : "white",
			shotType : ShotTypes.Multishot,
			perk : false,
		});
	#endregion

	#region Holobomb
	newCreateUpgrade({
				id : Weapons.HoloBomb,
				name : "Holo Bomb",
				maxlevel : 7,
				weight : 3,
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
				knockbackSpeed : 0,
				knockbackDuration : 0,
				shotType : ShotTypes.Multishot,
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
	
	#region asacoco
	newCreateUpgrade({ 
				id : Weapons.PlugAsaCoco,
				weight : 4,
				name : "Plug Type Asacoco",
				maxlevel : 7,
				sprite : sAsaCocoShoot,
				thumb : sAsaCocoThumb,
				mindmg : [12, 15, 15, 20, 20, 20, 20],
				maxdmg : [16, 19, 19, 24, 24, 24, 24],
				cooldown : 150,
				minimumcooldown : 1,
				shoots : [1, 1, 2, 2, 3, 3, 4],
				attackdelay : 10,
				hits : 999,
				hitCooldown : 10, 
				duration : 45,
				speed : 20,
				knockbackDuration : [0, 0, 0, 0, 0, 15, 15],
				knockbackSpeed : [0, 0, 0, 0, 0, 7, 7],
				size : 1,
				canBeHasted : true,
				type : "white",
				shotType : ShotTypes.Multishot,
				afterimage : true,
				afterimageColor : c_yellow,
				perk : false,
			});
	#endregion
		
	#region SpiderCooking
		newCreateUpgrade({
				id : Weapons.SpiderCooking,
				name : "Spider Cooking",
				maxlevel : 7,
				weight : 4,
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
				knockbackSpeed : [0, 0, 0, 0, 0, 0, 3],
				knockbackDuration : [0, 0, 0, 0, 0, 0, 8],
				perk : false,
				shotType : ShotTypes.Melee,
				size : [1, 1.15, 1.15, 1.40, 1.40, 1.40, 1.40],
			});
	#endregion
	
	#region Glowstick
			newCreateUpgrade({
				id : Weapons.Glowstick,
				name : "Glowstick",
				weight : 4,
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
				knockbackSpeed : 0,
				shotType : ShotTypes.Multishot,
				knockbackDuration : 0,
				perk : false,
			});
			#endregion
	#region Idol Song //TODO FIX THIS
			newCreateUpgrade({
				id : Weapons.IdolSong,
				name : "Idol Song",
				afterimage : true,
				afterimageColor : c_blue,
				maxlevel : 7,
				weight : 3,
				sprite : sIdolSong,
				thumb : sIdolSongThumb,
				mindmg : [11, 14, 14, 14, 14, 14, 22],
				maxdmg : [15, 18, 18, 18, 18, 18, 27],
				cooldown : [200, 200, 200, 200, 160, 160, 160],
				duration : 150, 
				hitCooldown : 20, 
				canBeHasted : true,
				attackdelay : 30,
				speed : [1, 1, 1.2, 1.2, 1.2, 1.2, 1.2],
				hits : 999,
				type : "white",
				shoots : [2, 2, 2, 2, 2, 4, 4],
				knockbackSpeed : 0,
				knockbackDuration : 0,
				shotType : ShotTypes.Ranged,
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
				size : [1, 1.20, 1.20, 1.44, 1.44, 2.16, 2.16],
				knockbackSpeed : 0,
				knockbackDuration : 0,
				perk : false,
				shotType : ShotTypes.Ranged,
				afterimage : true,
				afterimageColor : c_yellow,
			});
	#endregion
	#region Wamy Water
			newCreateUpgrade({
				id : Weapons.WamyWater,
				name : "Wamy Water",
				maxlevel : 7,
				weight : 3,
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
				shotType : ShotTypes.Melee,
				knockbackSpeed : [5, 5, 5, 8, 8, 8 ,8],
				knockbackDuration : 10,
				perk : false
			});
	#endregion
	
	#region Modded
	#region Pipkin Pippa
	newCreateUpgrade({
				id : Weapons.PipiPilstol,
				name : "PiPiPilstols",
				maxlevel : 6,
				sprite : spr_Pipmod_Pippa_bullet_rifle_pink,
				thumb : spr_Pipmod_Pippa_Icon_Weapon,
				mindmg : [7, 7, 7*1.25, 7*1.25, 7*1.25*1.50, 7*1.25*1.50*1.75],
				maxdmg : [13, 13, 13*1.25, 13*1.25, 13*1.25, 13*1.20*1.40, 13*1.20*1.40],
				cooldown : [80, 80, 80, 80*0.75, 80*0.75, 30],
				duration : [120, 120, 120, 120, 120, 120, 120], 
				hitCooldown : [10, 10, 10, 10, 10, 10, 10], 
				canBeHasted : true,
				attackdelay : 10,
				speed : 5,
				hits : [1, 1, 2, 3, 3, 3],
				type : "red",
				shoots : [2, 4, 4, 4, 4, 4],
				knockbackSpeed : [0, 0, 0, 0, 0, 0, 0],
				knockbackDuration : [0, 0, 0, 0, 0, 0, 0],
				perk : true,
				characterid : Characters.Pippa
			},[snd_bullet, snd_bullet2, snd_bullet3]);
			newCreateUpgrade({
				id : Weapons.HeavyArtillery,
				name : "Heavy Artillery",
				maxlevel : 3,
				sprite : sBombExplosion,
				thumb : spr_Pipmod_Pippa_Icon_Weapon,
				mindmg : (7*333)/100,
				maxdmg : (13*333)/100,
				cooldown : [180, 174, 174],
				duration : 100, 
				attackdelay : 20,
				hitCooldown : 10, 
				canBeHasted : true,
				speed : 0,
				hits : 100,
				type : "red",
				shoots : [1, 1, 2],
				knockbackSpeed : [0, 0, 0, 0, 0, 0, 0],
				knockbackDuration : [0, 0, 0, 0, 0, 0, 0],
				perk : true,
				characterid : Characters.Lenght
			});
	#endregion
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
		var can_be_item;
		var can_be_weapon;
		var can_be_perk;
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
	#endregion
	//first option
	// global.upgradeOptions[0] = PERK_LIST[PerkIds.HeavyArtillery][0];
	 //global.upgradeOptions[0] = global.upgradesAvaliable[Weapons.PsychoAxe][1];
	 //global.upgradeOptions[1] = global.itemList[ItemIds.BlacksmithsGear][1];
	 //global.upgradeOptions[2] = global.itemList[ItemIds.Knightly_Milk][1];
	 //global.upgradeOptions[2] = global.upgradesAvaliable[Weapons.BounceBall][1];
	 //global.upgradeOptions[1] = global.upgradesAvaliable[Weapons.PlugAsaCoco][1];
}	

function tickPowers(){
	if (attacktick == true and UPGRADES[0][$"name"]!="") {
		for (i=0; i < array_length(UPGRADES); i++) {
			var bonusdmg  = 0;
			if (variable_struct_exists(UPGRADES[i], "bonusLevel")) {
				for (var j = 0; j < array_length(UPGRADES[i][$"bonusDamage"]); ++j) {
				    bonusdmg = bonusdmg + UPGRADES[i][$"bonusDamage"][j];
				}			    
			}
			if (UPGRADES[i] != global.null and global.upgradeCooldown[UPGRADES[i][$"id"]] <= 0) {
				instance_create_layer(x,y-8,"Upgrades",oUpgrade,{
					upg : UPGRADES[i],
					speed : UPGRADES[i][$"speed"],
					hits : UPGRADES[i][$"hits"],
					shoots : UPGRADES[i][$"shoots"],
					sprite_index : UPGRADES[i][$"sprite"],
					level : UPGRADES[i][$"level"],
					mindmg: UPGRADES[i][$"mindmg"] + bonusdmg,
					maxdmg: UPGRADES[i][$"maxdmg"] + bonusdmg
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

function spawnUpgrade(_upg = upg, _speed = upg[$"speed"], _hits = upg[$"hits"], _shoots = shoots, _mindmg = upg[$"mindmg"], _maxdmg = upg[$"maxdmg"], _sprite = upg[$"sprite"], _lastdir = arrowDir){
	if (_upg[$"id"] != Weapons.PipiPilstol) { _shoots = -1; }
	var instancecreated = instance_create_layer(owner.x,owner.y-8,"Upgrades",oUpgrade,{
					upg : _upg,
					speed : _speed,
					hits : _hits,
					shoots : _shoots,
					mindmg : _mindmg,
					maxdmg : _maxdmg,
					sprite_index : _sprite,
					a : 0,
					owner : owner,
					arrowDir : _lastdir
				});
		return instancecreated;
}
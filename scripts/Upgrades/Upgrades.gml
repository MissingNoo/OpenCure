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
	ds_map_add(global.null, "hitCooldown", 0);
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
function createUpgradeP2(_id, _level, _maxlevel, _knockbackSpeed, _knockbackDuration, _perk = 0, _character = 0)
{
	var m = global.upgradesAvaliable[_id][_level];
	ds_map_add(m, "knockbackSpeed", _knockbackSpeed);
	ds_map_add(m, "knockbackDuration", _knockbackDuration);
	ds_map_add(m, "perk", _perk);
	ds_map_add(m, "characterid", _character);
	ds_map_add(m, "maxlevel", _maxlevel);
}

enum weapons
{
	AmePistol,
	//GuraTrident,
	//InaTentacle,
	BlBook, //TODO: area
	CEOTears,
	//CuttingBoard,
	EliteLavaBucket, //TODO: lava area
	//FanBean,
	//Glowstick,
	//HoloBomb,
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
				createUpgrade(weapons.AmePistol, "AmePistol", 1, sAmeShoot, sAmePistol, 7, 13, 80, 120, 10, true, 5, 1, "red", 3, "Shoots 3 Projectiles forward. Horizontal only.");
				createUpgradeP2(weapons.AmePistol, 1, 7, 0, 0, 1, Characters.Amelia);
				createUpgrade(weapons.AmePistol, "AmePistol", 2, sAmeShoot, sAmePistol, 7, 13, 80, 120, 10, true, 5, 2, "red", 4, "Shoot 1 additional shot, and each bullet can pierce +1 times.");
				createUpgradeP2(weapons.AmePistol, 2, 7, 0, 0, 1, Characters.Amelia);
				createUpgrade(weapons.AmePistol, "AmePistol", 3, sAmeShoot, sAmePistol, 7*1.25, 13*1.25, 80, 120, 10, true, 5, 2, "red", 4, "Increase damage by 25%.");
				createUpgradeP2(weapons.AmePistol, 3, 7, 0, 0, 1, Characters.Amelia);
				createUpgrade(weapons.AmePistol, "AmePistol", 4, sAmeShoot, sAmePistol, 7*1.25, 13*1.25, 80, 120, 10, true, 5, 2, "red", 4, "Bullets ricochet if hit limit is reached.");
				createUpgradeP2(weapons.AmePistol, 4, 7, 0, 0, 1, Characters.Amelia);
				createUpgrade(weapons.AmePistol, "AmePistol", 5, sAmeShoot, sAmePistol, 7*1.25, 13*1.25, 80*0.75, 120, 10, true, 5, 3, "red", 4, "Each bullet can pierce +1 times. Reduce the time between attacks by 25%.");
				createUpgradeP2(weapons.AmePistol, 5, 7, 0, 0, 1, Characters.Amelia);
				createUpgrade(weapons.AmePistol, "AmePistol", 6, sAmeShoot, sAmePistol, 7*1.25*1.40, 13*1.25*1.40, 80*0.75, 120, 10, true, 5, 3, "red", 4, "Increase damage by 40%.");
				createUpgradeP2(weapons.AmePistol, 6, 7, 0, 0, 1, Characters.Amelia);
				createUpgrade(weapons.AmePistol, "AmePistol", 7, sAmeShoot, sAmePistol, 7*1.25*1.40, 13*1.25*1.40, 80*0.75, 120, 10, true, 5, 3, "red", 6, "Shoot 2 additional shots, and pistol becomes spread type.");
				createUpgradeP2(weapons.AmePistol, 7, 7, 0, 0, 1, Characters.Amelia);
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
	
	#region BLBook
		createUpgrade(weapons.BlBook, "BL Book", 1, sBLBook, sBLBookThumb, 10, 18, 360, 120, 20, 1, 3, 7, "white", 3, "Repels targets with orbiting BL Books.");
		createUpgradeP2(weapons.BlBook, 1, 7, 3, 5);
		createUpgrade(weapons.BlBook, "BL Book", 2, sBLBook, sBLBookThumb, 10, 18, 360, 120, 20, 1, 3, 7, "white", 4, "Repels targets with orbiting BL Books.");
		createUpgradeP2(weapons.BlBook, 2, 7, 3, 5);
		createUpgrade(weapons.BlBook, "BL Book", 3, sBLBook, sBLBookThumb, 10*1.30, 18*1.30, 360, 180, 20, 1, 3, 7, "white", 4, "Repels targets with orbiting BL Books.");
		createUpgradeP2(weapons.BlBook, 3, 7, 3, 5);
		createUpgrade(weapons.BlBook, "BL Book", 4, sBLBook, sBLBookThumb, 10*1.30, 18*1.30, 360, 180, 20, 1, 3, 7, "white", 5, "Repels targets with orbiting BL Books.");
		createUpgradeP2(weapons.BlBook, 4, 7, 3, 5);
		createUpgrade(weapons.BlBook, "BL Book", 5, sBLBook, sBLBookThumb, 10*1.30*1.40, 18*1.30*1.40, 360, 180, 20, 1, 3, 7, "white", 5, "Repels targets with orbiting BL Books.");
		createUpgradeP2(weapons.BlBook, 5, 7, 3, 5);
		createUpgrade(weapons.BlBook, "BL Book", 6, sBLBook, sBLBookThumb, 10*1.30*1.40, 18*1.30*1.40, 360, 180, 20, 1, 3, 7, "white", 6, "Repels targets with orbiting BL Books.");
		createUpgradeP2(weapons.BlBook, 6, 7, 3, 5);
		createUpgrade(weapons.BlBook, "BL Book", 7, sBLBook, sBLBookThumb, 10*1.30*1.40*1.40, 18*1.30*1.40*1.40, 360, 180, 20, 1, 3, 7, "white", 6, "Repels targets with orbiting BL Books.");
		createUpgradeP2(weapons.BlBook, 7, 7, 3, 5);
	#endregion
	
	#region CEO Tears
		//createUpgrade(weapons.CEOTears, "CEO's Tears", 1, s)
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
		createUpgrade(weapons.EliteLavaBucket, "Elite Lava Bucket", 1, sLavaPoolStart, sEliteLavaBucketThumb, 6, 10, 300, 180, 45, true, 0, 999, "white", 1, "Drop lava on the ground, burning targets slowly.");
		createUpgradeP2(weapons.EliteLavaBucket, 1, 7, 0 ,0);
		createUpgrade(weapons.EliteLavaBucket, "Elite Lava Bucket", 2, sLavaPoolStart, sEliteLavaBucketThumb, 6, 10, 300, 180, 45, true, 0, 999, "white", 1, "Increase lava area by 20%. ");
		createUpgradeP2(weapons.EliteLavaBucket, 2, 7, 0 ,0);
		createUpgrade(weapons.EliteLavaBucket, "Elite Lava Bucket", 3, sLavaPoolStart, sEliteLavaBucketThumb, 6, 10, 300, 180, 45, true, 0, 999, "white", 2, "Throw 2 lava buckets. ");
		createUpgradeP2(weapons.EliteLavaBucket, 3, 7, 0 ,0);
		createUpgrade(weapons.EliteLavaBucket, "Elite Lava Bucket", 4, sLavaPoolStart, sEliteLavaBucketThumb, 6*1.30, 10*1.30, 300, 240, 45, true, 0, 999, "white", 2, "Increase damage by 30% and increase duration of lava by 1 second.");
		createUpgradeP2(weapons.EliteLavaBucket, 4, 7, 0 ,0);
		createUpgrade(weapons.EliteLavaBucket, "Elite Lava Bucket", 5, sLavaPoolStart, sEliteLavaBucketThumb, 6*1.30*1.30, 10*1.30*1.30, 300, 240, 45, true, 0, 999, "white", 2, "Increase damage by 30%.");
		createUpgradeP2(weapons.EliteLavaBucket, 5, 7, 0 ,0);
		createUpgrade(weapons.EliteLavaBucket, "Elite Lava Bucket", 6, sLavaPoolStart, sEliteLavaBucketThumb, 6*1.30*1.30, 10*1.30*1.30, 300, 240, 45, true, 0, 999, "white", 3, "Throw 3 lava buckets.");
		createUpgradeP2(weapons.EliteLavaBucket, 6, 7, 0 ,0);
		createUpgrade(weapons.EliteLavaBucket, "Elite Lava Bucket", 7, sLavaPoolStart, sEliteLavaBucketThumb, 6*1.30*1.30, 10*1.30*1.30, 300, 240, 45, true, 0, 999, "white", 4, "Throw 4 lava buckets and increase lava size by 20% .");
		createUpgradeP2(weapons.EliteLavaBucket, 7, 7, 0 ,0);
	#endregion
		#region Asacoco
			createUpgrade(weapons.PlugAsaCoco,"Plug-type Asacoco",1,sAsaCocoShoot,sAsaCocoThumb, 10, 18, 150, 45, 10, true, 20, 999, "white", 1, "Fires a fast piercing tail at a random target.");
			createUpgradeP2(weapons.PlugAsaCoco, 1, 7, 7, 15);
			createUpgrade(weapons.PlugAsaCoco,"Plug-type Asacoco",2,sAsaCocoShoot,sAsaCocoThumb, 10*1.20, 18*1.20, 150, 45, 10, true, 20, 999, "white", 1, "Increase damage by 20%. ");
			createUpgradeP2(weapons.PlugAsaCoco, 2, 7, 7, 15);
			createUpgrade(weapons.PlugAsaCoco,"Plug-type Asacoco",3,sAsaCocoShoot,sAsaCocoThumb, 10*1.20, 18*1.20, 150, 45, 10, true, 20, 999, "white", 2, "Fire an additional Asacoco. ");
			createUpgradeP2(weapons.PlugAsaCoco, 3, 7, 7, 15);
			createUpgrade(weapons.PlugAsaCoco,"Plug-type Asacoco",4,sAsaCocoShoot,sAsaCocoThumb, 10*1.20*1.30, 18*1.20*1.30, 150, 45, 10, true, 20, 999, "white", 2, "Increase damage by 30%. ");
			createUpgradeP2(weapons.PlugAsaCoco, 4, 7, 7, 15);
			createUpgrade(weapons.PlugAsaCoco,"Plug-type Asacoco",5,sAsaCocoShoot,sAsaCocoThumb, 10*1.20*1.30, 18*1.20*1.30, 150, 45, 10, true, 20, 999, "white", 3, "Fire an additional Asacoco. ");
			createUpgradeP2(weapons.PlugAsaCoco, 5, 7, 7, 15);
			createUpgrade(weapons.PlugAsaCoco,"Plug-type Asacoco",6,sAsaCocoShoot,sAsaCocoThumb, 10*1.20*1.30, 18*1.20*1.30, 150, 45, 10, true, 20, 999, "white", 3, "Adds knockback on hit. ");
			createUpgradeP2(weapons.PlugAsaCoco, 6, 7, 7, 15); 
			createUpgrade(weapons.PlugAsaCoco,"Plug-type Asacoco",7,sAsaCocoShoot,sAsaCocoThumb, 10*1.20*1.30, 18*1.20*1.30, 150, 45, 10, true, 20, 999, "white", 4, "Fire an additional Asacoco. ");
			createUpgradeP2(weapons.PlugAsaCoco, 7, 7, 7, 15); 
		#endregion
		
}

#endregion
//generate random list of possible upgrades
function randomUpgrades(){
	random_set_seed(current_time);
	name="";
	var ups = [];
	
	#region Upgrades		
		for (var i = 0; i < array_length(global.upgradesAvaliable); ++i) {
			var maxed = false;
			var found = false;
			for (var j = 0; j < array_length(UPGRADES); ++j) {
				//show_message("A:" + string(UPGRADES[j][?"name"]));
				//show_message("B:" + string(global.upgradesAvaliable[i][1][?"name"]));
				if (UPGRADES[j][?"name"] == global.upgradesAvaliable[i][1][?"name"]) {
					found = true;
				    if (UPGRADES[j][?"level"] != global.upgradesAvaliable[i][1][?"maxlevel"]){
						maxed = false;
					}
					else maxed = true;
				}
				//else {array_push(ups, global.upgradesAvaliable[i]);}
			}	    
			if (found) {
			    if (!maxed) {
				    array_push(ups, global.upgradesAvaliable[i]);
				}
			} else {array_push(ups, global.upgradesAvaliable[i]);}
		}
	#endregion
	
	#region Items
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
				    array_push(ups, ItemList[i]);	
				}
			} else {array_push(ups, ItemList[i]);}
		}
	#endregion
	
	#region Perks
	
		for (var i = 0; i < array_length(PerkList); ++i) {
			if (PerkList[i][0][?"characterid"] == global.Player[?"id"]) {
			    //	array_push(ups, PerkList[i]);
				var maxed = false;
				var found = false;
				for (var j = 0; j < array_length(playerPerks); ++j) {
					if (playerPerks[j][?"name"] == PerkList[i][1][?"name"]) {
						found = true;
					    if (playerPerks[j][?"level"] != PerkList[i][1][?"maxlevel"]){
							maxed = false;
						}
						else maxed = true;
					}
					//else {array_push(ups, global.upgradesAvaliable[i]);}
				}	    
				if (found) {
				    if (!maxed) {
					    array_push(ups, PerkList[i]);	
					}
				} else {array_push(ups, PerkList[i]);}
				//show_debug_message("Added: " + string( PerkList[i][0][?"name"]));
			}	    
		}
	#endregion
	
	for (i=0; i<4; i++) {
		do {
			var rdnnumber = irandom_range(0,array_length(ups)-1);
			var pickedupgrade = ups[rdnnumber][1];
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
	global.upgrade_options[0] = global.upgradesAvaliable[weapons.BlBook][1];
	global.upgrade_options[1] = global.upgradesAvaliable[weapons.PlugAsaCoco][1];
	global.upgrade_options[2] = global.upgradesAvaliable[weapons.EliteLavaBucket][1];
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








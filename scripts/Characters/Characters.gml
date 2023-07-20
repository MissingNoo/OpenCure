// Feather disable all
// Feather disable GM2017
#macro HP global.hp
#macro MAXHP global.maxhp
#macro NAME global.name
function initializePlayer(_p){
	attacktick=true;
	global.newcoins = 0;
	blacksmithLevel = 0;
	#region shop hp upgrade
	var _hpBonus = 4 * global.shopUpgrades[$ "Hp"][$ "level"];
	#endregion
	HP=_p[?"hp"] + _hpBonus;
	MAXHP=_p[?"hp"] + _hpBonus;
	if (global.shopUpgrades[$ "Hardcore"][$ "level"] == 1) {
		MAXHP=1;
	}
	NAME=_p[?"name"];
	for (var i=0; i<6; i++) {
		UPGRADES[i]=global.null;
	}
	for (var i=0; i<6; i++) {
		playerItems[i]=global.nullitem;
	}
	global.upgrade=0;
	global.xp=0;
	global.level = 1;
	damaged=false;
	spddefault=_p[?"speed"];
	spd=_p[?"speed"];
	// Feather disable GM2017
	canShoot = 1;
	arrowDir=0;
	// Feather enable GM2017
	atk=_p[?"atk"];
	sprite=_p[?"sprite"];
	runningsprite=_p[?"runningsprite"];
	sprite_index=sprite;
	global.upgrades[0] = _p[?"weapon"][1];
	Shield = 0;
	MaxShield = 0;
	revives = 0;
	pickupRadius = 35;
	#region Reset bonuses
		for (var i = 0; i < array_length(Bonuses); ++i) {
			if (is_array(Bonuses[i])) {
			    for (var j = 0; j < array_length(Bonuses[i]); ++j) {
					Bonuses[i][j]=0;
				}
			}
			else{
				Bonuses[i]=0;
			}
		}
		if(variable_global_exists("pig") and time_source_exists(global.pig)) {time_source_destroy(global.pig);}
	#endregion
	
	#region reset perk bonuses
		PerkBonuses = array_create(BonusType.Lenght);
		for (var i = 0; i < array_length(PerkBonuses); ++i) {
			PerkBonuses[i]=array_create(PerkIds.Lenght, 0);
			//if (is_array(PerkBonuses[i])) {
			//    for (var j = 0; j < array_length(PerkBonuses[i]); ++j) {
			//		PerkBonuses[i][j]=0;
			//	}
			//}
			//else{
			//	PerkBonuses[i]=0;
			//}
		}
	#endregion
	
	#region reset buffs
		for (var i = 0; i < array_length(Buffs); ++i) {
			if (is_struct(Buffs[i])) {
			    Buffs[i].cooldown = 0;
			}
		}
	#endregion
	gx = 0;
	gy =0;
	pimanLevel = 0;
}

global.characters=[];
#macro CHARACTERS global.characters
function createCharacter(_id, _name, _portrait, _sprite, _runningsprite, _hp, _speed, _atk, _crt, _ballsize, _weapon, _flat)
{
	global.characters[_id]=ds_map_create();
	m = global.characters[_id];
	ds_map_add(m, "id", _id);
	ds_map_add(m, "name", _name);
	ds_map_add(m, "portrait", _portrait);
	ds_map_add(m, "sprite", _sprite);
	ds_map_add(m, "runningsprite", _runningsprite);
	ds_map_add(m, "hp", _hp);
	ds_map_add(m, "speed", _speed);
	ds_map_add(m, "atk", _atk);
	ds_map_add(m, "weapon", _weapon);
	ds_map_add(m, "ballsize", _ballsize);
	ds_map_add(m, "flat", _flat);
}

enum BuffNames{
	ShortHeight,
	SharkBite,
	Slowness,
	Sake,
	SakeFood,
	testbuff
}

//List of Flat Characters
//Gawr Gura IconGawr Gura
//Ninomae Ina'nis IconNinomae Ina'nis
//Hoshimachi Suisei IconHoshimachi Suisei
//Natsuiro Matsuri IconNatsuiro Matsuri
//Murasaki Shion IconMurasaki Shion

function populate_characters(){
	createCharacter(Characters.Amelia,"Watson Amelia",sAmePortrait,sAmeIdle,sAmeRunning,75,1.35,1.30, 1.10, 3,u[Weapons.AmePistol], false);
	createCharacter(Characters.Gura,"Gawr Gura",sGuraPortrait,sGuraIdle,sGuraRunning,65,1.40,1.10,1.05, 1, u[Weapons.GuraTrident], true);
	createCharacter(Characters.Ina,"Ninomae Ina'nis",sInaPortrait,sInaIdle,sInaRunning,75,1.50,0.90, 1.01, 1,u[Weapons.InaTentacle], true);
	#region Modded
	#region Pipkin Pippa
	createCharacter(Characters.Pippa,"Pipkin Pippa",sPippaPortrait,sPippaIdle,sPippaRun,60,1.50,0.95, 1.10, 1,u[Weapons.PipiPilstol], true);
	#endregion
	#endregion
	
	Buffs[BuffNames.ShortHeight] = {
		id : BuffNames.ShortHeight,
		name : "Short Height",
		icon : sShortHeight,
		enabled : false,
		baseCooldown : 2,
		cooldown : 0,
		chance : [0,15,25,35],
		bonus : [0,1.3,1.4,1.5]
	}
	Buffs[BuffNames.testbuff] = {
		id : BuffNames.testbuff,
		name : "Test Buff",
		icon : sBreastplate,
		enabled : false,
		baseCooldown : 10,
		cooldown : 0,
		count : 0,
		chance : [0,15,25,35],
		bonus : [0,1.3,1.4,1.5]
	}
	Buffs[BuffNames.Sake] = {
		id : BuffNames.Sake,
		name : "Sake",
		icon : sSake,
		enabled : false,
		permanent : true,
		baseCooldown : 1,
		cooldown : 0,
		count : 0,
		maxCount : 10
	}
	Buffs[BuffNames.SakeFood] = {
		id : BuffNames.SakeFood,
		name : "SakeFood",
		icon : sSakeFood,
		enabled : false,
		baseCooldown : 5,
		cooldown : 0,
	}
		
	Buffs[BuffNames.SharkBite] = {
		id : BuffNames.SharkBite,
		name : "Shark Bite",
		icon : sSharkBite,
		maxMarks : 5,
		marks : 1,
		level : 1,
		damage : [1,1.6,1.9,1.12],
		chance : [0,10,15,20]
	}
	Buffs[BuffNames.Slowness] = {
		id : BuffNames.Slowness,
		name : "Slowness",
		icon : sShortHeight, //TODO: add slow speed icon
		time : 15,
	}
	//createCharacter(Characters.Ina,"Ninomae Ina'nis",sInaPortrait,sInaIdle,sInaRunning,75,1.50,0.90,u[Weapons.InaTentacle]);
	//createCharacter(Characters.Kiara,"Takanashi Kiara",sAmePortrait,sAmeIdle,sAmeRunning,30,1.35,10,u[Weapons.AmePistol]);
	//createCharacter(Characters.Calli,"Mori Calliope",sAmePortrait,sAmeIdle,sAmeRunning,30,1.35,10,u[Weapons.AmePistol]);
	NAME=CHARACTERS[Characters.Amelia][?"name"];
}


enum Characters {
	Amelia,
	Gura,
	Ina,
	//Kiara,
	//Calli,
	Pippa,
	Lenght
}


function Movement()
{
if canMove == true{
	gamepad_set_axis_deadzone(global.gPnum, 0.7);
	var _left, _right, _up, _down;
	     _left = input_check("left");
	    _right = input_check("right");
	    _up = input_check("up");
	    _down = input_check("down");
	
	if (!instance_exists(oJoystick) and !global.strafe) {
		//if (gamepad_axis_value(global.gPnum, gp_axisrh) != 0 or gamepad_axis_value(global.gPnum, gp_axisrv) != 0) {
			
		//}
		
		if (!global.gamePad) {
			//TODO: fix
			if (os_type != os_android) {
				if (_down) { global.arrowDir=270; }
				if (_up) { global.arrowDir=90; }
				if (_right) { global.arrowDir=0; }
				if (_left) { global.arrowDir=180; }
				if (_up and _right) { global.arrowDir=45; }
				if (_up and _left) { global.arrowDir=135; }
				if (_down and _right) { global.arrowDir=315; }
				if (_down and _left) { global.arrowDir=225; }
				if (global.arrowDir > 90 and global.arrowDir < 270) {
					    image_xscale = -1;
					};
					if (global.arrowDir < 90 and (global.arrowDir > 270 or global.arrowDir > 0)) {
					    image_xscale = 1;
					};
					if (global.arrowDir < 360 and global.arrowDir > 270) {
					    image_xscale = 1;
					};
			}
			else{
				if (global.aim.check() and global.aim.get_touch_x() != undefined and global.aim.get_touch_y() != undefined) {
					_x1 = global.aim.get_touch_start_x();
					_y1 = global.aim.get_touch_start_y();
				    _x2 = global.aim.get_touch_x();
					_y2 = global.aim.get_touch_y();
				}				
				if (!instance_exists(oPlayerWorld)) {
				    global.arrowDir = point_direction(_x1, _y1, _x2, _y2);
					if (global.arrowDir > 90 and global.arrowDir < 270) {
						image_xscale = -1;
					};
					if (global.arrowDir < 90 and (global.arrowDir > 270 or global.arrowDir > 0)) {
						image_xscale = 1;
					};
					if (global.arrowDir < 360 and global.arrowDir > 270) {
						image_xscale = 1;
					};
				}
			}
		}
		else{
			gx = - input_check("aim_left") + input_check("aim_right"); 
			gy = - input_check("aim_up") + input_check("aim_down");
			if (!instance_exists(oPlayerWorld)) {global.arrowDir = point_direction(0,0, gx, gy);}
		}
	}
	var _hspd = 0;
	var _vspd = 0;
	
	if (os_type != os_android) {
	    _hspd = _right - _left;
		_vspd = _down - _up;
	}
	else {
		if (global.move.check() and global.move.get_touch_x() != undefined and global.move.get_touch_y() != undefined) {
			sprite_index=runningsprite;
			_mx1 = global.move.get_touch_start_x();
			_my1 = global.move.get_touch_start_y();
			_mx2 = global.move.get_touch_x();
			_my2 = global.move.get_touch_y();
			_dir = point_direction(_mx1, _my1, _mx2, _my2);
			var _spd = spd;
			var _xadd = lengthdir_x(_spd, _dir);
			var _yadd = lengthdir_y(_spd, _dir);
			move_and_collide(_xadd, _yadd,oCollision);
		}
		else {
			sprite_index=sprite;
		}
	}
    

    if (_hspd != 0 || _vspd != 0)
    {
		if (_hspd != 0) {
			if (!global.strafe and !instance_exists(oJoystick)) {
			    image_xscale=_hspd;
			}		    
		}
		
        var _spd = spd;

        var _dir = point_direction(0, 0, _hspd, _vspd);
		
        var _xadd = lengthdir_x(_spd, _dir);

        var _yadd = lengthdir_y(_spd, _dir);
		move_and_collide(_xadd, _yadd,oCollision);
        //x = x + _xadd;

        //y = y + _yadd;
		sprite_index=runningsprite;
        }
		else if (os_type != os_android) {
			sprite_index=sprite;
		}
    } 
	else if (os_type != os_android) {
		sprite_index=sprite;
		}
}
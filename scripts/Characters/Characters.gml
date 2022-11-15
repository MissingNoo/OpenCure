#macro HP global.hp
#macro MAXHP global.maxhp
#macro NAME global.name
function initializePlayer(p){
	attacktick=true;
	HP=p[?"hp"];
	MAXHP=p[?"hp"];
	NAME=p[?"name"];
	for (i=0; i<6; i++) {
		global.upgrades[i]=global.null;
	}
	global.upgrade=0;
	global.xp=0;
	damaged=false;
	spddefault=p[?"speed"];
	spd=p[?"speed"];
	can_shoot = 1;
	arrow_dir=0;
	atk=p[?"atk"]
	sprite_index=p[?"sprite"]
	
	global.upgrades[0] = p[?"weapon"];
}

global.characters=[];
#macro CHARACTERS global.characters
function createCharacter(_id, _name, _portrait, _sprite, _hp, _speed, _atk, _weapon)
{
	global.characters[_id]=ds_map_create();
	m = global.characters[_id];
	ds_map_add(m, "name", _name);
	ds_map_add(m, "portrait", _portrait);
	ds_map_add(m, "sprite", _sprite);
	ds_map_add(m, "hp", _hp);
	ds_map_add(m, "speed", _speed);
	ds_map_add(m, "atk", _atk);
	ds_map_add(m, "weapon", _weapon);
}
createCharacter(0,"John",sDouglasPortrait,sJohn,30,1,10,u[weapons.Knife]);
createCharacter(1,"Douglas",sDouglasPortrait,sDouglas,30,2,10, u[weapons.DouglasShoot]);		
createCharacter(2,"RedGuy",sDouglasPortrait,sEnemy2,30,2,10, u[weapons.Flying_Knife]);		

NAME=CHARACTERS[Characters.John][?"name"];
enum Characters {
	John,
	Douglas,
	RedGuy,
	lenght
}


function Movement()
{

// if the variable _hspd does not equal zero

// or

// if the variable _vspd does not equal zero

if can_move == true{

    var _left = (keyboard_check(ord("A"))) ;
	if (_left) {
	    global.arrow_dir=-90;
	}
    var _right = (keyboard_check(ord("D")));
	if (_right) {
		global.arrow_dir=90;
	}
    var _up = (keyboard_check(ord("W")));
	if (_up) {
	    global.arrow_dir=180;
	}
    var _down = (keyboard_check(ord("S")));
	if (_down) {
	    global.arrow_dir=0;
	}
	
    var _hspd = _right - _left;

    var _vspd = _down - _up;

    if (_hspd != 0 || _vspd != 0)
    {
		if (_hspd != 0) {
		    image_xscale=_hspd;
		}
		
        var _spd = spd;

        var _dir = point_direction(0, 0, _hspd, _vspd);
		
        var _xadd = lengthdir_x(_spd, _dir);

        var _yadd = lengthdir_y(_spd, _dir);

        x = x + _xadd;

        y = y + _yadd;
		image_speed=1;
        }
		else {
			image_index = 0;
			image_speed=0;
		}
    } 
	else {
        image_index = 0;
		image_speed=0;
		}
}





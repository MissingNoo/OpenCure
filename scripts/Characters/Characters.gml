function initializePlayer(p){
	attacktick=true;
	global.hp=p[?"hp"];
	global.maxhp=p[?"hp"];
	global.nome=p[?"name"];
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

function createCharacter(_id, _name, _sprite, _hp, _speed, _atk, _weapon)
{
	global.characters[_id]=ds_map_create();
	m = global.characters[_id];
	ds_map_add(m, "name", _name);
	ds_map_add(m, "sprite", _sprite);
	ds_map_add(m, "hp", _hp);
	ds_map_add(m, "speed", _speed);
	ds_map_add(m, "atk", _atk);
	ds_map_add(m, "weapon", _weapon);
}
createCharacter(0,"John",sJohn,30,1,10,global.upgradesAvaliable[2]);
createCharacter(1,"Douglas",sEnemy1,30,2,10, "Gun");		





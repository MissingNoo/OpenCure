// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Feather disable GM1043
// Feather disable GM2025
global.upgrade=0;

global.null=ds_map_create()
ds_map_add(global.null, "name", "");
ds_map_add(global.null, "sprite", blank);
ds_map_add(global.null, "thumb", blank);
ds_map_add(global.null, "level", "");
ds_map_add(global.null, "dmg", 0);
ds_map_add(global.null, "cooldown", 0);
ds_map_add(global.null, "speed", 0);
ds_map_add(global.null, "hits", 0);
global.upgradesAvaliable=ds_list_create();
for (i=0; i<4; i++) {
    global.upgrade_options[i]=global.null;
}
#region Upgrades

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
createUpgrade(0,"AsaCoco", sAsaCoco, suAsacoco,10,3,2,300);
createUpgrade(1,"Flying Knife", suFlyingKnife, sKnife,10,3,2,1);
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

function arrowDir(){
    if (input_check("left")) {
        x -= spd;
        image_xscale = -1;
        arrow_dir = -90;
    }
    if (input_check("right")) {		
        x += spd;
        image_xscale = 1;
        arrow_dir = 90;
    }
    if (input_check("up")) {
        y -= spd;
        arrow_dir = 180;
    }
    if (input_check("down")) {
        y += spd;
        arrow_dir = 0;
    }	
}

function normalAttack(){
	    if (can_shoot == 1) {
        can_shoot = 0;
        alarm[0] = 60;
        attk = instance_create_layer(x, y, "Instances", oAtk);
        switch (arrow_dir) {
            case 90:
                attk.x = x + 32;
                break;
            case -90:
                attk.x = x - 32;
                attk.image_xscale = -1;
                break;
            case 0:
                attk.y = y + 32;
                attk.image_angle = point_direction(x, y, x, y + 90);
                break;
            case 180:
                attk.y = y - 32;
                attk.image_angle = point_direction(x, y, x, y - 90);
                break;
        }
    }
}

function tickPowers(){
	normalAttack();
	if (attacktick == true and global.upgrades[0][?"name"]!="") {
		attacktick=false;
		alarm[2]=120;
		for (i=0; i < array_length(global.upgrades); i++) {
			global.gen = global.upgrades[i];		
			a = instance_create_layer(x,y,"Upgrades",oUpgrade);			
			a.upg=global.upgrades[i];
		}
	}
}












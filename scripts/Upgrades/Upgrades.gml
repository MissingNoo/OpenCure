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
function createUpgrade(_id, _name, _level, _sprite, _thumb, _mindmg = 7, _maxdmg = 13, _cooldown, _speed, _hits = 1, _type = "white", _shoots = 1)
{
	global.upgradesAvaliable[_id][0]=global.null;
	global.upgradesAvaliable[_id][_level]=ds_map_create();
	var m = global.upgradesAvaliable[_id][_level];
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
}
//createUpgrade(0,"Speed", suSpeed);		
//createUpgrade(0,"Atk", suATK,10,3);		
enum weapons
{
	AmePistol,
	Flying_Knife,
	Knife,
	DouglasShoot
}
createUpgrade(weapons.AmePistol,"AmePistol",1, sAmeShoot, sAmePistol,,,3,4,, "red", 3);
createUpgrade(weapons.Flying_Knife,"Flying Knife",1, suFlyingKnife, sKnife,10,3,2,1);
createUpgrade(weapons.Knife,"Knife",1, suNormalKnife, sKnife,10,3,0,1);
createUpgrade(weapons.DouglasShoot,"DouglasShoot",1, sDouglasShoot, sDouglasShoot,10,3,3,100);
#endregion

function randomUpgrades(){
	random_set_seed(current_time);
	onlist=false;
	name="";
	for (i=0; i<4; i++) {
		    name = global.upgradesAvaliable[irandom_range(0,array_length(global.upgradesAvaliable)-1)][1][?"name"];
		    global.upgrade_options[i] = name		
	}
}	

function tickPowers(){
	if (attacktick == true and UPGRADES[0][1][?"name"]!="") {
		attacktick=false;
		alarm[2]=120;
		for (i=0; i < array_length(UPGRADES); i++) {
			if (UPGRADES[i][1] != global.null) {
			    inst = (instance_create_layer(x,y,"Upgrades",oUpgrade));
				inst.upg=UPGRADES[i];
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



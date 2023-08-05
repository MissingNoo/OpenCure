//show_debug_overlay(true, true);
//dbg_view("Game", true);
//dbg_section("Player");
//dbg_button("test", function(){show_message_async("test");})
unlockedAchievements = [];
anvilconfirm = false;
upgradeconfirm = false;
justopened = 0;
lastmenu = PMenus.Pause;
editOption = false;
mousein = false;
guiOffset = 0;
characterSelected = false;
selectedCharacter = 1;
HP = 1;
androidoffset = 0;
if (os_type == os_android) {
	//androidoffset = 4;
	display_set_gui_size(display_get_width()/1.5, display_get_height()/1.5);
	//window_set_size(display_get_width(),display_get_height());
	//show_message_async(string(1366) + ":" + string(display_get_width()/1.5) + "=" + string(1366 - (display_get_width()/1.5)))
	//guiOffset = round((display_get_width()/1.5) - 1366) / 6.50;
	//guiOffset = 48;
	//show_message_async(string(guiOffset));
	//display_set_gui_size(2340/1.5, 1080/1.5);
}
released=false;
global.showhpui = true;
zKey = 0;
xKey = 0;
eKey = 0;
leftKey = 0;
rightKey = 0;
upKey = 0;
downKey = 0;
isP=global.gamePaused;
lastinputs = array_create(10);
holoarrowspr=0;
debug=false;
selectingOutfit = false;
selectedOutfit = 0;
global.selectedOutfit = 0;
maxOutfits = 0;
outfitSelected = false;
outfitIdleAnimation = [0, 0];
outfitIdleSpeed = 0;
selected=0;
maxselected = selected;
color=c_white;
menuOptions = ["Map", "Singleplayer", "Multiplayer", "Shop", "Leaderboard", "Achievements", "Settings", "Credits", "Quit"];
reset_timer()
global.upgrades=ds_map_create();
global.a=1;
a=2;
b=2;
c=2;
d=2;
e=1;
f=1;
g=1;
h=1;
image_speed=5;
sprindex=0;
if (os_type == os_android) {
    //display_set_gui_size(1280,720);
	if (!instance_exists(oJoystick)) {
	    instance_create_depth(0,0,0,oJoystick);
	}	
}
zButton = [GW/1.15, GH/14, GW/1.15 + 120, GH/14 + 45, "Z"];
xButton = [GW/1.15 - 140, GH/14, GW/1.15 - 140 + 120, GH/14 + 45, "X"];
pButton = [GW/1.15 - 280, GH/14, GW/1.15 - 280 + 120, GH/14 + 45, "P"];
plusButton = [GW/1.15 - 420, GH/14, GW/1.15 - 420 + 120, GH/14 + 45, ">"];
minusButton = [GW/1.15 - 560, GH/14, GW/1.15 - 560 + 120, GH/14 + 45, "<"];
houseButton = [GW/1.15 - 700, GH/14, GW/1.15 - 700 + 120, GH/14 + 45, "H"];
if (os_type == os_android) {
	zB = input_virtual_create();
	zB.rectangle(zButton[0], zButton[1], zButton[2], zButton[3]);
	zB.button("accept");

	xB = input_virtual_create();
	xB.rectangle(xButton[0], xButton[1], xButton[2], xButton[3]);
	xB.button("cancel");

	pB = input_virtual_create();
	pB.rectangle(pButton[0], pButton[1], pButton[2], pButton[3]);
	pB.button("pause");

	hB = input_virtual_create();
	hB.rectangle(houseButton[0], houseButton[1], houseButton[2], houseButton[3]);
	hB.button("house");
}
revives = 0;
event = 0;
#region PauseMenu
	
activeMenu = PMenus.Pause;
enum PM{	
	Title,
	XScale,
	YScale,
	Options,
	Bool,
	BoolValue,
	Lenght
}
enum PMenus{
	Pause,
	Settings,
	Graphics,
	Lenght
}
for (var i = 0; i < PMenus.Lenght; ++i) {
	pauseMenu[i] = array_create(PMenus.Lenght, 0);
	//show_message(string(pauseMenu));
	for (var j = 0; j < PM.Lenght; ++j) {
		pauseMenu[i][j] = 0;
	}
}
	
pauseMenu[PMenus.Pause][PM.Title] = "PAUSED";
pauseMenu[PMenus.Pause][PM.XScale] = 2;
pauseMenu[PMenus.Pause][PM.Options] = ["Skills", "????", "Resume", "Settings", "Quit"];
//pauseMenu[PMenus.Pause][PM.Options] = ["Skills"];
pauseMenu[PMenus.Pause][PM.YScale] = 0.75;
#region Settings
	pauseMenu[PMenus.Settings][PM.Title] = "SETTINGS";
	pauseMenu[PMenus.Settings][PM.XScale] = 2.5;
	
	function loadSettingValues(){
		pauseMenu[PMenus.Settings][PM.Options][0] = "Music Volume: " + string(round(global.musicVolume*100)) + "%";
		pauseMenu[PMenus.Settings][PM.Options][1] = "Sound Volume: " + string(round(global.soundVolume*100)) + "%";
		pauseMenu[PMenus.Settings][PM.Bool][2] = true;
		pauseMenu[PMenus.Settings][PM.BoolValue][2] = global.damageNumbers;
		pauseMenu[PMenus.Settings][PM.Options][2] = "damage Numbers: ";
		pauseMenu[PMenus.Settings][PM.Bool][3] = true;
		pauseMenu[PMenus.Settings][PM.BoolValue][3] = global.screenShake;
		pauseMenu[PMenus.Settings][PM.Options][3] = "screen Shake: ";
		pauseMenu[PMenus.Settings][PM.Bool][4] = true;
		pauseMenu[PMenus.Settings][PM.BoolValue][4] = global.spawnEnemies;
		pauseMenu[PMenus.Settings][PM.Options][4] = "spawnEnemies: ";
		pauseMenu[PMenus.Settings][PM.Options][5] = "gamePad: ";
		pauseMenu[PMenus.Settings][PM.Bool][5] = true;
		pauseMenu[PMenus.Settings][PM.BoolValue][5] = global.gamePad;
		pauseMenu[PMenus.Settings][PM.Options][6] = "showhpui: ";
		pauseMenu[PMenus.Settings][PM.Bool][6] = true;
		pauseMenu[PMenus.Settings][PM.BoolValue][6] = global.showhpui;
	}
	loadSettingValues();
	//pauseMenu[PMenus.Pause][PM.Options] = ["Skills"];
	pauseMenu[PMenus.Settings][PM.YScale] = 0.75;
	#endregion
startOption = 0;
	totaloptions = array_length(pauseMenu[activeMenu][PM.Options]);
#endregion
if (instance_number(oTitleRunning) < 15 and room == rInicio) {
    instance_create_layer(0,0, "Instances", oTitleRunning);
}
#region Stages
	stageSelected = false;
	stageModes = [
	{
		name : "STAGE MODE", 
		desc : "Defeat the last boss to \ncomplete the stage!"
	},
	{
		name : "ENDLESS MODE", 
		desc : "Survive for as long as \nyou can and reach the top \nof the leaderboards!"
	},
	{
		name : "TIME MODE",
		desc : "Defeat 5000 targets as \nsoon as possible! \nShop upgrades are standardized"
	}];
	stages = [{name: "Stage 1", port : sStage1Port, roomname : rStage1}]
	selectedStage = 0;
#endregion

#region Functions
//feather disable once GM2017
/// @desc Function Description
/// @param {array} pos Description
/// @returns {bool} Description
function button_click(pos){
	var result = false;
	if (point_in_rectangle(oGui.x, oGui.y, pos[0], pos[1], pos[2], pos[3])){
		result = true;
		oGui.x = 0;
		oGui.y = 0;
	}
	return result;
}
//feather disable once GM2017
function share_item(i){
	if (global.shareItems) {
		sendMessage({
			command : Network.AddItem,
			type : "item",
			id : playerItems[i][$"id"],
			level : playerItems[i][$"level"],
			pos : i
		});
	}
}

/**
 * Function Description
 * @param {any*} i Description
 */
 //feather disable once GM2017
function share_weapon(i){
if (global.shareWeapons) {
	sendMessage({
		command : Network.AddItem,
		type : "weapon",
		id : UPGRADES[i][$"id"],
		level : UPGRADES[i][$"level"],
		pos : i
	});
}
}
//feather disable once GM2017
function android_gui_button(pos){
	draw_set_alpha(0.5);
	draw_set_color(c_white);
	draw_rectangle(pos[0], pos[1], pos[2], pos[3], false);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_rectangle(pos[0], pos[1], pos[2], pos[3], true);
	draw_text(pos[0] + 70, pos[1] + 22.5, pos[4]);
	draw_set_color(c_white);
}

function drawStats(){
	#region Stats
		var str
		draw_set_halign(fa_center);
		if (global.upgrade) {
			draw_text_transformed(GW/5, GH/3.40, "LevelUP", 3, 3, 0);
		}
		draw_text_transformed(GW/5, GH/2.70, NAME, 2, 2, 0);
		var stats_offset=0;
			
		#region HP
			draw_sprite_stretched(sHeartShaded, 0, GW/11, GH/2.15, 25, 25);
			draw_set_halign(fa_left);
			draw_text_transformed(GW/8 - 15, GH/2.15, "HP", 1.5, 1.5, 0);
			draw_line(GW/8.80, GH/2, GW/3.40, GH/2);
			str = string(HP) + "/" + string(MAXHP);
			draw_set_halign(fa_right);
			draw_text_transformed(GW/3.40, GH/2.15, str, 1.5, 1.5, 0);
			draw_set_halign(fa_left);
		#endregion
			
			#region ATK
				stats_offset += 35;
				draw_sprite_stretched(sSwordBlue, 0, GW/11, GH/2.15 + stats_offset, 25, 25);
				draw_text_transformed(GW/8 - 15, GH/2.15 + stats_offset, "ATK", 1.5, 1.5, 0);
				draw_line(GW/8.80, GH/2 + stats_offset, GW/3.40, GH/2 + stats_offset);
				var calc = 0;
				calc += real(string_replace(string(global.player[?"atk"]), "1.", ""));
				for (var i = 0; i < array_length(Bonuses[BonusType.Damage]); ++i) {
					if (Bonuses[BonusType.Damage][i] != 0) {
						calc += real(string_replace(string(Bonuses[BonusType.Damage][i]), "1.", ""));
					}
				}
				for (var i = 0; i < array_length(PerkBonuses[BonusType.Damage]); ++i) {
					if (PerkBonuses[BonusType.Damage][i] != 0) {
						calc += real(string_replace(string(PerkBonuses[BonusType.Damage][i]), "1.", ""));
					}
				}
				str = ((calc > 0) ? "+" : "") + string_replace(string(calc), ".00", "") + "%";
				draw_set_halign(fa_right);
				draw_text_transformed(GW/3.40, GH/2.15 + stats_offset, str, 1.5, 1.5, 0);
				draw_set_halign(fa_left);
			#endregion
				
			#region SPD
				stats_offset += 35;
				draw_sprite_stretched(sHudSpdIcon, 0, GW/11, GH/2.15 + stats_offset, 25, 25);
				draw_text_transformed(GW/8 - 15, GH/2.15 + stats_offset, "SPD", 1.5, 1.5, 0);
				draw_line(GW/8.80, GH/2 + stats_offset, GW/3.40, GH/2 + stats_offset);
				calc = 0;
				calc += real(string_replace(string(global.player[?"speed"]), "1.", ""));
				for (var i = 0; i < array_length(Bonuses[BonusType.Speed]); ++i) {
					if (Bonuses[BonusType.Speed][i] != 0) {
						calc += real(string_replace(string(Bonuses[BonusType.Speed][i]), "1.", ""));
					}
				}
				for (var i = 0; i < array_length(PerkBonuses[BonusType.Speed]); ++i) {
					if (PerkBonuses[BonusType.Speed][i] != 0) {
						calc += real(string_replace(string(PerkBonuses[BonusType.Speed][i]), "1.", ""));							
					}
				}
				str = ((calc > 0) ? "+" : "") + string_replace(string(calc), ".00", "") + "%";
				draw_set_halign(fa_right);
				draw_text_transformed(GW/3.40, GH/2.15 + stats_offset, str, 1.5, 1.5, 0);
				draw_set_halign(fa_left);
			#endregion
				
			#region CRT
				stats_offset += 35;
				draw_sprite_stretched(sHudCrtIcon, 0, GW/11, GH/2.15 + stats_offset, 25, 25);
				draw_text_transformed(GW/8 - 15, GH/2.15 + stats_offset, "CRT", 1.5, 1.5, 0);
				draw_line(GW/8.80, GH/2 + stats_offset, GW/3.40, GH/2 + stats_offset);
				calc = oPlayer.critChance;
				str = ((calc > 0) ? "+" : "") + string_replace(string(calc), ".00", "") + "%";
				draw_set_halign(fa_right);
				draw_text_transformed(GW/3.40, GH/2.15 + stats_offset, str, 1.5, 1.5, 0);
				draw_set_halign(fa_left);
			#endregion
				
			#region Pickup
				stats_offset += 35;
				draw_sprite_stretched(sHudPickupIcon, 0, GW/11, GH/2.15 + stats_offset, 25, 25);
				draw_text_transformed(GW/8 - 15, GH/2.15 + stats_offset, "Pickup", 1.5, 1.5, 0);
				draw_line(GW/8.80, GH/2 + stats_offset, GW/3.40, GH/2 + stats_offset);
				calc = 0;
				
				for (var i = 0; i < array_length(Bonuses[BonusType.PickupRange]); ++i) {
					if (Bonuses[BonusType.PickupRange][i] != 0) {
						calc += real(string_replace(string(Bonuses[BonusType.PickupRange][i]), "1.", ""));
					}
				}
				//for (var i = 0; i < array_length(PerkBonuses[BonusType.PickupRange]); ++i) {
				//	if (PerkBonuses[BonusType.PickupRange][i] != 0) {
				//	    calc += real(string_replace(string(PerkBonuses[BonusType.PickupRange][i]), "1.", ""));
				//	}
				//}//TODO: if there is a pickuprange bonus perk
				str = ((calc > 0) ? "+" : "") + string_replace(string(calc), ".00", "") + "%";
				draw_set_halign(fa_right);
				draw_text_transformed(GW/3.40, GH/2.15 + stats_offset, str, 1.5, 1.5, 0);
				draw_set_halign(fa_left);
			#endregion

			#region Haste
				stats_offset += 35;
				draw_sprite_stretched(sHudCooldownIcon, 0, GW/11, GH/2.15 + stats_offset, 25, 25);
				draw_text_transformed(GW/8 - 15, GH/2.15 + stats_offset, "Haste", 1.5, 1.5, 0);
				draw_line(GW/8.80, GH/2 + stats_offset, GW/3.40, GH/2 + stats_offset);
				calc = 0;
				for (var i = 0; i < array_length(Bonuses[BonusType.Haste]); ++i) {
					if (Bonuses[BonusType.Haste][i] != 0) {
						calc += real(string_replace(string(Bonuses[BonusType.Haste][i]), "1.", ""));
					}
				}
				//for (var i = 0; i < array_length(PerkBonuses[BonusType.Haste]); ++i) {
				//	if (PerkBonuses[BonusType.Haste][i] != 0) {
				//	    calc += real(string_replace(string(PerkBonuses[BonusType.Haste][i]), "1.", ""));
				//	}
				//}//TODO: if there is a Haste bonus perk
				str = ((calc > 0) ? "+" : "") + string_replace(string(calc), ".00", "") + "%";
				draw_set_halign(fa_right);
				draw_text_transformed(GW/3.40, GH/2.15 + stats_offset, str, 1.5, 1.5, 0);
				draw_set_halign(fa_center);
			#endregion
			draw_set_halign(fa_left);
		#endregion
}
/**
	* Function Description
	* @param {any*} character Description
	*/
function drawStatsSelect(character){
	var stats_offset = 0;
	
	var _x = GW/17.54;
	var _y = GH/1.54;
	var str;
	draw_set_color(c_white);
	
	var stats = [
		{
			spr : sHeartShaded,
			name : "HP",
			stat : character[?"hp"],
			suffix : ""
		},
		{
			spr : sSwordBlue,
			name : "ATK",
			stat : character[?"atk"],
			suffix : "x"
		},
		{
			spr : sHudSpdIcon,
			name : "SPD",
			stat : character[?"speed"],
			suffix : "x"
		},
		{
			spr : sHudCrtIcon,
			name : "CRT",
			stat : string_replace(character[?"crit"], "1.", ""),
			suffix : "%"
		},
		]
		
		for (var i = 0; i < array_length(stats); ++i) {
			draw_sprite_ext(stats[i][$"spr"], 0, _x, _y + stats_offset, 1.90, 1.90, 0, c_white, 1);
			draw_text_transformed(_x + 25, _y - 17 + stats_offset, stats[i][$"name"], 2, 2, 0);
			draw_rectangle(_x + 27, _y + 12 + stats_offset, _x + 268, _y + 9 + stats_offset, false);
			draw_set_halign(fa_left);
			str = string(stats[i][$"stat"]) + stats[i][$"suffix"];
			draw_set_halign(fa_right);
			draw_text_transformed(_x + 265, _y - 17 + stats_offset, str, 2, 2, 0);
			draw_set_halign(fa_left);
			stats_offset += 40;
		}
}
#endregion
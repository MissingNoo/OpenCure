/// @description Insert description here
// You can write your code in this editor
switch (upg[$"id"]) {
    case Weapons.GuraTrident:
		image_alpha=0;
		if (shoots==1) {
		    instance_destroy();
		}
        break;
	case Weapons.InaTentacle:
		instance_destroy();
		break;
	case Weapons.EliteLavaBucket:{
		if (sprite_index == sLavaPoolStart) {
			image_index = 0;
		    sprite_index = sLavaPoolLoop;			
			changeSprite= true;
			dAlarm[1]=upg[$"duration"] * 0.25;
		}
		if (sprite_index == sLavaPoolLoop and changeSprite == false) {
			changeSprite=true;
			dAlarm[1]=2;
		    if (loops > 0) {
				image_index = 0;
			    sprite_index = sLavaPoolEnd;
			}
			else loops += 1;
		}
		if (sprite_index == sLavaPoolEnd and changeSprite == false) {
			instance_destroy();
		}
		break;}
	case Weapons.FanBeam:{
		image_alpha = 0;
		instance_destroy();
		break;
	}
	case Weapons.HoloBomb:{
		if (sprite_index == sBombExplosion) {
		    instance_destroy();
		}
		break;}
	case Weapons.Glowstick:{
		if (sprite_index == sGlowstickThumbExplosion) {
		    instance_destroy();
		}
		break;}
	case Weapons.WamyWater:{
		    instance_destroy();
		break;}
	case Weapons.HeavyArtillery:{
		    instance_destroy();
		break;}
	case Weapons.Shockwave:{
		    instance_destroy();
		break;}
	case Weapons.XPotatoExplosion:{
		    instance_destroy();
		break;}
	#region Collabs
	#region MiComet
	case Weapons.MiCometMeteor:{
		if (sprite_index == sMiCometSplash) {
			instance_create_depth(x, y - (sprite_get_height(WEAPONS_LIST[Weapons.MiCometPool][1][$"sprite"]) * WEAPONS_LIST[Weapons.MiCometPool][1][$"size"]) / 2, depth, oUpgrade,{
					upg : WEAPONS_LIST[Weapons.MiCometPool][1],
					speed : WEAPONS_LIST[Weapons.MiCometPool][1][$"speed"],
					hits : WEAPONS_LIST[Weapons.MiCometPool][1][$"hits"],
					shoots : WEAPONS_LIST[Weapons.MiCometPool][1][$"shoots"],
					sprite_index : WEAPONS_LIST[Weapons.MiCometPool][1][$"sprite"],
					level : WEAPONS_LIST[Weapons.MiCometPool][1][$"level"],
					mindmg: WEAPONS_LIST[Weapons.MiCometPool][1][$"mindmg"],
					maxdmg: WEAPONS_LIST[Weapons.MiCometPool][1][$"maxdmg"]
				});
			instance_destroy();
		}
		if (sprite_index == sMiComet) {
			image_index = 0;
		    sprite_index = sMiCometSplash;
		}
		break;}
	case Weapons.MiCometPool:{
		if (sprite_index == sLavaPoolStart) {
			image_index = 0;
		    sprite_index = sLavaPoolLoop;
		}
		if (sprite_index == sLavaPoolEnd) {
			instance_destroy();
		}
		break;}
	#endregion
	#endregion
    default:
        // code here
        break;
}



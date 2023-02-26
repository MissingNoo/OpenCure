/// @description Insert description here
// You can write your code in this editor
switch (upg[$"id"]) {
    case Weapons.GuraTrident:
		image_alpha=0;
		if (shoots==1) {
		    instance_destroy();
		}
        break;
	case "InaTentacle":
		instance_destroy();
		break;
	case Weapons.EliteLavaBucket:{
		if (sprite_index == sLavaPoolStart) {
			image_index = 0;
		    sprite_index = sLavaPoolLoop;			
			changeSprite= true;
			alarm[1]=upg[$"duration"] * 0.25;
		}
		if (sprite_index == sLavaPoolLoop and changeSprite == false) {
			changeSprite=true;
			alarm[1]=2;
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
    default:
        // code here
        break;
}



switch (upg[$ "id"]) {
	default:
		instance_destroy();
		break;
	case Weapons.EliteLavaBucket:{
		changeSprite=false;
		break;}
	case Weapons.MiCometPool:{
		subImg = 0;
		sprite_index = sLavaPoolEnd;
		break;}
	case Weapons.PlugAsaCoco:{
		speed = originalspeed;
		audio_play_sound(choose(snd_tailplug, snd_tailplug2, snd_tailplug3),0,0);
		break;}
	case Weapons.XPotato:{
		instance_destroy();
		instance_create_depth(x,y,depth,oUpgrade, { upg : WEAPONS_LIST[Weapons.XPotatoExplosion][upg[$ "level"]], mindmg : upg[$ "mindmgExplosion"], maxdmg : upg[$ "maxdmgExplosion"]});
		break;}
}
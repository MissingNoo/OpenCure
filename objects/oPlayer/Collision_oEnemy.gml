/// @description 
if (!damaged and !global.gamePaused) {
	damaged=true;
	global.hp-=10;    
	alarm[1]=60;
}


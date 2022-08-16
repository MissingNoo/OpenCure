/// @description 
if (!damaged and !global.gamePaused) {
	damaged=true;
	global.hp-=other.atk;    
	alarm[1]=60;
}



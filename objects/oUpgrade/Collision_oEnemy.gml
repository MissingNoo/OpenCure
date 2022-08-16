/// @description 

if (other.damaged ==false and !global.gamePaused) {
	other.damaged=true;
	other.hp-=atk;    
	other.alarm[1]=25;	
	hits-=1;
}



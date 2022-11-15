/// @description 

if (other.damaged == false and !global.gamePaused and other.image_alpha == 1 and image_alpha == 1) {
	other.damaged=true;
	other.hp-=atk;    
	other.alarm[1]=25;	
	hits-=1;
}






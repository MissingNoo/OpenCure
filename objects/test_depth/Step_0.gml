if(keyboard_check_pressed(vk_enter)){
	++state;	
}

depth = (state==0) ? 1000 : -1000;

if(state > 1){
	instance_destroy();	
}


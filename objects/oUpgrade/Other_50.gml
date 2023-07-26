switch (upg[$"id"]) {
    case Weapons.XPotato:{
		if (justBounced) { return; }
		if (!justBounced) {
		    justBounced = true;
			dAlarm[2]=50;
		}
		direction += 180;
		break;
	}
    default:
        // code here
        break;
}
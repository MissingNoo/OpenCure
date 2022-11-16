/// @description Insert description here
// You can write your code in this editor
switch (upg[?"name"]) {
    case "GuraTrident":
		image_alpha=0;
		if (shoots==1) {
		    instance_destroy();
		}
        
        break;
	case "InaTentacle":
		instance_destroy();
		break;
    default:
        // code here
        break;
}


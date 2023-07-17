if (justOpened) { return; }
if (!optionConfirmed) {
	if (input_check_pressed("cancel")) {
	    instance_destroy();
	}
	var maxoption = array_length(shopOptions);
	if (input_check_pressed("down") and selectedOption < maxoption - 1) {
		selectedOption++;
	}
	if (input_check_pressed("up") and selectedOption > 0) {
		selectedOption--;
	}
	if (input_check_pressed("accept")) {
		switch (shopOptions[selectedOption]) {
		    case ShopOption.Talk:
		        //TODO
		        break;
		    case ShopOption.Quit:
		        instance_destroy();
		        break;
		    default:
		        optionConfirmed = true;
				category = shopOptions[selectedOption];
				selectedItem = 0;
				firstitem = 0;
				maxitem = 3;
		        break;
		}	    
	}
    return;
}
else if (input_check_pressed("cancel")) {
	optionConfirmed = false;
}
var maxvalue = 0;
switch (category) {
	case ShopOption.Buy:
		maxvalue = array_length(shopItemsBuy);
		break;
	case ShopOption.Sell:
		maxvalue = array_length(shopItemsSell);
		break;
}

if (input_check_pressed("down") and selectedItem < maxvalue - 1) {
	selectedItem++;
	if (selectedItem >= maxitem and maxitem < maxvalue) {
		maxitem++;
		firstitem++;
	}
}
if (input_check_pressed("up") and selectedItem > 0) {
	selectedItem--;
	if (selectedItem < firstitem) {
		maxitem--;
		firstitem--;
	}
}
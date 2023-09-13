// Feather disable GM1041
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
				if (type == ShopType.Tabbed) {
				    updateTabItems();
				}
		        break;
		}	    
	}
    return;
}
else if (input_check_pressed("cancel") and !buyingItem) {
	optionConfirmed = false;
	return;
}
var maxvalue = 0;
switch (type) {
    case ShopType.Simple:
        switch (category) {
			case ShopOption.Buy:
				maxvalue = array_length(shopItemsBuy) ;
				break;
			case ShopOption.Sell:
				maxvalue = array_length(shopItemsSell) ;
				break;
		}
        break;
		
	case ShopType.Tabbed:
		maxvalue = array_length(tabItems);
		break;
    default:
        // code here
        break;
}

var _vpressed = - input_check_pressed("up") + input_check_pressed("down");
selectedItem += _vpressed;
if (selectedItem < 0) {
	selectedItem = 0;
}
if (selectedItem >= maxvalue - 1) {
	selectedItem = maxvalue - 1;
}
if (selectedItem >= maxitem and maxitem < maxvalue) {
	maxitem++;
	firstitem++;
}
if (selectedItem < firstitem) {
	maxitem--;
	firstitem--;
}

if (type == ShopType.Tabbed and optionConfirmed and !buyingItem) {
    var _pressed = - input_check_pressed("left") + input_check_pressed("right");
	selectedTab += _pressed;
	if (selectedTab < 0) {
	    selectedTab = 0;
	}
	if (selectedTab > array_length(shopTabs) - 1) {
	    selectedTab = array_length(shopTabs) - 1;
	}
	updateTabItems();
}

if (optionConfirmed and !haveSelectedItem and !buyingItem and input_check_pressed("accept")) {
	buyingItem = true;
	return;
}

if (buyingItem and input_check_pressed("accept")) {
	global.holocoins -= tabItems[selectedItem][$ "cost"];
	array_push(HouseInventory[tabItems[selectedItem][$ "category"]], tabItems[selectedItem]);
	buyingItem = false;
	return;
}

if (buyingItem and input_check_pressed("cancel")) {
	buyingItem = false;
	return;
}
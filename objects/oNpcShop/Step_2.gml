
if (!optionConfirmed) {
    return;
}
switch (type) {
    case ShopType.Simple:
        var maxvalue = 0;
		switch (category) {
		    case ShopOption.Buy:
		        maxvalue = array_length(shopItemsBuy);
		        break;
		    case ShopOption.Sell:
		        maxvalue = array_length(shopItemsSell);
		        break;
		    default:
		        // code here
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
        break;
    default:
        // code here
        break;
}

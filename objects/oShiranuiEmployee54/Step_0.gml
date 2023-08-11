if (distance_to_object(oPlayerWorld) < 10 and oGui.zKey and !instance_exists(oNpcShop)) {
	if (keyboard_check(vk_backspace)) {
	    instance_create_depth(x, y, depth, oNpcShop, {
			shopName : "Shiranui Construction Shop",
			shopItemsBuy : furniture,
			shopTabs : houseTabs,
			type : ShopType.Tabbed,
			lexiconIdentifier : "HouseItems"
		});
	}
	else {
	    instance_create_depth(x, y, depth, oNpcShop, {
			shopName : "Bloop's Fish Shop",
			shopItemsBuy,
			shopItemsSell,
			type : ShopType.Simple,
			lexiconIdentifier : "FishingRods"
		});
	}
}
if (distance_to_object(oPlayerWorld) < 10 and oGui.zKey and !instance_exists(oNpcShop)) {
    
}
if (distance_to_object(oPlayerWorld) < 10 and oGui.zKey and !instance_exists(oNpcShop)) {
	instance_create_depth(x, y, depth, oNpcShop, {
			shopName : "Shiranui Construction Shop",
			shopItemsBuy : furniture,
			shopTabs : houseTabs,
			type : ShopType.Tabbed,
			lexiconIdentifier : "HouseItems"
		});
}
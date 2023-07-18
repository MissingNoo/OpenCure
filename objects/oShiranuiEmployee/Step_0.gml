if (distance_to_object(oPlayerWorld) < 10 and oGui.zKey and !instance_exists(oNpcShop)) {
    instance_create_depth(x, y, depth, oNpcShop, {
		shopItemsBuy,
		shopItemsSell
	});
}
if (distance_to_object(oPlayerWorld) < 10 and oGui.xKey and !instance_exists(oNpcShop)) {
    oHouseManager.editHouse = true;
}
if (distance_to_object(oPlayerWorld) < 10 and oGui.zKey and !instance_exists(oNpcShop)) {
	show_debug_message("shop opened");
    instance_create_depth(x, y, depth, oNpcShop, {
		shopItemsBuy,
		shopItemsSell
	});
}
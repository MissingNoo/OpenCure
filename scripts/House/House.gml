#macro HouseInventory global.houseinventory
#macro HouseItems global.houseitems
HouseInventory = [];
HouseItems = [];
enum HouseCategory {
	Bedroom,
	LivingRoom,
	Kitchen,
	Washroom,
	Decorations,
	Structure,
	Wall,
	Interior,
	LENGTH
}

enum HouseItemId{ 
	null,
	Bookshelf,
	TV,
	Wall
}
HouseItems[HouseItemId.null] = {
	itemId : HouseItemId.null,
	sprite : blank,
	thumb : blank,
}
HouseItems[HouseItemId.Bookshelf] = {
	itemId : HouseItemId.Bookshelf,
	sprite : sBookShelf,
	thumb : sBook,
}
HouseItems[HouseItemId.TV] = {
	itemId : HouseItemId.TV,
	sprite : sTV,
	thumb : sTV,
}
HouseItems[HouseItemId.Wall] = {
	itemId : HouseItemId.Wall,
	sprite : sWall,
	thumb : sWallThumb,
}
for (var i = 0; i < HouseCategory.LENGTH; ++i) {
    HouseInventory[i] = [HouseItems[HouseItemId.null]];
}
HouseInventory[HouseCategory.Bedroom][0] = HouseItems[HouseItemId.Bookshelf];

HouseInventory[HouseCategory.LivingRoom][0] = HouseItems[HouseItemId.TV];

HouseInventory[HouseCategory.Wall][0] = HouseItems[HouseItemId.Wall];
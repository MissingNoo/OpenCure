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
	name : "null",
	category : HouseCategory.Bedroom,
	itemId : HouseItemId.null,
	sprite : blank,
	thumb : blank,
	cost : 1000
}
HouseItems[HouseItemId.Bookshelf] = {
	name : "Bookshelf",
	category : HouseCategory.Bedroom,
	itemId : HouseItemId.Bookshelf,
	sprite : sBookShelf,
	thumb : sBook,
	cost : 1000
}
HouseItems[HouseItemId.TV] = {
	name : "TV",
	category : HouseCategory.LivingRoom,
	itemId : HouseItemId.TV,
	sprite : sTV,
	thumb : sTV,
	cost : 10000
}
HouseItems[HouseItemId.Wall] = {
	name : "Wall",
	category : HouseCategory.Wall,
	itemId : HouseItemId.Wall,
	sprite : sWall,
	thumb : sWallThumb,
	cost : 100
}
for (var i = 0; i < HouseCategory.LENGTH; ++i) {
    HouseInventory[i] = [HouseItems[HouseItemId.null]];
}
//HouseInventory[HouseCategory.Bedroom][0] = HouseItems[HouseItemId.Bookshelf];

//HouseInventory[HouseCategory.Wall][0] = HouseItems[HouseItemId.Wall];
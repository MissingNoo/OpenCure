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
	Null,
	Bookshelf,
	TV,
	Wall
}
HouseItems[HouseItemId.Null] = {
	name : "null",
	category : HouseCategory.Bedroom,
	itemId : HouseItemId.Null,
	sprite : sBlank,
	thumb : sBlank,
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
    HouseInventory[i] = [HouseItems[HouseItemId.Null]];
	//HouseInventory[i][0] = [HouseItems[HouseItemId.Null]];
}
//HouseInventory[HouseCategory.Bedroom][0] = HouseItems[HouseItemId.Bookshelf];

//HouseInventory[HouseCategory.Wall][0] = HouseItems[HouseItemId.Wall];
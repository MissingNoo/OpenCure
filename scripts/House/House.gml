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
	WoodenBedBlue,
	WoodenBedRed,
	WoodenBedGreen,
	WoodenBedYellow,
	MarbleBed,
	Fuuton,
	Bookshelf,
	TV,
	Wall,
	WoodFloorA,
	WoodFloorB,
	WoodWallA,
	WoodWallB,
	Last,
}

enum HouseInteriorType {
	Floor,
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
HouseItems[HouseItemId.WoodenBedBlue] = {
	name : "Wooden Bed (Blue)",
	category : HouseCategory.Bedroom,
	itemId : HouseItemId.WoodenBedBlue,
	sprite : sWBedBlue,
	thumb : sWBedBlueIcon,
	cost : 1000
}
HouseItems[HouseItemId.WoodenBedRed] = {
	name : "Wooden Bed (Red)",
	category : HouseCategory.Bedroom,
	itemId : HouseItemId.WoodenBedRed,
	sprite : sWBedRed,
	thumb : sWBedRedIcon,
	cost : 1000
}
HouseItems[HouseItemId.WoodenBedGreen] = {
	name : "Wooden Bed (Green)",
	category : HouseCategory.Bedroom,
	itemId : HouseItemId.WoodenBedGreen,
	sprite : sWBedGreen,
	thumb : sWBedGreenIcon,
	cost : 1000
}
HouseItems[HouseItemId.WoodenBedYellow] = {
	name : "Wooden Bed (Yellow)",
	category : HouseCategory.Bedroom,
	itemId : HouseItemId.WoodenBedYellow,
	sprite : sWBedYellow,
	thumb : sWBedYellowIcon,
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
HouseItems[HouseItemId.WoodFloorA] = {
	name : "Wooden Floor A",
	type : HouseInteriorType.Floor,
	category : HouseCategory.Interior,
	itemId : HouseItemId.WoodFloorA,
	sprite : sHoloHouseFloorWoodA,
	thumb : sHoloHouseFloorWoodAIcon,
	cost : 0
}
HouseItems[HouseItemId.WoodFloorB] = {
	name : "Wooden Floor B",
	type : HouseInteriorType.Floor,
	category : HouseCategory.Interior,
	itemId : HouseItemId.WoodFloorB,
	sprite : sHoloHouseFloorWoodB,
	thumb : sHoloHouseFloorWoodBIcon,
	cost : 100
}
HouseItems[HouseItemId.WoodWallA] = {
	name : "Wooden Wall A",
	type : HouseInteriorType.Wall,
	category : HouseCategory.Interior,
	itemId : HouseItemId.WoodWallA,
	sprite : sHoloHouseWallWoodA,
	thumb : sHoloHouseWallWoodAIcon,
	cost : 0
}
HouseItems[HouseItemId.WoodWallB] = {
	name : "Wooden Wall B",
	type : HouseInteriorType.Wall,
	category : HouseCategory.Interior,
	itemId : HouseItemId.WoodWallB,
	sprite : sHoloHouseWallWoodB,
	thumb : sHoloHouseWallWoodBIcon,
	cost : 100
}
for (var i = 0; i < HouseCategory.LENGTH; ++i) {
    HouseInventory[i] = [HouseItems[HouseItemId.Null]];
	//HouseInventory[i][0] = [HouseItems[HouseItemId.Null]];
}
//HouseInventory[HouseCategory.Bedroom][0] = HouseItems[HouseItemId.Bookshelf];

//HouseInventory[HouseCategory.Wall][0] = HouseItems[HouseItemId.Wall];
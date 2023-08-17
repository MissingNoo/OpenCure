shopItemsBuy = [
{
	name : "Old Rod",
	sprite : sAsaCocoThumb,
	cost : 1000
},
{
	name : "Dad's Rod",
	sprite : sBounceBallThumb,
	cost : 1000
},
{
	name : "Blacksmith-Made Rod",
	sprite : sKnightlyMilk,
	cost : 1000
},
{
	name : "Atlantean Rod",
	sprite : sBreastplate,
	cost : 1000
},
{
	name : "Brazillian Rod",
	sprite : sBLBookThumb,
	cost : 1000
},
]
shopItemsSell = [
{
	name : "Dad's Rod",
	sprite : sBounceBallThumb,
	cost : 1000
},
{
	name : "Blacksmith-Made Rod",
	sprite : sKnightlyMilk,
	cost : 1000
},
//{
//	name : "Atlantean Rod",
//	sprite : sBreastplate,
//	cost : 1000
//},
//{
//	name : "Brazillian Rod",
//	sprite : sBLBookThumb,
//	cost : 1000
//},
]
houseTabs = [
{
	category : HouseCategory.Bedroom,
},
{
	category : HouseCategory.LivingRoom,
},
{
	category : HouseCategory.Wall,
},
{
	category : HouseCategory.Interior,
},
];
furniture = [];
for (var i = 1; i < HouseItemId.Last; ++i) {
    array_push(furniture, HouseItems[i]);
}
//furniture = [HouseItems[HouseItemId.Bookshelf], HouseItems[HouseItemId.Bookshelf], HouseItems[HouseItemId.TV], HouseItems[HouseItemId.Wall], HouseItems[HouseItemId.WoodFloorA], HouseItems[HouseItemId.WoodFloorB], HouseItems[HouseItemId.WoodWallA], HouseItems[HouseItemId.WoodWallB]];
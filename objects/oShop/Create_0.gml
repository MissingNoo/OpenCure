/// @description Insert description here
achansubimage = 0;
holocoinsubimage = 0;
depth = oGui.depth + 1;
selected = 0;
interact = false;
interactSelected = 0;
selectedThing = pointer_null;
hoffset = 0;
voffset = 0;
startx = GW/2;
starty = GH/2;
maxx = GW/1.5;
aChanX = GW/2;
aChanY = GH/2;
onMenu = true;
menuOptions  = ["Character Gacha", "Buy Upgrades", "Armory", "Quit"]
optionSelected = 0;

enum PrizeType {
	Character
}

gachaInteract = false;
gachaInteractButtons = ["Buy", "Redeem"];
gachaDebut = false;
gachaPrize = false;
isOutfit = false;
outfitPrizeNumber = 0;
gotPrize = {};
prizeIdleAnimation = [0, 0];
prizeIdleSpeed = 0;
gachaButton = 0;
selectedGacha = 0;
gachas = [
	{
		name : "MYTH",
		sprite : sGachaMyth,
		cost : 1000,
		prizes : [
			{
				type : PrizeType.Character,
				character : Characters.Amelia
			},
			//{
			//	type : PrizeType.Character,
			//	character : Characters.Gura
			//},
			//{
			//	type : PrizeType.Character,
			//	character : Characters.Ina
			//}
		]
	}
]
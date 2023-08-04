/// @description Insert description here
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
			{
				type : PrizeType.Character,
				character : Characters.Gura
			},
			{
				type : PrizeType.Character,
				character : Characters.Ina
			}
		]
	}
]
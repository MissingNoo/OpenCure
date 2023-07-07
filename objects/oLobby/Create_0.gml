clicked = false;
joinedRoom = false;
roomname = "";
rooms = [];
sendMessage({ command : Network.ListRooms });
selectedroom = 0;
sprites=0;
ishost = 0;
players = "";
creatingroom = false;
creatingselected = 0;
creatingselectedyesno = 1;
password = "";
typepassword = false;
passwordselected = 0;
passwordselectedyesno = 1;
global.roomname = "";
createx1 = GW/54.64;
createy1 = GH/128;
createx2 = GW/11.68;	
createy2 = GH/20.10;
joinx1 = GW/11.02;
joinx2 = GW/6.80;
reloadx1 = GW/6.57;
reloadx2 = GW/4.76;

#region options
shareXP = false;
shareItems = false;
shareWeapons = false;
pauseGame = false;
shareAnvils = false;
shareStamps = false;
shareBoxDrops = false;
allowHalu = false;
allowGrank = false;
scaleMobs = false;
options = [
["Share XP", "shareXP"],
//["Share Items", "shareItems"],
//["Share Weapons", "shareWeapons"],
//["Share Anvils", "shareAnvils"],
//["Share Stamps", "shareStamps"],
//["Share Box drops", "shareBoxDrops"],
//["Pause Game", "pauseGame"],
//["Allow Halu", "allowHalu"],
//["Allow Grank", "allowGrank"],
//["Scale Monsters", "scaleMobs"],
]
#endregion

chattext = "";
chatmessages = [];
chatbackground = [GW/170.75, GH/1.48, GW/1.005, GH/1.01];
chat = [GW/91.07, GH/1.06, GW/1.01, GH/1.02];
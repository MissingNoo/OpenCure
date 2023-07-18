editHouse = false;
placingObject = false;
objectSprite = 0;
objectId = 0;
grid = 16;
selectedMenu = 0;
selectedMenuConfirm = false;
selectedItem = 0;
houseOptions = [
"Bedroom",
"Living Room",
"Kitchen",
"Washroom",
"Decorations",
"Structure",
"Wall",
"Interior",
]
enum HouseOptions {

}
#macro HOUSE (working_directory + "Save_House.bin")
function Save_House() { 
	var Data = {};		
	for (var i = 0; i < instance_number(oHouseItem); ++i) {
		var inst = instance_find(oHouseItem, i);
		Data[$ i] = {
			itemId : inst.itemId,
			x : inst.x,
			y : inst.y,
			}
	}
	var Map = json_decode(json_stringify(Data));
	ds_map_secure_save(Map, HOUSE);
	ds_map_destroy(Map);
};
    
function Load_House() {
if (file_exists(HOUSE)) {
	var Map = ds_map_secure_load(HOUSE);
	var Json = json_parse( json_encode(Map) );
	var _total = array_length(struct_get_names(Json));
	for (var i = 0; i < _total; ++i) {
		var _x = Json[$ i][$"x"];
		var _y = Json[$ i][$"y"];
		var _id = Json[$ i][$"itemId"];
		var _spr = HouseItems[_id][$"sprite"];
		instance_create_depth(_x, _y, depth, oHouseItem, {itemId : _id, sprite_index : _spr});
	}
	ds_map_destroy(Map);} 
};
Load_House();
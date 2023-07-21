// Feather disable GM2017
global.Data = [
    "holocoins","musicVolume","soundVolume", "damageNumbers", "shopUpgradesJSON", "showhpui", "gamePad", "houseinventory"
    ];

#macro DATA (working_directory + "Save_Data.bin")
#macro Reserve (working_directory + "Reserve_Data.bin")

function Save_Data_Structs () { 
	global.shopUpgradesJSON = json_stringify(global.shopUpgrades);
	var Data = {};
        for(var i = 0; i < array_length(global.Data); i++){
            var Key = global.Data[i];
                if(variable_global_exists(Key)){
                    Data[$ Key] = variable_global_get(Key);}}
                var Map = json_decode(json_stringify(Data));
                ds_map_secure_save(Map, DATA);
                ds_map_destroy(Map);
            };
    
function Load_Data_Structs () {
    if (file_exists(DATA)) {
        var Map = ds_map_secure_load(DATA);
        var Json = json_parse( json_encode(Map) );
            for(var i = 0; i < array_length(global.Data); i++){
                var Key = global.Data[i];
                if(variable_global_exists(Key)){
                    variable_global_set(Key, Json[$ Key] );}}
          ds_map_destroy(Map);} 
		  if (is_string(global.shopUpgradesJSON)) {
		      global.shopUpgrades = json_parse(global.shopUpgradesJSON);
		  }  
     };
    
function Save_Reserve () { var Data = {};
        for(var i = 0; i < array_length(global.Data); i++){
            var Key = global.Data[i];
                if(variable_global_exists(Key)){
                    Data[$ Key] = variable_global_get(Key);}}
                var Map = json_decode(json_stringify(Data));
                ds_map_secure_save(Map, Reserve);
                ds_map_destroy(Map);
            };
    
function Load_Reserve () {
    if (file_exists(Reserve)) {
        var Map = ds_map_secure_load(Reserve);
        var Json = json_parse( json_encode(Map) );
            for(var i = 0; i < array_length(global.Data); i++){
                var Key = global.Data[i];
                if(variable_global_exists(Key)){
                    variable_global_set(Key, Json[$ Key] );}}
          } 
		  // Feather disable once GM2043
		  ds_map_destroy(Map);
     };



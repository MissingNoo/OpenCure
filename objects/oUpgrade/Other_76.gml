if event_data[? "event_type"] == "sprite event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
        case "summonPool":
			if (!summoned and upg[$"id"] == Weapons.MiCometMeteor) {
			    summoned = true;
				instance_create_depth(x, y - (sprite_get_height(WEAPONS_LIST[Weapons.MiCometPool][1][$"sprite"]) * WEAPONS_LIST[Weapons.MiCometPool][1][$"size"]) / 2, depth, oUpgrade,{
					upg : WEAPONS_LIST[Weapons.MiCometPool][1],
					speed : WEAPONS_LIST[Weapons.MiCometPool][1][$"speed"],
					hits : WEAPONS_LIST[Weapons.MiCometPool][1][$"hits"],
					shoots : WEAPONS_LIST[Weapons.MiCometPool][1][$"shoots"],
					sprite_index : WEAPONS_LIST[Weapons.MiCometPool][1][$"sprite"],
					level : WEAPONS_LIST[Weapons.MiCometPool][1][$"level"],
					mindmg: WEAPONS_LIST[Weapons.MiCometPool][1][$"mindmg"],
					maxdmg: WEAPONS_LIST[Weapons.MiCometPool][1][$"maxdmg"]
				});
			}            
        break;
    }
}
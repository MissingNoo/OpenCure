#macro SPECIAL_LIST global.specialList
global.specialList=[0];
global.specialBonuses[0] = 0;

#region Item Functions

	function createSpecial(_id, _name, _sprite, _cooldown, _desc, _character, _sequence)
	{
		SPECIAL_LIST[_id]={};
		var item = SPECIAL_LIST[_id];
		variable_struct_set(item, "id", _id);
		variable_struct_set(item, "name", _name);
		variable_struct_set(item, "thumb", _sprite);
		variable_struct_set(item, "cooldown", _cooldown);
		variable_struct_set(item, "desc", _desc);
		variable_struct_set(item, "characterid", _character);
		variable_struct_set(item, "seq", _sequence);
		ds_map_add(global.characters[_character], "special", _id);
	}

	enum SpecialIds
	{
		Amelia, //TODO: speed bonus for weapon
		Gura,
		Ina,
		Walmart_Form
	}
#endregion
function populateSpecials(){
	createSpecial(SpecialIds.Amelia, "Slow Time", sAmeSpecial, 60, "Slows all target movement by 80% while Pistol Shot shoots 50% faster for 15 seconds.", Characters.Amelia, seq_SlowTIme);
	createSpecial(SpecialIds.Gura, "Shark Call", sGuraSpecialIcon, 45, "Summon a shark that deals 500% damage to all targets around. Gura turns red, increasing ATK by 50% and SPD by 25% for 15 seconds.", Characters.Gura, seq_GuraShark);
	createSpecial(SpecialIds.Ina, "Tako Spin", sInaSpecialIcon, 60, "Summons 8 tentacles around Ina, then spins rapidly around her, dealing 150% damage and knockback to all targets.", Characters.Ina, seq_InaSpin);
	#region Modded
	#region Pipkin Pippa
	createSpecial(SpecialIds.Walmart_Form, "Walmart Form", spr_Pipmod_Pippa_Icon_Special, 60, "Summons 8 tentacles around Ina, then spins rapidly around her, dealing 150% damage and knockback to all targets.", Characters.Pippa, pointer_null);
	#endregion
	#endregion
	
}

function useSpecial(_special)
{
	skilltimer = 0;
	global.lastsequence = layer_sequence_create("Specials", x, y, _special.seq);
	switch (_special.id) {
	    case SpecialIds.Amelia:
			if (!instance_exists(oEnemy)) { break; }
	        with (oEnemy) {
			    array_push(debuffs, copyStruct(Buffs[BuffNames.Slowness]));
				//show_message(Buffs[BuffNames.Slowness]);
			}
	        break;
	        
	    case SpecialIds.Gura:
	    	redgura = true;
	    	break;
	    default:
	        // code here
	        break;
	}
}
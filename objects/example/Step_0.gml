// Feather disable all
///@desc example - Step
depth = oGui.depth - 1;
if (keyboard_check_pressed(vk_f2)){
  imguigml_deactivate();
}
if (keyboard_check_pressed(vk_f1)) {
	imguigml_activate();
	ShowTestWindow = true;
	if (!instance_exists(imgui)) {
	  instance_create_depth(0, 0, depth-10, imgui);
		//imguigml_add_font_from_ttf("pixel04b24.ttf", 12.0);	
	}
}	
 
if (imguigml_ready()) {
	var size = [ 0, 0 ];
	var pos = [ 0, 0 ];
	if (ShowTestWindow) {
		imguigml_set_next_window_size(540, 350, EImGui_Cond.Always);
		
		var ret = imguigml_begin("OpenCure", ShowTestWindow);
		ShowTestWindow = ret[1]; 
		if (ret[0] && ret[1]) {
			imguigml_text(string("FPS: {0}/{1}", fps, fps_real));
			var _header = imguigml_collapsing_header("Values");
			if(_header[0]){
				imguigml_text(string("a: {0}, b: {1}, c: {2}, d: {3}, e: {4}, f: {5}, g: {6}, h: {7}", oGui.a, oGui.b, oGui.c, oGui.d, oGui.e, oGui.f, oGui.g, oGui.h));
				imguigml_text("e/f");
				var _input = imguigml_input_float4();
				if(_input[1]){ oGui.e = _input[1]; }	
				if(_input[2]){ oGui.f = _input[2]; }	
				if(_input[3]){ oGui.g = _input[3]; }	
				if(_input[4]){ oGui.h = _input[4]; }	
			}
			
			if (instance_exists(oPlayer)) {
				var _header = imguigml_collapsing_header("Player and Stage");
				if(_header[0]){
					//imguigml_begin_child("Player", 0, 170, true);{
						var _button = imguigml_button("Level up");
						if (_button) { global.xp = oPlayer.neededxp; }
						imguigml_same_line();
						_button = imguigml_button("Skill cooldown");
						if (_button) { oPlayer.skilltimer = oPlayer.specialcooldown; }
						imguigml_same_line();
						_button = imguigml_button("Spawn Anvil");
						if (_button) { instance_create_depth(oPlayer.x, oPlayer.y + 50, oPlayer.depth, oAnvil); }
						imguigml_same_line();
						_button = imguigml_button("Spawn Food");
						if (_button) { instance_create_depth(oPlayer.x, oPlayer.y + 50, oPlayer.depth, oBurguer); }
						imguigml_same_line();
						_button = imguigml_button("Test Buff");
						if (_button) {
							Buffs[BuffNames.testbuff][$"count"] += 1;
							Buffs[BuffNames.testbuff][$"cooldown"] = Buffs[BuffNames.testbuff][$"baseCooldown"];
							Buffs[BuffNames.testbuff][$"enabled"] = true;
						}
						imguigml_same_line();
						if (global.upgrade) {
						    _button = imguigml_button("Rerrol");
							if (_button) { randomUpgrades(); }
							imguigml_same_line();
						}
						var _input = imguigml_checkbox("Immortal", oPlayer.immortal);
						if(_input[0]) { oPlayer.immortal = _input[1];}
						imguigml_begin_child("Upgrades", 230, 60, true);{
							imguigml_text("Weapons");							
							for (var i = 0; i < array_length(UPGRADES); ++i) {
								var _spr = UPGRADES[i][$"thumb"];
								var _w = 21, _h = 21;
								var _button = imguigml_sprite_button(_spr, 0, _w, _h);
								if (_button) { 
									changeUpgradeWindow = !changeUpgradeWindow;
									changeUpgradeNum = i;									
								}
								imguigml_same_line();
							}
						}imguigml_end_child();						
						imguigml_same_line();
						imguigml_begin_child("Items", 230, 60, true);{
							imguigml_text("Items");
							var _spr, _w, _h, _button;
							for (var i = 0; i < array_length(playerItems); ++i) {
								_spr = playerItems[i][$"thumb"];
								_w = 21;
								_h = 21;
								_button = imguigml_sprite_button(_spr, 0, _w, _h);
								if (_button) { 
									changeItemWindow = !changeItemWindow;
									changeItemNum = i;
									}
								imguigml_same_line();
							}
						}imguigml_end_child();
				}			    
			}
			if (instance_exists(oPlayer)) {
				var _header = imguigml_collapsing_header("Enemy Options");
				if(_header[0]){	
					var _input = imguigml_checkbox("Spawn Enemies", global.spawnEnemies);
					if(_input[0]) { global.spawnEnemies = _input[1];}
					imguigml_same_line();
					_input = imguigml_checkbox("Spawn Events", oEvents.enable);
					if(_input[0]) { oEvents.enable = _input[1];}
					if (imguigml_button("Clear enemies")) { with (oEnemy) { instance_destroy(); } }imguigml_same_line();
					if (imguigml_button("Clear XP")) { with (oXP) { instance_destroy(); } }
					if (imguigml_button("1 Minute")) { Minutes += 1; }imguigml_same_line();
					if (imguigml_button("10 Seconds")) { Seconds += 10; }
					if (imguigml_button("Horde")) { 
						spawnEvent(Enemies.KFPEmployee,Patterns.Horde, 25, "-", 3, "-", "-", 100);
					}imguigml_same_line();
					if (imguigml_button("Stampede")) { 
						spawnEvent(Enemies.DeadBeatLV3,Patterns.Stampede, 500, "-", 2, 8, 20, 10);
					}imguigml_same_line();
					if (imguigml_button("Circle")) { 
						spawnEvent(Enemies.DeadBeatLV3,Patterns.Ring, "-", "-", "-", "-", 22, 27, 400);
					}
				}
			}
      
			
			//imguigml_separator();
			//var _expand_array = false;
			
			//var _colour = imguigml_color_convert_u32_to_float4(imguigml_color_convert_gml_to_u32(Colour1,Alpha1));
			//var _input = imguigml_color_edit4("Colour", _colour[0], _colour[1], _colour[2],_colour[3]);  
			
			//if(_input[0]){
			//	var _colour;
			//	if(_expand_array){
			//		_colour = imguigml_color_convert_u32_to_gml(imguigml_color_convert_float4_to_u32(_input[1], _input[2], _input[3], _input[4]));
			//	}else{
			//		_input = [_input[1], _input[2], _input[3], _input[4]];
			//		_colour = imguigml_color_convert_u32_to_gml(imguigml_color_convert_float4_to_u32(_input));
			//	}
			//	Colour1 = _colour[0];
			//	Alpha1  = _colour[1];
			//}
			
			//imguigml_separator();
		  //imguigml_begin_child("Tests", 0, 170, true); 
			//{
				//if (imguigml_button("Collapse Test") && !instance_exists(test_collapsing_header)) {
				//	instance_create_depth(0,0,0,test_collapsing_header);
				//}
			  
				//imguigml_same_line();
				//if (imguigml_button("Drawlist Test") && !instance_exists(test_drawlist)) {
				//	instance_create_depth(0,0,0, test_drawlist);
				//}
			
				//imguigml_same_line();
				//if (imguigml_button("Z Buffer Test") && !instance_exists(test_depth)) {
				//	instance_create_depth(0,0,0, test_depth);
				//}
			
				//imguigml_same_line();
				//if (imguigml_button("Color Test") && !instance_exists(test_color_inputs)) {
				//	instance_create_depth(0,0,0, test_color_inputs);
				//}
			
				//imguigml_same_line();
				//if (imguigml_button("Display Test") && !instance_exists(test_display)) {
				//	instance_create_depth(0,0,0, test_display);
				//}
			
				//imguigml_same_line();
			
				
				
				//imguigml_same_line();
			  //if (imguigml_button("Text Editor")) {
			  //  if (TextEditor == undefined) {
			  //    TextEditor = imguigml_texteditor_create();
			  //    imguigml_texteditor_set_readonly(TextEditor, false);
			  //  } else
			  //    TextEditor = imguigml_texteditor_destroy(TextEditor);
			  //}
				
				//imguigml_same_line()
				//if (imguigml_button("ImGui Demo") || imguigml_mem("ImguiDemo", false)) {
				//	ret = imguigml_show_demo_window(true);
				//	imguigml_memset("ImguiDemo", ret[1]);
				//}
				
				//imguigml_same_line();
				
				//if (imguigml_button("ComboBox") && !instance_exists(test_combo)) {
				//	instance_create_depth(0, 0, 0, test_combo);
				//}
				      
				//imguigml_push_item_width(32);
			  //imguigml_text("Max Actors: "); 
			  //imguigml_pop_item_width();
			  //imguigml_same_line();
			  //ret = imguigml_slider_int("##hidelabel",Actors,0,2000);
			  //if (ret[0]) Actors = ret[1];

			  //imguigml_push_item_width(32);
			  //imguigml_text("Completion: ");
			  //imguigml_pop_item_width();  
			  //imguigml_same_line(); 
			  //ret = imguigml_input_text("##hidelabel2", Completion_string, 64, EImGui_InputTextFlags.CallbackCompletion|EImGui_InputTextFlags.EnterReturnsTrue, example_input_completion_callback);
			  //Completion_string = ret[1];

			  //imguigml_push_item_width(32);
			  //imguigml_text("Filter: ");
			  //imguigml_pop_item_width();  
			  //imguigml_same_line(); 
			  //ret = imguigml_input_text("##hidelabel3", Filter_string, 64, EImGui_InputTextFlags.CallbackCharFilter, example_input_char_filter_callback);
			  //if (ret[0]) Filter_string = ret[1];

			  //imguigml_push_item_width(32);
			  //imguigml_text("History: ");
			  //imguigml_pop_item_width();  
			  //imguigml_same_line(); 
			  //ret = imguigml_input_text("##hidelabel4", History_string, 64, EImGui_InputTextFlags.CallbackHistory, example_input_history_callback);
			  //if (ret[0]) History_string = ret[1];

			  //imguigml_push_item_width(32);
			  //imguigml_text("Always: ");
			  //imguigml_pop_item_width();  
			  //imguigml_same_line(); 
			  //ret = imguigml_input_text("##hidelabel5", Always_string, 64, EImGui_InputTextFlags.CallbackAlways, example_input_always_callback);
			  //if (ret[0]) Always_string = ret[1];
			  //imguigml_same_line(); 
			  //imguigml_text(Always_out);
           
			  //imguigml_push_item_width(32);
			  //imguigml_text("Integer: ");
			  //imguigml_pop_item_width();  
			  //imguigml_same_line(); 
			  //ret = imguigml_input_int("##hidelabel6", Input_num, 1, 10);
			  //if (ret[0]) Input_num = ret[1];
		    
      
			//} imguigml_end_child(); 

		//	imguigml_separator();
      //imguigml_slider_float3("Some floats!", 0.2, 0.4, 0.6, 0.0, 1.0);
      //imguigml_plot_histogram("Histogram", [ 0.1, 2.0, 4.5, 2.5, 1.0, 2.0 ]);    
		} 
		
		size = imguigml_get_window_size();
		pos  = imguigml_get_window_pos();
	  imguigml_end();
	} 

  if (changeUpgradeWindow) {
	  imguigml_set_next_window_pos(pos[0] + size[0] + 5, pos[1], EImGui_Cond.Once);
	  var ret = imguigml_begin("Select weapon", changeUpgradeWindow);
	  changeUpgradeWindow = ret[1];
	  var _break = 0;
	  for (var i = 0;i < array_length(global.upgradesAvaliable); ++i ) {
		  var _spr = global.upgradesAvaliable[i][1][$"thumb"];
		  var _button = imguigml_sprite_button(_spr, 0, 21, 21);
		  if (_button) {
				  //show_message(string("test {0}", i));
				  UPGRADES[changeUpgradeNum] = global.upgradesAvaliable[i][imguigml_mem("uplevel", 1)];
				  changeUpgradeWindow = false;
			}
			if (_break < 5) {
				imguigml_same_line();
				_break++;
			}
			else{
				_break = 0;
			}
		}
		var _button = imguigml_sprite_button(sAnvil, 0, 21, 21);
		if (_button) {
		    UPGRADES[changeUpgradeNum] = global.null;
			changeUpgradeWindow = false;
		}
		imguigml_separator();
		var _level = imguigml_input_int("Level", imguigml_mem("uplevel", 1));
		if (_level[0]) {
		    imguigml_memset("uplevel", _level[1]);
		}
		var doggo_size = imguigml_get_window_size();
		imguigml_end();
		pos[1] += doggo_size[1] + 5;
  }
  
  if (changeItemWindow) {
	  imguigml_set_next_window_pos(pos[0] + size[0] + 5, pos[1], EImGui_Cond.Once);
	  var ret = imguigml_begin("Select weapon", changeItemWindow);
	  changeItemWindow= ret[1];
	  var _break = 0;
	  for (var i = 0;i < array_length(ItemList); ++i ) {
		  var _spr = ItemList[i][1][$"thumb"];
		  var _button = imguigml_sprite_button(_spr, 0, 21, 21);
		  if (_button) {
				  //show_message(string("test {0}", i));
				  playerItems[changeItemNum] = ItemList[i][imguigml_mem("uplevel", 1)];
				  changeItemWindow = false;
			}
			if (_break < 5) {
				imguigml_same_line();
				_break++;
			}
			else{
				_break = 0;
			}
		}
		var _button = imguigml_sprite_button(sAnvil, 0, 21, 21);
		if (_button) {
		    playerItems[changeItemNum] = global.nullitem;
			changeItemWindow = false;
		}
		imguigml_separator();
		var _level = imguigml_input_int("Level", imguigml_mem("uplevel", 1));
		if (_level[0]) {
		    imguigml_memset("uplevel", _level[1]);
		}
		var doggo_size = imguigml_get_window_size();
		imguigml_end();
		pos[1] += doggo_size[1] + 5;
  }
  
  //if (TextEditor != undefined) {	
  //  imguigml_set_next_window_pos(pos[0] + size[0] + 5, pos[1], EImGui_Cond.Once);
  //  var ret = imguigml_begin("Text Editor", true);
  //  if (ret[0] && ret[1])
  //    imguigml_texteditor_render(TextEditor, "Edit some text!", 500, 300); 
  //  else if (!ret[1])
  //    TextEditor = imguigml_texteditor_destroy(TextEditor);
  //  imguigml_end();
  //}
}
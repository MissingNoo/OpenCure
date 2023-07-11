///@desc imgui - create
gml_pragma("global", "global.__imguigml = noone;");
if (global.__imguigml != noone && instance_exists(global.__imguigml))
	instance_destroy(global.__imguigml);

global.__imguigml = id;
global.__imguigml_payloads = [ 
		[ ],
		[ ],	
		0,	
];
	
memory = ds_map_create();

rousr_callstack_init();
_extImguiGML_init();
__imguigml_init_debug();
__imguigml_init_rendering();
__imguigml_init_font();
__imguigml_init_input();
__imguigml_init_wrapper();

Display_mode = EImGui_DisplayMode.GUIAspect;
Display_view = 0;	
DrawGUI  = true;
NewFrame = false;
	
Override_scale = false;
Scale_x = 1;
Scale_y = 1;
_Display_scale_x = 1;
_Display_scale_y = 1;

Deferred_fonts = [];

Last_set_cursor = window_get_cursor();
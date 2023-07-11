///@desc imgui - Clean Up
var num_textures = array_length(Textures);
var i = 1;
repeat(num_textures - 1) {
	var tex = Textures[i++];
	if (tex[EImGuiGML_Texture.DeleteOnCleanUp])
	  sprite_delete(tex[EImGuiGML_Texture.TextureID]);
}
global.__imguigml = noone;

buffer_delete(Render_buffer[0]);
buffer_delete(Render_buffer[1]);
buffer_delete(Input_buffer);
buffer_delete(Wrapper_buffer);
buffer_delete(Debug_buffer);

vertex_format_delete(Imgui_vertex_fmt);
ds_map_destroy(memory);
rousr_callstack_clean_up();
_extImguiGML_texteditors_cleanup();
_extImguiGML_shutdown();
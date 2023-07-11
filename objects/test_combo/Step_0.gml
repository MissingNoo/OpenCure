///@desc test_combo step event
if (!imguigml_ready()) {
	return;
}

var _ret = imguigml_begin("Test Combo", true);
if (!_ret[0] || !_ret[1]) {
	if (!_ret[1]) {
		instance_destroy(id);
	}
	
	imguigml_end();
	return;
}

if (imguigml_begin_combo("combo", "selectable1")) {
 
	imguigml_selectable("selectable1", true); //this is an optional example, doesn't work with or without it
  imguigml_selectable("selectable2"); //this is an optional example, doesn't work with or without it
 
	imguigml_end_combo();
}
   
imguigml_end();
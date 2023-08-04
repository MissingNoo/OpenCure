for (var i = 0; i < array_length(options); ++i) {
	variable_global_set(options[i][1], variable_instance_get(self, options[i][1]));
}
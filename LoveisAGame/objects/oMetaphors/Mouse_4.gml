/// @description Mouse Click

//Create the Metaphor objects
if (oGameController.state == "playerTurn") {
	oGameController.state = "paused"
	for (i = 0; i < (array_length(global.metaphors)); i++) {
		box = instance_create_layer(x, 236 + (i * 140), "MetaphorInventory", oMetaphorObject)
		box.meta_id = global.metaphors[i]
		show_debug_message(box.meta_id)
	}
	
}

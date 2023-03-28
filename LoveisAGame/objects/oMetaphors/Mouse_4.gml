/// @description Mouse Click

//Create the Metaphor objects
if (oGameController.state == "playerTurn") {
	oGameController.state = "paused"
	for (i = 0; i < (array_length(global.metaphors)); i++) {
		box = instance_create_layer(x, 236 + (i * 140), "MetaphorInventory", oMetaphorObject)
		box.image_index = global.metaphors[i];
	}
	
}

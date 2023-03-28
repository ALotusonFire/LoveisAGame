/// @description Insert description here
// You can write your code in this editor

name = "";
name_color = c_white;
description = "";

//Metaphor data display
//((PLACE HOLDERS))
execute after 0.1 seconds
	switch (image_index) {
	
		case 0:
			name = "Love is a Flame";
			name_color = c_orange;
			description = "Burn your foes with fire damage.";
		break;
	
		case 1:
			name = "Love is a Disease";
			name_color = c_green;
			description = "Poison your foes with sickness.";
		break;
	}
done

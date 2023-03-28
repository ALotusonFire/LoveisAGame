/// @description Insert description here
// You can write your code in this editor
if (growing = true) && (oDarkness.image_index != 0) {
	if (oFrame.image_xscale < 1) {
		oFrame.image_xscale += 0.05 * room_speed/60
		oFrame.image_yscale += 0.05 * room_speed/60
	}
		
	if oFrame.image_xscale >= 1 
	growing = false;
}
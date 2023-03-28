//Get Player Input
keyA = keyboard_check(ord("A"));
keyD = keyboard_check(ord("D"));
keyW = keyboard_check(ord("W"));
keyS = keyboard_check(ord("S"));

inputDirection = point_direction(0,0,keyD - keyA, keyS - keyW);
inputMagnitude = (keyD - keyA != 0) or (keyS - keyW != 0);

script_execute(state);

if (Invincible == true){
	if (alarm[1] == -1) {
		alarm[1] = room_speed/12;
	}
}
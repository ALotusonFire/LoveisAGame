function stateFree(){ 
	//Movement
	xSpeed = lengthdir_x(inputMagnitude * walkSpeed, inputDirection);
	ySpeed = lengthdir_y(inputMagnitude * walkSpeed, inputDirection);

	playerCollision();
}

function statePaused(){ 
//Nothing
}
//Player collision
function playerCollision(){
	var _collision = false;
	
	//X Axis Tiles
	if (tilemap_get_at_pixel(collisionMap, x + xSpeed, y)){
		x -= x mod TILE_SIZE;	
		if (sign(xSpeed) == 1) x += TILE_SIZE - 1;
		xSpeed = 0;
		_collision = true;
	}
	
	//X Axis Move Commit
	x += xSpeed*room_speed/60;
	
	//Y Axis Tiles
	if (tilemap_get_at_pixel(collisionMap, x, y + ySpeed)){
		y -= y mod TILE_SIZE;	
		if (sign(ySpeed) == 1) y += TILE_SIZE - 1;
		ySpeed = 0;
		_collision = true;
	}
	
	//Y Axis Move Commit
	y += ySpeed*room_speed/60;
	
	return _collision;
}
if(_my_obj != noone and !instance_exists(_my_obj)) {
	// the object we are executing this for doesn't exist anymore
	// delete us too
	alarm[0] = -1;
	instance_destroy();
} else {
	alarm[0] = _interval;
	_passed_frames  += _interval;
	_passed_seconds += _interval / room_speed;
	_num_called += 1;
	_my_callback(self);
	if(_abort_at_frame != -1 && _passed_frames >= _abort_at_frame) {
		alarm[0] = -1;
	}
}
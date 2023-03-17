//Muffel asset written by Ribbyte (www.ribbyte.com)

// macros for "execute EVERY 3 seconds" etc.

// "execute" does nothing, it just looks good when reading code
#macro execute {}
// the "every" macro calls "execute_every_n" which expects an interval, a unit, and a callback function
#macro every execute_every_n(
// get the seconds the user wants and append the rest of the arguments
#macro seconds      , "seconds", function(alarm_object_ref) { global.tmp_alarm_object_ref = alarm_object_ref; 
// same for "second", but set it to 1 instead (ugly macro hack, -1 is converted to 1 later)
#macro second     -1, "second",  function(alarm_object_ref) { global.tmp_alarm_object_ref = alarm_object_ref; 
// same for frames
#macro frames       , "frames",  function(alarm_object_ref) { global.tmp_alarm_object_ref = alarm_object_ref; 
// and frame
#macro frame      -1, "frame",   function(alarm_object_ref) { global.tmp_alarm_object_ref = alarm_object_ref; 
// close the function definition and the opening 
// paranthesis of execute_every_n from the "every" macro above
#macro done })

//macros for e.g. "execute AFTER 10 seconds"
#macro after    execute_after_n(

// if you want to abort / disable the interval, call this one
#macro disable      { alarm_object_ref.alarm[0] = -1; instance_destroy(alarm_object_ref); exit; }

// if you want to access how many frames or seconds have passed
// (or how often your code was called), use these
#macro executed_frames  alarm_object_ref._passed_frames
#macro executed_seconds alarm_object_ref._passed_seconds
#macro executed_times   alarm_object_ref._num_called

execution_block_map = ds_map_create();

// todo:
// execute in 1 second <- geht nicht, da es "1 seconds" heißen müsste
function execute_every_n_frames(n, callback) {
	var inst = instance_create_layer(0, 0, layer, o_ArtificalAlarm);
	//(0, 0, 0, o_ArtificalAlarm);
	inst._my_callback = callback;
	inst._interval = n
	inst._my_obj = self
	inst.alarm[0] = inst._interval
	return inst
}

function execute_after_n_frames(n, callback) {
	inst = execute_every_n_frames(n, callback)
	inst._abort_at_frame = n;
}

function execute_every_frame(callback) {
	execute_every_n_frames(1, callback);
}

function execute_every_second(callback) {
	execute_every_n_frames(room_speed, callback);
}

function check_n(n, type) {
	if(type == "seconds" || type == "frames") {
		if(n < 0) {
			show_error("You are trying to execute a block of code in negative number of seconds " +
			           "or frames (" + string(n) + "), but that can't be right " +
					   "(this script is awesome, but I can't time travel, you know)", true);
		} else if(n == 0) {
			show_error("You are trying to execute a block of code in zero seconds or frames, " +
			           "which doesn't make sense", true);
		}
	} else if (type == "second" || type == "frame") {
		normal_n = n + 1
		if(n == -1 || n == 0) {
			n = 1;
			normal_n = 1
		} 
		if(normal_n != 1)
			show_error("You used '"+type+"' in singular but the value ("+string(normal_n)+") is not 1 (i.e. use '"+string(normal_n)+" "+type+"s' instead of '"+string(normal_n)+" "+type+"')", true);
	} else {
		show_error("Unknown type "+string(type), true);	
	}
	return n;
}

function alarm_execute_init(n, type) {
	n = check_n(n, type);
	
	var interval;
	if(type == "frames") {
		interval = n;
	} else if(type == "frame") {
		interval = n;
	} else if(type == "seconds") {
		interval = n * room_speed;
	} else if(type == "second") {
		interval = n * room_speed;	
	} else {
		show_error("Unknown type "+string(type), true);	
	}
	return interval;
}

function execute_every_n(n, type, callback) {
	var interval = alarm_execute_init(n, type);
	execute_every_n_frames(interval, callback);
}

function execute_after_n(n, type, callback) {
	var interval = alarm_execute_init(n, type);
	execute_after_n_frames(interval, callback);
}

function max_instances_reached(execution_name, max_instances) {
	var num_instances = 0;
	set_name(execution_name);
	for (i = 0; i < instance_number(o_ArtificalAlarm); i += 1) {
		var current_alarm = instance_find(o_ArtificalAlarm, i);
		if(current_alarm._execution_name == execution_name)
			num_instances += 1
	}
	return (num_instances > max_instances)
}

function set_name(execution_name) {
	global.tmp_alarm_object_ref._execution_name = execution_name;
}
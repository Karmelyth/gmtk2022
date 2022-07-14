// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cam_add_object(WEIGHT, INSTANCE){
	// Adds an instance to focus on, deleted if instance is deleted
	if (instance_exists(oCam)){
		
		// Delete existing cam point:
		if (variable_instance_exists(INSTANCE.id, "CAMPOINT") && is_struct(CAMPOINT)){
			
			cam_remove_object(INSTANCE.id);
		}
		
		// Create new cam point:
		INSTANCE.CAMPOINT = {
			
			wght : WEIGHT,
			inst : INSTANCE.id
		}
		ds_list_add(cam_points, CAMPOINT);
	}
}

function cam_remove_object(INSTANCE){
	for(var i = 0; i < ds_list_size(cam_points); i++){
		var _point = cam_points[| i];
		
		if (_point.inst == INSTANCE.id){
			delete cam_points[| i];
			ds_list_delete(cam_points, i);	
		}
	}
}

function cam_point_create(X, Y, WEIGHT){
	
	with instance_create_layer(X, Y, "Instances", oCamPoint){
	
		cam_add_object(WEIGHT, other.id);
	}
}

function view_shake(VALUE){
	
	if (instance_exists(oCam)){
		
		oCam.shake += abs(VALUE);
	}
}
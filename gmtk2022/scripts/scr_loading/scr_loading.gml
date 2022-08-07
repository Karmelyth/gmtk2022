// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrinit(){
	level_init_new();
}


//Will need replacing for HTML5 build. But can retain all the same information.
function level_init_new() {
	global.levelData = [];
	global.level_changed = [];
	global.level_num = 0;
	
	
	//Delete this once there are no levels remaining in the old format
	if directory_exists(working_directory + "Update/") {
		var file = file_find_first(working_directory + "Update/*.txt", 0),
			convert = [];
		while (file != "") {
			array_push(convert, file)
			file = file_find_next();
		}
		file_find_close()
		foreach(convert, function(filename) {
		
			var buffer = buffer_load(working_directory + "Update/" + filename),
				str = buffer_read(buffer, buffer_string);
				buffer_delete(buffer)
		
			var json = json_parse(str);
		
			//REFORMATTING CODE
			var keys = variable_struct_get_names(json),
				objects = [];
			for (var i = 0; i < array_length(keys); i ++) {
				array_push(objects, variable_struct_get(json, keys[i]))
			}
			json = {
				"objects" : objects,
				"info" : {
					"name" : string_replace(filename, ".txt", "")
				}
			}
		
			var f = file_text_open_write("Levels/" + filename);
			file_text_write_string(f, json_stringify(json));
			file_text_close(f)
		})
		
	}
	
		
	var file = file_find_first(working_directory + "Levels/*.txt", 0),
		files = [];
	while (file != "") {
		array_push(files, file)
		file = file_find_next();
	}
		
	file_find_close()

	foreach(files, function(filename) {
		
		var json = load_level_file(filename)

		array_push(global.levelData, json)
		array_push(global.level_changed, false)

	})
	
}

function load_level_file(filename) {
	var buffer = buffer_load(working_directory + "Levels/" + filename),
			str = buffer_read(buffer, buffer_string);
		buffer_delete(buffer)
		
	return json_parse(str);
}


function level_load(offset = 1) {
	var n = global.level_num + offset
	if offset > 0 {
		n = n mod array_length(global.levelData)
	}
	while n < 0 {
		n += array_length(global.levelData)
	}
	
	global.level_num = n
	level_load_ext(global.level_num);
}

function level_load_ext(levelnumber){
	if !range(levelnumber, 0, array_length(global.levelData) - 1) exit;
	
	global.level_num = levelnumber
	
	var level = global.levelData[levelnumber];
	
	foreach(level.objects, function(entry) {
		with instance_create_layer(entry.x, entry.y, "Instances", asset_get_index(entry.object_index)) {
			if instance_is(self, obj_cable) obj_layer = 1
			else obj_layer = 0
		}
	})
	
	with par_bricklike event_perform(ev_other, ev_user15);
}

function jsonify_board() {
	var objects = [];
	with par_bricklike {
		array_push(objects, jsonify_instance(self))
	}
	with obj_ball {
		array_push(objects, jsonify_instance(self))
	}
	return {
		"objects" : objects
	}
}

function jsonify_instance(inst) {
	return {
		"x" : inst.x,
		"y" : inst.y,
		"object_index" : object_get_name(inst.object_index)
	}
}

#macro current_level global.levelData[global.level_num]

function save_current_level() {
	update_current_level()
	var info = current_level.info;
	if info.name != "" {
		save_level(info.name)
	}
	else {
		prompt_input("Save Level As:", method(self, save_level))
	}
}

function save_level(name) {
	global.level_changed[global.level_num] = false
	if current_level.info.name = ""
		current_level.info.name = name
	var json = jsonify_board(),
		f = file_text_open_write("new levels/" + name + ".txt");
		
	json.info = {
		"name": name
	}
		
	file_text_write_string(f, json_stringify(json));
	file_text_close(f);
}

//Saves level to level data, not to file
function update_current_level() {
	current_level.objects = jsonify_board().objects
}


function add_new_level() {
	array_push(global.levelData, {"objects":[], "info": {"name":""}})
	array_push(global.level_changed, true)
}

function mark_level_changed(changed = true) {
	global.level_changed[global.level_num] = changed
}

function level_clear() {
	with(par_collectible) instance_destroy(self, false);
	with(par_bricklike) instance_destroy(self, false);
}

//function level_init_old(){
//	global.levelData = [];
//	global.level_num = 0;
//	// Make sure to use @' ', not " "!
	
//	// REAL ONES
//	/*Karm*/array_push(global.levelData,@'{ "4": { "x": 448.0, "y": 496.0, "object_index": "obj_switch_on_d" }, "121": { "x": 360.0, "y": 552.0, "object_index": "obj_bridge_u" }, "100": { "x": 288.0, "y": 504.0, "object_index": "obj_and_gate_left" }, "88": { "x": 312.0, "y": 488.0, "object_index": "obj_cable_h" }, "178": { "x": 336.0, "y": 512.0, "object_index": "obj_block_metal_v" }, "14": { "x": 248.0, "y": 568.0, "object_index": "obj_cable_ru" }, "136": { "x": 520.0, "y": 584.0, "object_index": "obj_cable_h" }, "152": { "x": 488.0, "y": 520.0, "object_index": "obj_cable_h" }, "129": { "x": 328.0, "y": 536.0, "object_index": "obj_cable_h" }, "116": { "x": 504.0, "y": 600.0, "object_index": "obj_cable_h" }, "80": { "x": 312.0, "y": 552.0, "object_index": "obj_cable_h" }, "79": { "x": 296.0, "y": 552.0, "object_index": "obj_cable_h" }, "146": { "x": 376.0, "y": 504.0, "object_index": "obj_cable_h" }, "89": { "x": 328.0, "y": 488.0, "object_index": "obj_cable_h" }, "3": { "x": 384.0, "y": 496.0, "object_index": "obj_switch_on_d" }, "180": { "x": 336.0, "y": 384.0, "object_index": "obj_block_metal_v" }, "115": { "x": 488.0, "y": 600.0, "object_index": "obj_cable_h" }, "162": { "x": 456.0, "y": 504.0, "object_index": "obj_cable_v" }, "130": { "x": 344.0, "y": 536.0, "object_index": "obj_cable_h" }, "184": { "x": 496.0, "y": 384.0, "object_index": "obj_block_metal_v" }, "109": { "x": 440.0, "y": 520.0, "object_index": "obj_cable_v" }, "181": { "x": 336.0, "y": 320.0, "object_index": "obj_block_metal_v" }, "62": { "x": 592.0, "y": 536.0, "object_index": "obj_and_gate_right" }, "76": { "x": 344.0, "y": 584.0, "object_index": "obj_cable_h" }, "5": { "x": 448.0, "y": 464.0, "object_index": "obj_switch_on_d" }, "59": { "x": 600.0, "y": 552.0, "object_index": "obj_cable_v" }, "9": { "x": 264.0, "y": 552.0, "object_index": "obj_cable_v" }, "49": { "x": 232.0, "y": 536.0, "object_index": "obj_cable_v" }, "138": { "x": 520.0, "y": 552.0, "object_index": "obj_cable_h" }, "169": { "x": 448.0, "y": 560.0, "object_index": "obj_switch_on_d" }, "98": { "x": 376.0, "y": 520.0, "object_index": "obj_cable_h" }, "68": { "x": 392.0, "y": 488.0, "object_index": "obj_cable_lu" }, "120": { "x": 568.0, "y": 600.0, "object_index": "obj_cable_h" }, "54": { "x": 584.0, "y": 568.0, "object_index": "obj_cable_lu" }, "137": { "x": 536.0, "y": 584.0, "object_index": "obj_cable_h" }, "128": { "x": 312.0, "y": 536.0, "object_index": "obj_cable_h" }, "144": { "x": 544.0, "y": 568.0, "object_index": "obj_and_gate_right" }, "90": { "x": 344.0, "y": 488.0, "object_index": "obj_cable_h" }, "157": { "x": 504.0, "y": 584.0, "object_index": "obj_cable_h" }, "173": { "x": 496.0, "y": 640.0, "object_index": "obj_block_metal_v" }, "159": { "x": 488.0, "y": 584.0, "object_index": "obj_cable_h" }, "125": { "x": 344.0, "y": 568.0, "object_index": "obj_cable_h" }, "188": { "x": 384.0, "y": 239.999969482421875, "object_index": "obj_block_metal" }, "52": { "x": 584.0, "y": 520.0, "object_index": "obj_cable_v" }, "87": { "x": 280.0, "y": 504.0, "object_index": "obj_cable_h" }, "85": { "x": 280.0, "y": 568.0, "object_index": "obj_cable_h" }, "99": { "x": 288.0, "y": 568.0, "object_index": "obj_and_gate_left" }, "11": { "x": 264.0, "y": 600.0, "object_index": "obj_cable_ru" }, "46": { "x": 232.0, "y": 488.0, "object_index": "obj_cable_v" }, "134": { "x": 328.0, "y": 504.0, "object_index": "obj_cable_h" }, "151": { "x": 472.0, "y": 520.0, "object_index": "obj_cable_h" }, "26": { "x": 376.0, "y": 600.0, "object_index": "obj_cable_h" }, "183": { "x": 496.0, "y": 448.0, "object_index": "obj_block_metal_v" }, "16": { "x": 248.0, "y": 520.0, "object_index": "obj_cable_v" }, "182": { "x": 496.0, "y": 512.0, "object_index": "obj_block_metal_v" }, "48": { "x": 232.0, "y": 520.0, "object_index": "obj_cable_v" }, "81": { "x": 328.0, "y": 552.0, "object_index": "obj_cable_h" }, "65": { "x": 392.0, "y": 584.0, "object_index": "obj_cable_lu" }, "28": { "x": 408.0, "y": 600.0, "object_index": "obj_cable_h" }, "73": { "x": 296.0, "y": 584.0, "object_index": "obj_cable_h" }, "133": { "x": 312.0, "y": 504.0, "object_index": "obj_cable_h" }, "8": { "x": 264.0, "y": 568.0, "object_index": "obj_bridge_d" }, "50": { "x": 584.0, "y": 600.0, "object_index": "obj_cable_h" }, "61": { "x": 600.0, "y": 600.0, "object_index": "obj_cable_lu" }, "156": { "x": 504.0, "y": 552.0, "object_index": "obj_cable_h" }, "21": { "x": 296.0, "y": 600.0, "object_index": "obj_cable_h" }, "164": { "x": 456.0, "y": 488.0, "object_index": "obj_cable_ru" }, "155": { "x": 488.0, "y": 552.0, "object_index": "obj_cable_h" }, "72": { "x": 392.0, "y": 568.0, "object_index": "obj_cable_v" }, "176": { "x": 336.0, "y": 640.0, "object_index": "obj_block_metal_v" }, "69": { "x": 392.0, "y": 472.0, "object_index": "obj_cable_v" }, "149": { "x": 488.0, "y": 488.0, "object_index": "obj_cable_h" }, "143": { "x": 536.0, "y": 488.0, "object_index": "obj_cable_h" }, "140": { "x": 520.0, "y": 520.0, "object_index": "obj_cable_h" }, "119": { "x": 552.0, "y": 600.0, "object_index": "obj_cable_h" }, "47": { "x": 232.0, "y": 504.0, "object_index": "obj_cable_v" }, "0": { "x": 448.0, "y": 288.0, "object_index": "obj_portal_5" }, "122": { "x": 312.0, "y": 520.0, "object_index": "obj_bridge_d" }, "1": { "x": 384.0, "y": 288.0, "object_index": "obj_portal" }, "95": { "x": 328.0, "y": 520.0, "object_index": "obj_cable_h" }, "127": { "x": 376.0, "y": 568.0, "object_index": "obj_cable_h" }, "66": { "x": 392.0, "y": 552.0, "object_index": "obj_cable_lu" }, "96": { "x": 344.0, "y": 520.0, "object_index": "obj_cable_h" }, "112": { "x": 440.0, "y": 568.0, "object_index": "obj_cable_v" }, "177": { "x": 336.0, "y": 576.0, "object_index": "obj_block_metal_v" }, "51": { "x": 584.0, "y": 552.0, "object_index": "obj_cable_v" }, "44": { "x": 232.0, "y": 456.0, "object_index": "obj_cable_rd" }, "29": { "x": 424.0, "y": 600.0, "object_index": "obj_cable_h" }, "53": { "x": 584.0, "y": 504.0, "object_index": "obj_cable_ld" }, "124": { "x": 328.0, "y": 568.0, "object_index": "obj_cable_h" }, "185": { "x": 496.0, "y": 320.0, "object_index": "obj_block_metal_v" }, "43": { "x": 248.0, "y": 456.0, "object_index": "obj_cable_h" }, "161": { "x": 456.0, "y": 536.0, "object_index": "obj_cable_v" }, "103": { "x": 360.0, "y": 488.0, "object_index": "obj_bridge_d" }, "97": { "x": 360.0, "y": 520.0, "object_index": "obj_cable_h" }, "108": { "x": 440.0, "y": 504.0, "object_index": "obj_cable_v" }, "145": { "x": 544.0, "y": 504.0, "object_index": "obj_and_gate_right" }, "75": { "x": 328.0, "y": 584.0, "object_index": "obj_cable_h" }, "10": { "x": 264.0, "y": 584.0, "object_index": "obj_cable_v" }, "78": { "x": 376.0, "y": 584.0, "object_index": "obj_cable_h" }, "91": { "x": 360.0, "y": 488.0, "object_index": "obj_cable_h" }, "39": { "x": 312.0, "y": 456.0, "object_index": "obj_cable_h" }, "126": { "x": 360.0, "y": 568.0, "object_index": "obj_cable_h" }, "153": { "x": 504.0, "y": 520.0, "object_index": "obj_cable_h" }, "24": { "x": 344.0, "y": 600.0, "object_index": "obj_cable_h" }, "160": { "x": 456.0, "y": 568.0, "object_index": "obj_cable_v" }, "41": { "x": 280.0, "y": 456.0, "object_index": "obj_cable_h" }, "187": { "x": 336.0, "y": 255.999969482421875, "object_index": "obj_block_metal_v" }, "40": { "x": 296.0, "y": 456.0, "object_index": "obj_cable_h" }, "34": { "x": 392.0, "y": 456.0, "object_index": "obj_cable_h" }, "189": { "x": 448.0, "y": 239.999969482421875, "object_index": "obj_block_metal" }, "110": { "x": 440.0, "y": 536.0, "object_index": "obj_cable_v" }, "114": { "x": 472.0, "y": 600.0, "object_index": "obj_cable_h" }, "60": { "x": 600.0, "y": 536.0, "object_index": "obj_cable_v" }, "56": { "x": 568.0, "y": 504.0, "object_index": "obj_cable_h" }, "105": { "x": 552.0, "y": 568.0, "object_index": "obj_cable_h" }, "18": { "x": 264.0, "y": 568.0, "object_index": "obj_cable_h" }, "35": { "x": 376.0, "y": 456.0, "object_index": "obj_cable_h" }, "86": { "x": 296.0, "y": 488.0, "object_index": "obj_cable_h" }, "23": { "x": 312.0, "y": 600.0, "object_index": "obj_cable_h" }, "38": { "x": 328.0, "y": 456.0, "object_index": "obj_cable_h" }, "167": { "x": 456.0, "y": 584.0, "object_index": "obj_cable_ru" }, "171": { "x": 448.0, "y": 608.0, "object_index": "obj_portal" }, "37": { "x": 344.0, "y": 456.0, "object_index": "obj_cable_h" }, "163": { "x": 456.0, "y": 472.0, "object_index": "obj_cable_v" }, "132": { "x": 376.0, "y": 536.0, "object_index": "obj_cable_h" }, "165": { "x": 456.0, "y": 520.0, "object_index": "obj_cable_ru" }, "13": { "x": 280.0, "y": 536.0, "object_index": "obj_cable_h" }, "19": { "x": 264.0, "y": 504.0, "object_index": "obj_cable_h" }, "15": { "x": 248.0, "y": 504.0, "object_index": "obj_cable_rd" }, "106": { "x": 440.0, "y": 472.0, "object_index": "obj_cable_v" }, "139": { "x": 536.0, "y": 552.0, "object_index": "obj_cable_h" }, "64": { "x": 296.0, "y": 536.0, "object_index": "obj_cable_h" }, "20": { "x": 280.0, "y": 600.0, "object_index": "obj_cable_h" }, "107": { "x": 440.0, "y": 488.0, "object_index": "obj_cable_v" }, "84": { "x": 376.0, "y": 552.0, "object_index": "obj_cable_h" }, "104": { "x": 552.0, "y": 504.0, "object_index": "obj_cable_h" }, "32": { "x": 424.0, "y": 456.0, "object_index": "obj_cable_h" }, "168": { "x": 448.0, "y": 528.0, "object_index": "obj_switch_on_d" }, "83": { "x": 360.0, "y": 552.0, "object_index": "obj_cable_h" }, "175": { "x": 384.0, "y": 656.0, "object_index": "obj_block_metal" }, "141": { "x": 536.0, "y": 520.0, "object_index": "obj_cable_h" }, "117": { "x": 520.0, "y": 600.0, "object_index": "obj_cable_h" }, "131": { "x": 360.0, "y": 536.0, "object_index": "obj_cable_h" }, "2": { "x": 384.0, "y": 464.0, "object_index": "obj_switch_on_d" }, "6": { "x": 384.0, "y": 528.0, "object_index": "obj_switch_on_d" }, "30": { "x": 440.0, "y": 600.0, "object_index": "obj_cable_h" }, "147": { "x": 360.0, "y": 504.0, "object_index": "obj_cable_h" }, "102": { "x": 360.0, "y": 472.0, "object_index": "obj_cable_h" }, "179": { "x": 336.0, "y": 448.0, "object_index": "obj_block_metal_v" }, "12": { "x": 264.0, "y": 536.0, "object_index": "obj_cable_rd" }, "92": { "x": 376.0, "y": 488.0, "object_index": "obj_cable_h" }, "27": { "x": 392.0, "y": 600.0, "object_index": "obj_cable_h" }, "57": { "x": 600.0, "y": 584.0, "object_index": "obj_cable_v" }, "111": { "x": 440.0, "y": 552.0, "object_index": "obj_cable_v" }, "135": { "x": 344.0, "y": 504.0, "object_index": "obj_cable_h" }, "25": { "x": 360.0, "y": 600.0, "object_index": "obj_cable_h" }, "154": { "x": 472.0, "y": 552.0, "object_index": "obj_cable_h" }, "70": { "x": 392.0, "y": 504.0, "object_index": "obj_cable_v" }, "166": { "x": 456.0, "y": 552.0, "object_index": "obj_cable_ru" }, "77": { "x": 360.0, "y": 584.0, "object_index": "obj_cable_h" }, "123": { "x": 312.0, "y": 568.0, "object_index": "obj_cable_h" }, "67": { "x": 392.0, "y": 520.0, "object_index": "obj_cable_lu" }, "74": { "x": 312.0, "y": 584.0, "object_index": "obj_cable_h" }, "101": { "x": 376.0, "y": 472.0, "object_index": "obj_cable_h" }, "71": { "x": 392.0, "y": 536.0, "object_index": "obj_cable_v" }, "82": { "x": 344.0, "y": 552.0, "object_index": "obj_cable_h" }, "174": { "x": 448.0, "y": 656.0, "object_index": "obj_block_metal" }, "17": { "x": 248.0, "y": 552.0, "object_index": "obj_cable_v" }, "158": { "x": 472.0, "y": 584.0, "object_index": "obj_cable_h" }, "186": { "x": 496.0, "y": 255.999969482421875, "object_index": "obj_block_metal_v" }, "31": { "x": 440.0, "y": 456.0, "object_index": "obj_cable_ld" }, "22": { "x": 328.0, "y": 600.0, "object_index": "obj_cable_h" }, "93": { "x": 296.0, "y": 520.0, "object_index": "obj_cable_h" }, "58": { "x": 600.0, "y": 568.0, "object_index": "obj_cable_v" }, "42": { "x": 264.0, "y": 456.0, "object_index": "obj_cable_h" }, "172": { "x": 496.0, "y": 576.0, "object_index": "obj_block_metal_v" }, "150": { "x": 504.0, "y": 488.0, "object_index": "obj_cable_h" }, "7": { "x": 384.0, "y": 560.0, "object_index": "obj_switch_on_d" }, "148": { "x": 472.0, "y": 488.0, "object_index": "obj_cable_h" }, "36": { "x": 360.0, "y": 456.0, "object_index": "obj_cable_h" }, "170": { "x": 384.0, "y": 608.0, "object_index": "obj_portal_5" }, "142": { "x": 520.0, "y": 488.0, "object_index": "obj_cable_h" }, "118": { "x": 536.0, "y": 600.0, "object_index": "obj_cable_h" }, "55": { "x": 568.0, "y": 568.0, "object_index": "obj_cable_h" }, "113": { "x": 456.0, "y": 600.0, "object_index": "obj_cable_h" }, "94": { "x": 312.0, "y": 520.0, "object_index": "obj_cable_h" }, "45": { "x": 232.0, "y": 472.0, "object_index": "obj_cable_v" }, "63": { "x": 240.0, "y": 536.0, "object_index": "obj_and_gate_left" }, "33": { "x": 408.0, "y": 456.0, "object_index": "obj_cable_h" } }
//');
//	/**///array_push(global.levelData,@'');
//	/*Karm Portal Launch*/array_push(global.levelData,@'{ "51": { "x": 640.0, "y": 528.0, "object_index": "obj_block_large" }, "30": { "x": 496.0, "y": 488.0, "object_index": "obj_block" }, "37": { "x": 368.0, "y": 456.0, "object_index": "obj_block" }, "8": { "x": 336.0, "y": 360.0, "object_index": "obj_cash_wad" }, "23": { "x": 400.0, "y": 536.0, "object_index": "obj_block" }, "24": { "x": 368.0, "y": 520.0, "object_index": "obj_block" }, "43": { "x": 464.0, "y": 424.0, "object_index": "obj_block" }, "3": { "x": 240.0, "y": 296.0, "object_index": "obj_block" }, "39": { "x": 496.0, "y": 424.0, "object_index": "obj_block" }, "42": { "x": 368.0, "y": 424.0, "object_index": "obj_block" }, "21": { "x": 464.0, "y": 520.0, "object_index": "obj_block" }, "46": { "x": 192.0, "y": 320.0, "object_index": "obj_block_large" }, "2": { "x": 240.0, "y": 264.0, "object_index": "obj_block" }, "31": { "x": 464.0, "y": 488.0, "object_index": "obj_block" }, "22": { "x": 432.0, "y": 536.0, "object_index": "obj_block" }, "7": { "x": 592.0, "y": 296.0, "object_index": "obj_block" }, "4": { "x": 688.0, "y": 296.0, "object_index": "obj_block" }, "1": { "x": 144.0, "y": 296.0, "object_index": "obj_block" }, "38": { "x": 336.0, "y": 424.0, "object_index": "obj_block" }, "28": { "x": 336.0, "y": 488.0, "object_index": "obj_block" }, "18": { "x": 464.0, "y": 392.0, "object_index": "obj_block" }, "16": { "x": 496.0, "y": 520.0, "object_index": "obj_block" }, "35": { "x": 464.0, "y": 456.0, "object_index": "obj_block" }, "19": { "x": 336.0, "y": 392.0, "object_index": "obj_block" }, "41": { "x": 432.0, "y": 440.0, "object_index": "obj_block" }, "25": { "x": 336.0, "y": 520.0, "object_index": "obj_block" }, "32": { "x": 400.0, "y": 472.0, "object_index": "obj_block" }, "48": { "x": 640.0, "y": 272.0, "object_index": "obj_coin_pouch" }, "15": { "x": 496.0, "y": 552.0, "object_index": "obj_block" }, "40": { "x": 400.0, "y": 440.0, "object_index": "obj_block" }, "29": { "x": 368.0, "y": 488.0, "object_index": "obj_block" }, "5": { "x": 688.0, "y": 264.0, "object_index": "obj_block" }, "55": { "x": 192.0, "y": 480.0, "object_index": "obj_portal" }, "12": { "x": 336.0, "y": 552.0, "object_index": "obj_block" }, "56": { "x": 640.0, "y": 608.0, "object_index": "obj_bumper" }, "27": { "x": 432.0, "y": 504.0, "object_index": "obj_block" }, "49": { "x": 640.0, "y": 320.0, "object_index": "obj_block_large" }, "14": { "x": 464.0, "y": 552.0, "object_index": "obj_block" }, "36": { "x": 336.0, "y": 456.0, "object_index": "obj_block" }, "45": { "x": 432.0, "y": 408.0, "object_index": "obj_block" }, "53": { "x": 192.0, "y": 560.0, "object_index": "obj_block_large" }, "57": { "x": 192.0, "y": 608.0, "object_index": "obj_bumper" }, "0": { "x": 144.0, "y": 264.0, "object_index": "obj_block" }, "6": { "x": 592.0, "y": 264.0, "object_index": "obj_block" }, "10": { "x": 432.0, "y": 456.0, "object_index": "obj_cash_wad" }, "9": { "x": 496.0, "y": 360.0, "object_index": "obj_cash_wad" }, "26": { "x": 400.0, "y": 504.0, "object_index": "obj_block" }, "20": { "x": 368.0, "y": 392.0, "object_index": "obj_block" }, "54": { "x": 640.0, "y": 480.0, "object_index": "obj_portal" }, "17": { "x": 496.0, "y": 392.0, "object_index": "obj_block" }, "44": { "x": 400.0, "y": 408.0, "object_index": "obj_block" }, "13": { "x": 368.0, "y": 552.0, "object_index": "obj_block" }, "34": { "x": 496.0, "y": 456.0, "object_index": "obj_block" }, "52": { "x": 192.0, "y": 528.0, "object_index": "obj_block_large" }, "33": { "x": 432.0, "y": 472.0, "object_index": "obj_block" }, "47": { "x": 192.0, "y": 272.0, "object_index": "obj_coin_pouch" }, "50": { "x": 640.0, "y": 560.0, "object_index": "obj_block_large" }, "11": { "x": 400.0, "y": 456.0, "object_index": "obj_cash_wad" } }');
		
//	for(var i = 0;i<array_length(global.levelData);i++){
//		global.levelData[@i] = json_parse(global.levelData[i]);
//	}	
//}

//function level_load_ext_old(_i){
//	if !range(_i, 0, array_length(global.levelData) - 1) exit;
//	var _keys = variable_struct_get_names(global.levelData[_i]);
//	for(var i = 0;i<array_length(_keys);i++){
//		var _struct = variable_struct_get(global.levelData[_i],_keys[i]);
//		with(instance_create_layer(_struct.x, _struct.y, "Instances", asset_get_index(_struct.object_index))){
//			if object_is_ancestor(object_index, obj_cable) obj_layer = 1 else obj_layer = 0;
//		}
//	}
//	with par_bricklike event_perform(ev_other, ev_user15);
//}


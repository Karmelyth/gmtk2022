// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function say_line(sound, _func = -1, important = true) {
	
	var entry = new VoicelineEntry(sound, _func, important),
		queue = get_voiceline_queue();
	
	queue.push(entry)
	
	//If this is the only thing in the queue, its new and needs to be started.
	if queue.length() == 1 {
		start_saying_line(entry)
	}
}

/// @context noone
function start_saying_line(voice_entry) {
	
	global.elvis_sound = sound_play_pitch(voice_entry.sound, 1)
	
	with obj_elvis {
		sprite_index = spr_elvis_talk_start
		if voice_entry.sound == vo_eat {
			sprite_index = spr_elvis_eat	
		}
		image_index = 0
	}
}

/// @context obj_elvis
function stop_saying_line() {
	var q = get_voiceline_queue(),
		//Removes topmost element, progressing the queue.
		entry = q.pop();
		
	//Execute function now that the line is over.
	if !is_undefined(entry) {
		if entry.func != -1 {
			entry.func()
		}
	}
	
	//Prevent chatter for at least a few seconds.
	with gamecont alarm[0] = max(room_speed * 8, alarm[0])
	
	//If there is anything in the queue, start playing it.
	var top = get_voiceline_queue().top();
	if !is_undefined(top) {
		start_saying_line(top)
	}
}

function getNextSprite (current_sprite) {
	switch (current_sprite) {
		case spr_elvis_talk_start:
			return spr_elvis_talk_loop
		case spr_elvis_talk_loop:
			if !elvis_sound_active() {
				global.elvis_done = true
				return spr_elvis_talk_end
			}
			return spr_elvis_talk_loop
		case spr_elvis_eat:
			return spr_elvis_talk_loop;
		default:
			return spr_elvis_idle
	}
}

function elvis_is_speaking() {
	with obj_elvis {
		if sprite_index == spr_elvis_talk_loop || sprite_index == spr_elvis_talk_end {
			return true;
		}
	}
	return elvis_sound_active();
}

function elvis_sound_active() {
	if !variable_global_exists("elvis_sound") return false
	return audio_is_playing(global.elvis_sound)
}


/// @desc Gets the voiceline queue. This just means theres not another global to initialize.
/// @return {Struct.FifoQueue} The voiceline queue.
function get_voiceline_queue() {
	static queue = new FifoQueue();
	return queue;
}


// First In First Out queue
/// @self FifoQueue
function FifoQueue() constructor {
	contents = []
	
	static isActive = function() {
		return array_length(contents) > 0;
	}
	
	static length = function() {
		return array_length(contents)
	}

	static pop = function() {
		return array_pop(contents);
	}
	
	static top = function() {
		if array_length(contents) == 0 return undefined
		return contents[array_length(contents) - 1]
	}
	
	static push = function(entry) {
		array_insert(contents, 0, entry)
		return self
	}
	
	static add = function(entry) {
		return push(entry)
	}
	
	static clear = function() {
		contents = []
	}
}


function VoicelineEntry(voiceline, whencomplete = -1, is_important = true) constructor {
	sound = voiceline
	func = whencomplete
	important = is_important
}
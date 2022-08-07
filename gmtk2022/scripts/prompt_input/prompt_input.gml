// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function prompt_input(prompt_text, when_complete, can_cancel = true) {
	with instance_create_depth(0, 0, 0, obj_text_prompt) {
		cancellable = can_cancel
		on_completion = when_complete
		prompt = prompt_text
		
		return self
	}
}
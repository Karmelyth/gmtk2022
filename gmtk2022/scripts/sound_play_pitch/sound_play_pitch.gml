// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sound_play_pitch(sound, pitch){
	var snd = audio_play_sound(sound, 1, 0);
	audio_sound_pitch(snd, pitch);
	return snd;
}
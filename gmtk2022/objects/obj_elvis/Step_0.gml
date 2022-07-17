/// @description Insert description here
// You can write your code in this editor
if wait wait -= 1

if waitforvoiceline > 0 {
	waitforvoiceline -= 1
	if waitforvoiceline <= 0 {
		if room == intro_room{
			say_line(vo_intro, function() {
				with instance_create_depth(x, y, depth + 2, obj_fade_to) {
					destination = a_roominit;
				}
			})
		}else if room == end_room{
			var _win = false;
			if global.money > 6000{
				_win = true;	
			}
			say_line(_win ? vo_endgame_win : vo_endgame_lose, function() {
					game_end();
				}
			);
		}
	}
}

if progress < 1 && wait <= 0 {
	progress += .025
	waitforvoiceline = 60
}
image_xscale = lerp(xscale, 1,sqr(progress))
image_yscale = lerp(yscale, 1,sqr(progress))
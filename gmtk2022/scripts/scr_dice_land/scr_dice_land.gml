// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dice_land(){
	if !has_bounced{
		say_line(choose(vo_miss01, vo_miss02, vo_miss03, vo_miss04, vo_miss05), function(){
			end_round()
		})
	}else{
		end_round()	
	}
}
/// @description Insert description here
// You can write your code in this editor
if wait wait -= 1

if waitforvoiceline > 0 {
	waitforvoiceline -= 1
	if waitforvoiceline <= 0 {
		say_line(vo_intro, function() {
			with instance_create_depth(x, y, depth + 2, obj_fade_to) {
				destination = room_test;
			}
		})
	}
}

if progress < 1 && wait <= 0 {
	progress += .025
	waitforvoiceline = 60
}
image_xscale = lerp(xscale, 1,sqr(progress))
image_yscale = lerp(yscale, 1,sqr(progress))
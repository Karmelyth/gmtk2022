/// @description Insert description here
var _c = obj_board.canplace ? c_lime : c_red;
if(obj_board.canplace){
	gpu_set_fog(true, _c, 0, 0);
	draw_sprite(sprite_index,image_index,x - 1,y);
	draw_sprite(sprite_index,image_index,x + 1,y);
	draw_sprite(sprite_index,image_index,x,y - 1);
	draw_sprite(sprite_index,image_index,global.payoutLast,y + 1);
	gpu_set_fog(false, _c, 0, 0);
}else{
	gpu_set_fog(true, _c, 0, 0);
	draw_sprite(sprite_index,image_index,x,y);
	gpu_set_fog(false, _c, 0, 0);
}
	
draw_set_alpha(.7);
draw_sprite(sprite_index,image_index,x,y);
draw_set_alpha(1);

instance_destroy();
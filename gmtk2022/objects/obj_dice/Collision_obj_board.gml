/// @description Insert description here
// You can write your code in this editor
{
	if (touchedBottom) exit;
	if rectangle_in_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,other.bbox_left,other.bbox_bottom,other.bbox_right,other.bbox_bottom){
		vspeed = 0;
		y = yprevious;
		on_dice_bounce(self);
		touchedBottom = true;
	}
}
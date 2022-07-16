// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function vector_get_length_on_axis(vectorLength, vectorDir, axisAngle) {
	//Thank you YOKIN
	return lengthdir_x(lengthdir_x(vectorLength, vectorDir), axisAngle) + lengthdir_y(lengthdir_y(vectorLength, vectorDir), axisAngle);

}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_for_player(){
	var _dis = distance_to_object(o_player);
	move_towards_point(o_player.x, o_player.y, 1);
}
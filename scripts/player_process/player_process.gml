// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reset_variables() {
	left = 0;
	right = 0;
	up = 0;
	down = 0;
} 

function get_input(){
	if keyboard_check(ord("A")) left = 1;
	if keyboard_check(ord("D")) right = 1;
	if keyboard_check(ord("W")) up = 1;
	if keyboard_check(ord("S")) down = 1;
}

function calc_movement() {
    var _hmove = right - left;
    var _vmove = down - up;
    
    if (_hmove != 0 || _vmove != 0) {
        var _dir = point_direction(0, 0, _hmove, _vmove);
        
        _hmove = lengthdir_x(walk_spd, _dir);
        _vmove = lengthdir_y(walk_spd, _dir);
        
        x += _hmove;
        y += _vmove;
        
        if (_hmove > 0) {
            sprite_index = s_player_r;
        } else if (_hmove < 0) {
            sprite_index = s_player_l;
        }
    }
}

function check_fire() {
	if mouse_check_button(mb_left) {
		if can_fire {
			can_fire = false;
			alarm[0] = fire_rate;
			
			var _dir = point_direction(x, y, mouse_x, mouse_y);
			
			var _inst = instance_create_layer(x, y, "Arrow", o_arrow);
			with(_inst) {
				speed = other.arrow_speed;
				direction = _dir;
				image_angle = _dir;
				owner_id = other;
			}
		}	
	}
}
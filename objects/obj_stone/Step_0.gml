/// @description Insert description here
if (target != noone) {
	if (instance_exists(target)) {
		image_angle = point_direction(x,y,target.x,target.y);
	}
}

if (sprite_index == spr_bullet_stone_destroy) {
	speed = 5;
}
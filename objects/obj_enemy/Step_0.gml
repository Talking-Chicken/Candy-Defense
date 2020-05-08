if (place_meeting(x,y,obj_goal)) {
	instance_destroy(self);
	ds_list_delete(global.enemy_chess, ds_list_find_index(global.enemy_chess, self));
	global.current_health -= atk;
}

if (hp <= 0) {
	instance_destroy(self);
	ds_list_delete(global.enemy_chess, ds_list_find_index(global.enemy_chess, self));
}
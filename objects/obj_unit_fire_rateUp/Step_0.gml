event_inherited();
if (ds_exists(global.player_chess,ds_type_list)) {
	for (var i = 0; i < ds_list_size(global.player_chess); i++) {
		var unit_to_powerUp = global.player_chess[| i];
		var dis = point_distance(x,y,unit_to_powerUp.x,unit_to_powerUp.y);
		if (ds_list_find_index(power_up, unit_to_powerUp) == -1 && dis <= range+20) {
			ds_list_add(power_up, unit_to_powerUp);
			unit_to_powerUp.fire_rate_powerUp += 13;
		}
	}
}
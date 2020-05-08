if (global.stage_current == global.stage_enemy) {
	if (global.current_enemy_num < global.total_enemy_num) {
		if (room == room0 || room == room1) {
		var unit = instance_create_layer(1900, 416, "unit", obj_unit_goblin);
		}
		if (room == room2) {
		var unit = instance_create_layer(1920, 256, "unit", obj_unit_goblin);	
		}
		if (room == room3) {
		var unit = instance_create_layer(1920, 256, "unit", obj_unit_goblin);	
		}
		
		ds_list_add(global.enemy_chess, unit);
		global.current_enemy_num++;
		global.stage_current = global.stage_enemy_units_moving;
	} else {
		global.stage_current = global.stage_enemy_units_moving;
	}
}
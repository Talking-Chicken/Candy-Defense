if (ds_exists(units, ds_type_list)) {
	ds_list_destroy(units);
} if (ds_exists(global.player_chess, ds_type_list)) {
	ds_list_destroy(global.player_chess);
} if (ds_exists(global.enemy_chess, ds_type_list)) {
	ds_list_destroy(global.enemy_chess);
} if (ds_exists(atk_list, ds_type_list)) {
	ds_list_destroy(atk_list);
} if (ds_exists(fire_rate_list, ds_type_list)) {
	ds_list_destroy(fire_rate_list);
} if (ds_exists(range_list, ds_type_list)) {
	ds_list_destroy(range_list);
} if (ds_exists(sp_list, ds_type_list)) {
	ds_list_destroy(sp_list);
}